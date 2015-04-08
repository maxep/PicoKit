Pod::Spec.new do |s|
  s.name             = 'PicoKit'
  s.version          = '0.6.0'
  s.summary          = 'A light Web Service client framework targeting iOS platform.'
  s.homepage         = 'https://github.com/maxep/PicoKit'
  s.author           = { "Maxime Epain" => "maxime.epain@gmail.com" }
  s.social_media_url = 'https://twitter.com/MaximeEpain'
  s.source           = { :git => 'https://github.com/maxep/PicoKit.git', :tag => "v#{s.version}" }
  s.license          = 'MIT'
  s.default_subspec  = 'Pico'
  
  s.library = 'xml2'
  s.xcconfig = { 'HEADER_SEARCH_PATHS' => '$(SDKROOT)/usr/include/libxml2' }
  s.ios.frameworks = 'CFNetwork', 'Security', 'MobileCoreServices', 'SystemConfiguration'
  s.osx.frameworks = 'CoreServices', 'Security', 'SystemConfiguration'

  # Platform setup
  s.requires_arc = true
  s.ios.deployment_target = '6.1'
  s.osx.deployment_target = '10.7'

  # Preserve the layout of headers in the Code directory
  s.header_mappings_dir = 'Pod'

  ### Subspecs
  
  s.subspec 'Pico' do |ps|
    ps.dependency 'PicoKit/Core'
    ps.dependency 'PicoKit/Soap'
    ps.dependency 'PicoKit/WebService'
    ps.dependency 'PicoKit/XMLWriter'
    ps.dependency 'PicoKit/OrderedDictionary'
    ps.dependency 'AFNetworking', '~> 1.3.4'
    ps.dependency 'GDataXML-HTML', '~> 1.0.0'
  end
  
  s.subspec 'Core' do |cs|
    cs.source_files   = 'Pod/Core'
    cs.dependency       'PicoKit/Cache'
    cs.dependency       'PicoKit/Converter'
    cs.dependency       'PicoKit/Schema'
    cs.dependency       'PicoKit/XMLSupport'
  end
  
  s.subspec 'Soap' do |ss|
    ss.source_files   = 'Pod/SOAP'
    ss.dependency       'PicoKit/Soap11'
    ss.dependency       'PicoKit/Soap12'
  end
  
  s.subspec 'WebService' do |wss|
    wss.source_files   = 'Pod/WebService'
  end
  
  s.subspec 'XMLWriter' do |xs|
    xs.source_files   = 'Pod/XMLWriter'
  end
  
  s.subspec 'OrderedDictionary' do |os|
    os.source_files   = 'Pod/OrderedDictionary'
  end
  
  s.subspec 'Cache' do |cs|
    cs.source_files   = 'Pod/Core/Cache'
  end
  
  s.subspec 'Converter' do |cs|
    cs.source_files   = 'Pod/Core/Converter'
  end
  
  s.subspec 'Schema' do |ss|
    ss.source_files   = 'Pod/Core/Schema'
  end
  
  s.subspec 'XMLSupport' do |xs|
    xs.source_files   = 'Pod/Core/XMLSupport'
  end
  
  s.subspec 'Soap11' do |ss|
    ss.source_files   = 'Pod/SOAP/SOAP11'
  end
  
  s.subspec 'Soap12' do |ss|
    ss.source_files   = 'Pod/SOAP/SOAP12'
  end

end
