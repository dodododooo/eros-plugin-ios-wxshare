# coding: utf-8
Pod::Spec.new do |s|
  s.name         = "ErosPluginWXShare"
  s.version      = "1.1.5"
  s.summary      = "ErosPluginUMShare Source ."
  s.homepage     = 'https://github.com/LiHuiZai/eros-plugin-ios-wxshare'
  s.license      = "MIT"
  s.authors      = { "xionghuayu" => "18601949015@163.com" }
  s.platform     = :ios
  s.ios.deployment_target = "8.0"
  s.source = { :git => 'https://github.com/LiHuiZai/eros-plugin-ios-wxshare.git', :tag => s.version.to_s }

  s.source_files = "Source/*.{h,m,mm}"
  s.requires_arc = true
  s.dependency 'UMCShare/Social/ReducedWeChat', '6.9.9'
  s.dependency 'WechatOpenSDK', '1.8.7.1'
  
end
