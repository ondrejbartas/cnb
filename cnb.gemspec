# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{cnb}
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.2") if s.respond_to? :required_rubygems_version=
  s.authors = ["Radim Marek"]
  s.date = %q{2010-08-29}
  s.description = %q{Simple CNB forex rate parser (Czech National Bank)}
  s.email = %q{radim@laststation.net}
  s.extra_rdoc_files = ["README.rdoc", "lib/cnb.rb"]
  s.files = ["README.rdoc", "Rakefile", "cnb_convert.rb", "lib/cnb.rb", "Manifest", "cnb.gemspec"]
  s.homepage = %q{http://github.com/radim/cnb}
  s.rdoc_options = ["--line-numbers", "--inline-source", "--title", "Cnb", "--main", "README.rdoc"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{cnb}
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{Simple CNB forex rate parser (Czech National Bank)}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
