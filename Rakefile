begin
  require "rspec/core/rake_task"
  require File.expand_path('../config/application', __FILE__)

  Rails.application.load_tasks

  desc "Run all examples"
  RSpec::Core::RakeTask.new(:spec) do |t|
    t.rspec_opts = %w[--color]
    t.pattern = 'spec/*_spec.rb'
  end
rescue LoadError
end
