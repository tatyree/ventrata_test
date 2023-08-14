require_relative "lib/ventrata_test/version"

Gem::Specification.new do |spec|
  spec.name        = "ventrata_test"
  spec.version     = VentrataTest::VERSION
  spec.authors     = ["TA Tyree"]
  spec.email       = ["tatyree@gmail.com"]

  spec.summary = "A demo gem for the Ventrata technical task."
  spec.description = "This is a demo gem intended to fulfil the technical task requirements for a possible contract at Ventrata."
  spec.homepage = "https://github.com/tatyree/ventrata_test"
  spec.required_ruby_version = ">= 3.1.2"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    Dir["{app,config,db,lib}/**/*", "Rakefile", "README.md"]
  end

  spec.add_dependency "rails", ">= 7.0.7"
  spec.add_dependency "pg", "~> 1.5", ">= 1.5.3"
  spec.add_dependency "stripe", "~> 8.6"

  spec.add_development_dependency "rspec-rails", "~> 6.0"
  spec.add_development_dependency "shoulda-matchers", "~> 5.0"
  spec.add_development_dependency "simplecov", "~> 0.12.0"
end
