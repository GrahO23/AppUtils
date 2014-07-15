Pod::Spec.new do |s|
	s.name         =  'AppUtils'
	s.version      =  '0.3.6'
	s.platform     =  :ios
	s.author       =  'Graham Oldfield'
	s.license      = { :type => 'Apache 2.0', :file => 'LICENSE' }
	s.requires_arc =  true
	s.summary      =  'Useful utils for iOS apps and NSDictionary persisted config class'
	s.description  =  'Useful utils for iOS apps and NSDictionary persisted config class'
	s.source_files =  'Apputils/*.{h,m}'
	s.homepage     =  'https://github.com/jivadevoe/UIAlertView-Blocks'
	s.source       =  { :git => 'https://github.com/GrahO23/AppUtils.git' }
	s.subspec 'Core' do |cs|
		cs.dependency 'UIAlertView-Blocks', '~> 1.0'
	end
end
