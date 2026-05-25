# frozen_string_literal: true

module Gemspec
  class Metadata
    # @param lib_name [String]
    def initialize(lib_name)
      @lib_name = lib_name
    end

    # @return [Hash]
    def read
      @_read ||= (
        spec = Gem.loaded_specs[@lib_name]

        # Development: gem loaded from a local path (not from the gems directory).
        if spec && !spec.gem_dir.start_with?(Gem.paths.home)
          Gem::Specification::load(File.join(spec.gem_dir, "#{@lib_name}.gemspec"))
        # Production.
        else
          spec || begin
                    Gem::Specification::find_by_name(@lib_name)
                  rescue StandardError, Gem::LoadError, Gem::MissingSpecError
                    nil
                  end
        end
      )
    end
  end
end
