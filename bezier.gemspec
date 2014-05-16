Gem::Specification.new do |s|
  s.name        = 'bezier'
  s.version     = '0.0.1'
  s.license     = 'MIT'
  s.summary     = 'Draw a Bézier curve'
  s.description = 'Library to draw Bézier curves'
  s.author      = 'Yihang Ho'
  s.email       = 'me@yihangho.com'
  s.homepage    = 'https://github.com/yihangho/bezier'


  s.files = `git ls-files`.split($/)

  s.add_runtime_dependency('chunky_png', '~> 1.3.1')

  s.add_development_dependency('rake', '~> 10.3.1')
  s.add_development_dependency('minitest', '~> 5.3.3')
  s.add_development_dependency('yard', '~> 0.8.7.4')
  s.add_development_dependency('yard-tomdoc', '~> 0.7.1')
end
