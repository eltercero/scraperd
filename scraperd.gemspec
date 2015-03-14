# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'scraperd/version'

Gem::Specification.new do |spec|
  spec.name          = "scraperd"
  spec.version       = Scraperd::VERSION
  spec.authors       = ["Víctor Martín"]
  spec.email         = ["victor.martin84@gmail.com"]
  spec.summary       = %q{Scraper for Letterboxd user's activity}
  spec.description   = %q{Scraper for Letterboxd user's activity using public user RSS}
  spec.homepage      = "https://github.com/eltercero/scraperd"
  spec.license       = "MIT"

  spec.files      = `git ls-files -z`.split("\x0")
  spec.test_files = `git ls-files -- {test,spec,features}/*`.split("\n")

  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake", '~> 10.1'

  spec.add_development_dependency 'minitest', '~>5.2'
  spec.add_dependency 'simple-rss','~> 1.3', '>= 1.3.1'
  spec.add_dependency 'hashie', '~>2.0'
end
