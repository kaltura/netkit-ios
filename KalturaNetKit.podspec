
suffix = '.0000'   # Dev mode
# suffix = ''       # Release

Pod::Spec.new do |s|
  s.name             = 'KalturaNetKit'
  s.version          = '1.6.0' + suffix
  s.summary          = 'NetKit: Kaltura Mobile Client Network SDK'
  s.homepage         = 'https://github.com/kaltura/netkit-ios'
  s.license          = { :type => 'AGPLv3', :text => 'AGPLv3' }
  s.author           = { 'Kaltura' => 'community@kaltura.com' }
  s.source           = { :git => 'https://github.com/kaltura/netkit-ios.git', :tag => 'v' + s.version.to_s }
  s.swift_version    = '5.0'
  
  s.ios.deployment_target = '9.0'
  s.tvos.deployment_target = '9.0'
  
  s.default_subspec = 'Core'
  
  s.subspec 'Core' do |sp|
    sp.source_files = 'NetKit/Classes/Core/**/*'
    sp.dependency 'SwiftyJSON', '5.0.0'
  end
  
  s.subspec 'Services' do |sp|
    sp.source_files = 'NetKit/Classes/Services/**/*'
    sp.dependency 'KalturaNetKit/Core'
  end
  
end

