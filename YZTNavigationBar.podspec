Pod::Spec.new do |s|
s.name         = "YZTNavigationBar"
s.version      = "1.0.1"
s.summary      = "定制UINavigationBar样式，可全局统一设置默认样式，在各页面灵活定制自己的样式。"
s.homepage     = "https://github.com/wsj2012/YZTNavigationBar"
s.license      = "MIT"
s.author       = { "wsj_2012" => "time_now@yeah.net" }
s.source       = { :git => "https://github.com/wsj2012/YZTNavigationBar.git", :tag => "#{s.version}" }
s.requires_arc = true
s.ios.deployment_target = "9.0"
s.source_files  = "YZTNavigationBar/*.{swift}"
s.swift_version = '4.2'

end
