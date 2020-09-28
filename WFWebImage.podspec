Pod::Spec.new do |s|
    s.name         = 'WFWebImage'
    s.version      = '1.0.8'
    s.summary      = 'WFWebImage'
    s.homepage     = 'https://github.com/wufei1423'
    s.license      = 'MIT'
    s.authors      = {'吴飞' => 'wufei1423@163.com'}
    s.platform     = :ios, '10.0'
    s.source       = {:git => 'https://github.com/wufei1423/WFWebImage.git', :tag => s.version}
    s.source_files = 'WFWebImage/WFWebImage/*'
    s.resources    = 'WFWebImage/WFWebImage/*.{png,jpg,gif,xcassets,bundle,xib,storyboard}'
    s.requires_arc = true
end
