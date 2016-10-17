Pod::Spec.new do |s|
  s.name = 'YSUtility'
  s.version = '0.1.2'
  s.summary = 'iOS utilities.'
  s.homepage = 'https://github.com/yusuga/YSUtility'
  s.license = 'MIT'
  s.author = 'Yu Sugawara'
  s.source = { :git => 'https://github.com/yusuga/YSUtility.git', :tag => s.version.to_s }
  s.platform = :ios, '7.0'
  s.ios.deployment_target = '7.0'
  s.source_files = 'Classes/YSUtility/*.{h,m}'
  s.requires_arc = true
end