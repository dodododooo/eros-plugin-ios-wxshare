//
//  AppOpenMiniprogramModel.m
//  AFNetworking
//
//  Created by lh on 2020/7/15.
//

#import "AppOpenMiniprogramModel.h"
#import <WeexPluginLoader/WeexPluginLoader/WeexPluginLoader.h>
#import "WXApi.h"
#import "BMMediatorManager.h"
#import "NSDictionary+Util.h"

#import <YYModel/YYModel.h>

#import "BMDefine.h"

WX_PlUGIN_EXPORT_MODULE(ErosOpenMiniprogram, AppOpenMiniprogramModel)
@interface AppOpenMiniprogramModel () <WXApiDelegate>
@property (nonatomic, assign) BOOL WXAppIsInstall;

@end

@implementation AppOpenMiniprogramModel

@synthesize weexInstance;

WX_EXPORT_METHOD_SYNC(@selector(isInstallWXApp))
WX_EXPORT_METHOD_SYNC(@selector(open:path:type:))
WX_EXPORT_METHOD_SYNC(@selector(openMarket:towhich:))

/** 判断是否安装了微信 */
-(BOOL)isInstallWXApp
{
    dispatch_sync(dispatch_get_main_queue(), ^{
        self.WXAppIsInstall = [WXApi isWXAppInstalled];
    });
    return self.WXAppIsInstall;
}

-(void)open:(NSString *)userName path:(NSString *)path type:(WXMiniProgramType)miniProgramType
{
   dispatch_async(dispatch_get_main_queue(), ^{
      WXLaunchMiniProgramReq *launchMiniProgramReq = [WXLaunchMiniProgramReq object];
         launchMiniProgramReq.userName = userName;
         launchMiniProgramReq.path = path;
         launchMiniProgramReq.miniProgramType = miniProgramType;

         return  [WXApi sendReq:launchMiniProgramReq completion:nil];
       
   });
   
}
-(void)openMarket:(NSString *)appId towhich:(NSString *)name {

    dispatch_async(dispatch_get_main_queue(), ^{
        
        NSString *version = [UIDevice currentDevice].systemVersion;
            NSString *appstoreUrlString;
            if ([name isEqualToString:@"comment"]) {
                appstoreUrlString = [NSString stringWithFormat:@"itms-apps://itunes.apple.com/cn/app/id%@?mt=8&action=write-review",appId];
            }else{
                appstoreUrlString = [NSString stringWithFormat:@"itms-apps://itunes.apple.com/app/id%@",appId];//
            }
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:appstoreUrlString]];
        
    });

}

- (BOOL)applicationOpenURL:(NSUserActivity *)userActivity
{

        return [WXApi handleOpenUniversalLink:userActivity delegate:self];

    return YES;
}
-(void)onReq:(BaseReq *)req
{
    if ([req isKindOfClass:[LaunchFromWXReq class]]) {
        LaunchFromWXReq *smallPro = (LaunchFromWXReq *)req;
        WXMediaMessage *meessage = smallPro.message;
        NSLog(@"meeage = %@", meessage);
    }
}
@end
