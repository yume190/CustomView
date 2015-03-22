Pod::Spec.new do |s|
  s.name     = 'CustomViewKit'
  s.version  = '1.0'
  s.license  = 'MIT'
  s.summary  = "A Light weight Lib, custom a view with xib & live render"
  s.homepage = 'https://github.com/yume190/CustomView'
  s.authors  = { 'yume190' => 'yume190@gmail.com' }
  s.social_media_url = "https://www.facebook.com/yume190"
  s.source   = { :git => 'https://github.com/yume190/CustomView.git', :tag => s.version }
  s.source_files = 'CustomViewKit/*.swift'
  s.requires_arc = true
end
