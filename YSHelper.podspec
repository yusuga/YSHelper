Pod::Spec.new do |s|
  s.name = 'YSHelper'
  s.version = '0.0.5'
  s.summary = 'iOS helper.'
  s.homepage = 'https://github.com/yusuga/YSHelper'
  s.license = 'MIT'
  s.author = 'Yu Sugawara'
  s.source = { :git => 'https://github.com/yusuga/YSHelper.git', :tag => s.version.to_s }
  s.platform = :ios, '7.0'
  s.ios.deployment_target = '7.0'
  s.source_files = 'Classes/YSHelper/*.{h,m}'
  s.requires_arc = true
  
  s.dependency 'CocoaLumberjack', '~> 2.0.0-rc'
  
  s.prefix_header_contents = "#import <CocoaLumberjack/CocoaLumberjack.h>
#ifdef DEBUG
    static const DDLogLevel ddLogLevel = DDLogLevelAll;
#else
    static const DDLogLevel ddLogLevel = DDLogLevelWarning;
#endif"
end