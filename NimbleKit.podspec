


Pod::Spec.new do |s|

# ―――  Spec Metadata  ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
#
#  These will help people to find your library, and whilst it
#  can feel like a chore to fill in it's definitely to your advantage. The
#  summary should be tweet-length, and the description more in depth.
#

s.name         = "NimbleKit"
s.version      = "2.0.2"
s.summary      = "A nimble way to setup View by Swift."

s.description  = <<-DESC
    A nimble way to setup View by Swift, More flexible and convenient
DESC
s.homepage     = "https://github.com/Zafirzzf/NimbleKit"
s.license      = { :type => "MIT", :file => "LICENSE" }
s.author       = { "zhouzf" => "Zoolofty@163.com" }
s.ios.deployment_target  = '9.0'
s.swift_version = '4.0'
s.source       = { :git => "https://github.com/Zafirzzf/NimbleKit.git", :tag => "v2.0.2" }
s.source_files  = "NimbleKit/*"
end
