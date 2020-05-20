Pod::Spec.new do |s|
    s.name         = 'WFWebImage'
    s.version      = '1.0.3'
    s.summary      = 'WFWebImage'
    s.homepage     = 'https://github.com/wufei1423'
    s.license      = 'MIT'
    s.authors      = {'吴飞' => 'wufei1423@163.com'}
    s.platform     = :ios, '8.0'
    s.source       = {:git => 'https://github.com/wufei1423/WFWebImage.git', :tag => s.version}
    s.source_files = 'WFWebImage/WFWebImage/*'
    s.requires_arc = true
end
