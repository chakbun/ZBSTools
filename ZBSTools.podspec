Pod::Spec.new do |s|

  s.name         = "ZBSTools"
  s.version      = "0.0.1"
  s.summary      = "Using Swift more conveniently, smoothly"

  s.description  = <<-DESC
                    Using Swift more conveniently, smoothly
                   DESC

  s.homepage     = "https://github.com/chakbun"

  s.license      = { :type => "MIT", :file => "FILE_LICENSE" }
  s.author             = { "Jaben" => "cheungjaben@hotmail.com" }

  s.platform     = :ios
  s.platform     = :ios, "9.0"
  s.source       = { :git => "https://github.com/chakbun/ZBSTools.git", :tag => "#{s.version}" }

  s.source_files  = "Sources", "Sources/**/*.{swift}"

  s.requires_arc = true
  s.pod_target_xcconfig = { 'SWIFT_VERSION' => '5.0' }
  s.swift_version = '5.0'

end