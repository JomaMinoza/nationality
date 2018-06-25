lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'nationality/version'

Gem::Specification.new do |gem|
  gem.name          = "nationality"
  gem.version       = Nationality::VERSION
  gem.authors       = ["Jose Marie Antonio Miñoza"]
  gem.email         = ["josemarieantoniominoza@gmail.com"]
  gem.description   = %q{Provides listing of nationality that you may need in your ruby applications.}
  gem.summary       = %q{List of Nationality}
  gem.homepage      = "https://github.com/JomaMinoza/nationality/"
  gem.license       = 'MIT'
  
  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.required_ruby_version = ">= 1.9.2"

  gem.add_development_dependency "rake", '~> 0.4.8'
  gem.add_development_dependency 'rspec', '~> 2.13', '>= 2.13.0'
  
end
