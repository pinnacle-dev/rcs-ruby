# frozen_string_literal: true

require "bundler/gem_tasks"
require "minitest/test_task"

Minitest::TestTask.create

require "rubocop/rake_task"

RuboCop::RakeTask.new

# CI gates on both; running them together keeps lint failures local.
task default: %i[test rubocop]

task lint: %i[rubocop]

# Run only the custom test file
Minitest::TestTask.create(:customtest) do |t|
  t.libs << "test"
  t.test_globs = ["test/custom.test.rb"]
end
