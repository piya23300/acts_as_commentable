$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "acts_as_commentable_more/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "acts_as_commentable_more"
  s.version     = ActsAsCommentableMore::VERSION
  s.authors     = ["piya23300", "carryall"]
  s.email       = ["piya23300@gmail.com"]
  s.homepage    = "TODO"
  s.summary     = "ActsAsCommentableMore."
  s.description = "ActsAsCommentableMore."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.1.8"

  s.add_development_dependency "pg"
  s.add_development_dependency "acts_as_commentable"

end
