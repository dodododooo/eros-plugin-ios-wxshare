# coding: utf-8
Pod::Spec.new do |s|
  s.name         = "ErosPluginWXShare"
  s.version      = "1.11.2"
  s.summary      = "ErosPluginUMShare Source ."
  s.homepage     = 'https://github.com/dodododooo/eros-plugin-ios-wxshare'
  s.license      = "MIT"
  s.authors      = { "xionghuayu" => "18601949015@163.com" }
  s.platform     = :ios
  s.ios.deployment_target = "8.0"
  s.source = { :git => 'https://github.com/dodododooo/eros-plugin-ios-wxshare.git', :tag => s.version.to_s }

  s.source_files = "Source/*.{h,m,mm}"
  s.requires_arc = true
  s.dependency 'UMShare/Social/WeChat'
  s.dependency 'UMCommon'
  s.dependency 'UMDevice'
end
