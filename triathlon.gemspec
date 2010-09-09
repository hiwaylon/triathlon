Gem::Specification.new do |spec|
  spec.name = %q{triathlon}
  spec.version = "0.0.7"
  
  spec.authors = ["Waylon Calabrese"]
  spec.summary = %q{Compute interesting stats and get faster.}
  spec.description = %q{Simple Ruby API to compute various stats related to swim, bike, and run training generaly helpful when competing in triathlons.}
  spec.email = %q{hiwaylon@gmail.com}
  spec.homepage = %q{http://github.com/hiwaylon/triathlon}
  spec.require_paths = ["lib"]
  spec.files = ["README", "lib/triathlon.rb", "lib/bike.rb", "lib/converter.rb", "lib/splits.rb", "test/test_helper.rb", "test/unit/test_bike.rb", "test/unit/test_converter.rb", "test/unit/test_splits.rb"]
end
