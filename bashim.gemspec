# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'bashim/version'

Gem::Specification.new do |gem|
  gem.name          = "bashim"
  gem.version       = Bashim::VERSION
  gem.authors       = ["link0ln"]
  gem.email         = ["g.link0ln@gmail.com"]
  gem.description   = %q{Read bash.im citation}
  gem.summary       = %q{Just use it}
  gem.homepage      = "http://idone.su"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
  gem.executables << 'bashim'
end
