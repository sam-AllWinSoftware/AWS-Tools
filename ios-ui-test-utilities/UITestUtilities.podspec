#
#  Be sure to run `pod spec lint UITestUtilities.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#

Pod::Spec.new do |s|
  s.name         = "UITestUtilities"
  s.version      = "0.0.1"
  s.summary      = "Common iOS UI test helpers"
  s.homepage     = ""
  s.license      = ""
  s.author       = { "Aylwing Olivas" => "aolivas@suncommunities.com" }
  s.source       = { }
  s.source_files = "Sources/UITestUtilities/**/*"
  s.dependency 'UITestUtilitiesApp'
  s.framework    = "XCTest"
  s.ios.deployment_target = '9.0'
end
