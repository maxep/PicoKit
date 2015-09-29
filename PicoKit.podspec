Pod::Spec.new do |s|
  s.name             = 'PicoKit'
  s.version          = '0.7.1'
  s.summary          = 'A light Web Service client framework targeting iOS platform.'
  s.homepage         = 'https://github.com/maxep/PicoKit'
  s.author           = { 	"William Yang" => "http://bulldog2011.github.io/",
                            "Maxime Epain" => "http://maxep.github.io/" }
  s.social_media_url = 'https://twitter.com/MaximeEpain'
  s.source           = { :git => 'https://github.com/maxep/PicoKit.git', :tag => "v#{s.version}" }
  s.license          = 'MIT'
  s.default_subspec  = 'WebService'

  s.library = 'xml2'
  s.xcconfig = { 'HEADER_SEARCH_PATHS' => '$(SDKROOT)/usr/include/libxml2' }

  # Platform setup
  s.requires_arc = true
  s.ios.deployment_target = '7.0'
  s.osx.deployment_target = '10.9'

  ### Subspecs
  
  s.subspec 'Core' do |cs|
    cs.source_files	= 'Pod/Core', 'Pod/Core/Converter', 'Pod/Core/Cache', 'Pod/Core/Schema', 'Pod/Core/XMLSupport'
    cs.dependency 	'PicoKit/XMLWriter'
    cs.dependency 	'PicoKit/OrderedDictionary'
    cs.dependency	'PicoKit/GDataXML-HTML'
  end
  
  s.subspec 'WebService' do |wss|
    wss.source_files   	= 'Pod/WebService'
    wss.dependency 		'PicoKit/Soap'
    wss.ios.frameworks 	= 'CFNetwork', 'MobileCoreServices', 'SystemConfiguration'
    wss.osx.frameworks 	= 'CoreServices', 'SystemConfiguration'
    wss.dependency 		'AFNetworking', '~> 2.6.0'
    wss.prefix_header_contents = <<-EOS
#import <Availability.h>
#if __IPHONE_OS_VERSION_MIN_REQUIRED
  #import <SystemConfiguration/SystemConfiguration.h>
  #import <MobileCoreServices/MobileCoreServices.h>
#else
  #import <SystemConfiguration/SystemConfiguration.h>
  #import <CoreServices/CoreServices.h>
#endif
EOS
  end
  
  s.subspec 'Soap' do |ss|
    ss.source_files   = 'Pod/SOAP', 'Pod/SOAP/SOAP11', 'Pod/SOAP/SOAP12'
    ss.dependency 		'PicoKit/Core'
  end
  
  s.subspec 'XMLWriter' do |xs|
    xs.source_files   = 'Pod/XMLWriter'
  end
  
  s.subspec 'OrderedDictionary' do |os|
    os.source_files   = 'Pod/OrderedDictionary'
  end
  
  s.subspec 'GDataXML-HTML' do |gs|
    gs.source_files   = 'Pod/GDataXML-HTML'
  end

end
