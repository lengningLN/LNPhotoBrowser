

Pod::Spec.new do |spec|
  spec.name         = "LNPhotoBrowser"
  spec.version      = "1.1"
  spec.summary      = "一套友好的、方便集成的针对图片浏览框架！"
  spec.description  = <<-DESC
  一套友好的、方便集成的针对图片浏览框架！ 实现一个类似微信朋友圈中图片浏览的框架。
                   DESC

  spec.homepage     = "https://github.com/lengningLN/LNPhotoBrowser"


  spec.license      = "MIT"


  spec.author             = { "LengNing" => "577935917@qq.com" }

  spec.platform     = :ios, "5.0"


  spec.source       = { :git => "https://github.com/lengningLN/LNPhotoBrowser.git", :tag => spec.version }

  spec.source_files = "LNPhotoBrower/LNPhotoBrowser/*.{h,m}"
  spec.dependency  'SDWebImage'

end
