Pod::Spec.new do |s|

  version        = "0.0.1"
  s.name         = "DJRouter"
  s.version      = version
  s.summary      = "A simple Controller router."
  s.homepage     = "https://github.com/JefferDevs/DJRouter.git"
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.author       = { "JefferDevs" => "https://github.com/JefferDevs" }
  s.platform     = :ios, '8.0'
  s.source       = { :git => "https://github.com/JefferDevs/DJRouter.git", :tag => version }
  s.source_files  = 'DJRouter/*' 
  s.requires_arc = true

end