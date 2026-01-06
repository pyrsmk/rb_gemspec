Dir.glob(
  File.join(__dir__, "gemspec", "*.rb"),
  &method(:require)
)
