# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'line/bot/version'

Gem::Specification.new do |s|
  s.name             = "line-bot"
  s.version          = Line::Bot::VERSION
  s.authors          = ["gogotanaka"]
  s.email            = ["t@aisaac.in"]
  s.executables      = ['line-bot']
  s.extra_rdoc_files = ['README.md', 'CHANGELOG']
  s.files            = `git ls-files -z`.split("\x0")
  s.test_files       = `git ls-files -z test/`.split("\0")

  s.summary          = %q{ A lightweight, flexible Ruby interface to the Line Bot API. }
  s.description      = %q{ A lightweight, flexible Ruby interface to the Line Bot API. }
  s.homepage         = "https://github.com/aisaac-lab/line-bot"
  s.license          = "MIT"

  s.bindir           = "exe"
  s.require_paths    = ["lib"]

  s.post_install_message = "Thanks for installing!"

  s.add_development_dependency 'bundler', ['>= 1.0.0']
  s.add_development_dependency 'rake', ['>= 0']
  s.add_development_dependency "minitest", ['>= 0']

  s.add_runtime_dependency "thor"
  s.add_runtime_dependency "faraday"
  s.add_runtime_dependency "faraday_middleware"
end
