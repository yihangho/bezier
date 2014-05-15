Gem::Specification.new do |s|
  s.name   = 'bezier'
  s.version = '0.0.1'
  s.license = 'MIT'
  s.summary = '"Draw" a Bézier cruve'
  s.author  = 'Yihang Ho'

  s.files = `git ls-files`.split($/)

  s.add_development_dependency('rake', '~> 10.3.1')
  s.add_development_dependency('minitest', '~> 5.3.3')
end
