Pod::Spec.new do |s|
  s.name     = 'CustomView'
  s.version  = '1.4'
  s.license  = 'MIT'
  s.summary  = "A Light weight Lib, custom a view with xib & live render"
  s.homepage = 'https://github.com/yume190/CustomView'
  s.authors  = { 'yume190' => 'yume190@gmail.com' }
  s.social_media_url = "https://www.facebook.com/yume190"
  s.source   = { :git => 'https://github.com/yume190/CustomView.git', :tag => s.version }
  #s.ios.deployment_target = '8.0'
  s.platform = :ios, "8.0"
  s.source_files = 'CustomViewKit/*.swift'
  s.requires_arc = true
end

