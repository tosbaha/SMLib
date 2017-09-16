Pod::Spec.new do |s|
  s.name        = "SMLib"
  s.version     = "1.0.1"
  s.summary     = "SuperMemo 2 Algorithm"
  s.homepage    = "https://github.com/tosbaha/SMLib"
  s.license     = { :type => "MIT" }
  s.authors     = { "tosbaha" => "mustafa_dur@hotmail.com"}

  s.requires_arc = true
  s.osx.deployment_target = "10.9"
  s.ios.deployment_target = "8.0"
  s.watchos.deployment_target = "2.0"
  s.tvos.deployment_target = "9.0"
  s.source   = { :git => "https://github.com/tosbaha/SMLib.git", :tag => s.version }
  s.source_files = "Source/*.swift"
  s.pod_target_xcconfig =  {
        'SWIFT_VERSION' => '4.0',
  }
end
