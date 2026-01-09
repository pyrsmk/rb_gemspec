# frozen_string_literal: true

Dir.glob(
  File.join(__dir__, "gemspec", "*.rb"),
  &method(:require)
)
