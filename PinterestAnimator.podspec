Pod::Spec.new do |s|
  s.name         = "PinterestAnimator"
  s.version      = "0.1"
  s.summary      = "PinterestAnimator like Pinterest 3.0++ App transition animation."
  s.homepage     = "https://github.com/xhzengAIB/PinterestAnimator"
  s.license      = "GPL v3"
  s.authors      = { "Jack" => "xhzengAIB@gmail.com" }
  s.source       = { :git => "https://github.com/xhzengAIB/PinterestAnimator.git", :tag => "v0.1" }
  s.frameworks   = 'Foundation', 'CoreGraphics', 'UIKit'
  s.platform     = :ios, '7.0'
  s.source_files = 'PinterestAnimator/**/*.{h,m}'
  s.requires_arc = true
end
