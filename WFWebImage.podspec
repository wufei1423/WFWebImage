#
#  Be sure to run `pod spec lint WFWebImage.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see https://guides.cocoapods.org/syntax/podspec.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |spec|


  spec.name         = "WFWebImage"
  spec.version      = "1.0.0"
  spec.summary      = "WFWebImage."



  spec.homepage     = "https://github.com/wufei1423"



  spec.license      = "MIT"
  


  spec.author       = { "吴飞" => "wufei1423@163.com" }



  spec.platform     = :ios, "8.0"


  spec.source       = { :git => "https://github.com/wufei1423/WFWebImage.git", :tag => "1.0.0" }


  spec.source_files  = "WFWebImage/WFWebImage/*"
  #spec.exclude_files = "Classes/Exclude"


  spec.requires_arc = true

end
