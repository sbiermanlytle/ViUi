#
# Be sure to run `pod lib lint ViprUi.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'ViprUi'
  s.version          = '0.1.3'
  s.summary          = 'A lib for iOS interfaces'
  s.description      = <<-DESC
A lightweight lib for iOS interfaces
                       DESC

  s.homepage         = 'https://github.com/sbiermanlytle/ViprUi'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Sebastian Bierman-Lytle' => 'sbiermanlytle@gmail.com' }
  s.source           = { :git => 'https://github.com/sbiermanlytle/ViprUi.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/iioinc'

  s.ios.deployment_target = '8.0'

  s.source_files = 'ViprUi/Classes/**/*'
  
  # s.resource_bundles = {
  #   'ViprUi' => ['ViprUi/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
