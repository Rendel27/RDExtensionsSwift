#
# Be sure to run `pod lib lint RDExtensionsSwift.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'RDExtensionsSwift'
  s.version          = '1.0.0'
  s.summary          = 'RDExtensionsSwift by Rendel (me@rendel.ge)'
  s.description      = <<-DESC
Nice extensions for Swift by Rendel (me@rendel.ge)
                       DESC
  s.homepage         = 'https://github.com/Rendel27/RDExtensionsSwift'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Giorgi Iashvili' => 'me@rendel.ge' }
  s.source           = { :git => 'https://github.com/Rendel27/RDExtensionsSwift.git', :tag => s.version.to_s }
  s.ios.deployment_target = '8.0'
  s.source_files = 'RDExtensionsSwift/RDExtensionsSwift/Source/**/*'
end
