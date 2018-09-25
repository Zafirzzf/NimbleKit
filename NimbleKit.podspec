
Pod::Spec.new do |s|

  s.name         = "NimbleKit"
  s.version      = "1.0.3"
  s.summary      = "Quickly create UIKit."
  s.description  = <<-DESC
                    Quickly create UIKit.
                   DESC
  s.homepage     = "https://github.com/Zafirzzf/NimbleKit"
  s.license      = "MIT"
  s.author             = { "Zaifrzzf" => "Zoolofty@163.com" }
  s.source       = { :git => "https://github.com/Zafirzzf/NimbleKit.git", :tag => "v1.0.3" }
  s.source_files  = "NimbleKit/*.swift"
  s.exclude_files = "Classes/Exclude"
  s.ios.deployment_target  = '9.0'
  s.swift_version = '4.0'
  s.ios.framework  = 'UIKit'
  # s.public_header_files = "Classes/NimbleKit/NimbleUI.swift"

  # ――― Project Settings ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  If your library depends on compiler flags you can set them in the xcconfig hash
  #  where they will only apply to your library. If you depend on other Podspecs
  #  you can include multiple dependencies to ensure it works.

  # s.requires_arc = true

  # s.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }
  # s.dependency "JSONKit", "~> 1.4"

end
