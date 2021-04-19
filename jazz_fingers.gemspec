require File.expand_path('lib/jazz_fingers/version', __dir__)

Gem::Specification.new do |gem|
  gem.name          = 'jazz_fingers'
  gem.version       = JazzFingers::VERSION
  gem.author        = 'Paulo Henrique Lopes Ribeiro'
  gem.email         = 'plribeiro3000@gmail.com'
  gem.license       = 'MIT'
  gem.homepage      = 'https://github.com/plribeiro3000/jazz_fingers'
  gem.summary       = 'Exercise those fingers. Pry-based enhancements for the default Ruby console.'
  description =
    'Spending hours in the ruby console? Spruce it up and show off those hard-working hands! jazz_fingers'\
    'replaces IRB with Pry, improves output through amazing_print, and has some other goodies up its sleeves.'
  gem.description   = description

  gem.executables   = `git ls-files -- bin/*`.split("\n").map { |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.require_paths = ['lib']

  # Dependencies
  gem.required_ruby_version = '>= 2.0'
  gem.add_runtime_dependency 'amazing_print', '~> 1.3'
  gem.add_runtime_dependency 'pry', '~> 0.10'
  gem.add_runtime_dependency 'pry-byebug', '~> 3.4'
  gem.add_runtime_dependency 'pry-coolline', '~> 0.2'

  gem.add_development_dependency 'rubocop'
end
