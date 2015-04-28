# coding: utf-8
Gem::Specification.new do |s|
  s.name	= 'convert_plantuml'
  s.version	= '1.0.0'
  s.platform	= Gem::Platform::RUBY
  s.date	= '2015-04-27'
  s.author	= 'Nathan T.A. Lewis'
  s.email	= 'nathan@nathantalewis.com'
  s.summary	= 'Command line tool to convert PlantUML files'
  s.description	= 'convert_plantuml allows you to convert your PlantUML files to SVG, PNG, or Ascii using a remote server of your choice'
  s.files	= ['vendor/plantuml-encode64.rb', 'bin/convert-plantuml']
  s.require_paths = ['vendor']
  s.executables	<< 'convert_plantuml'
  s.license	= 'Apache 2.0'
end
