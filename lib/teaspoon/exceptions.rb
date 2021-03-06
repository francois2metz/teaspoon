module Teaspoon
  class Error < StandardError
  end

  class Failure < Teaspoon::Error
  end

  class EnvironmentNotFound < Teaspoon::Error
    def initialize(msg = nil, searched:)
      msg ||= "Unable to locate environment; searched in [#{searched}]."
      super(msg)
    end
  end

  # loading / configuration errors

  class UnknownFramework < Teaspoon::Error
    def initialize(msg = nil, name:)
      msg ||= "Unknown framework: expected \"#{name}\" to be a registered framework."
      super(msg)
    end

    def available
    end
  end

  class UnknownFrameworkVersion < Teaspoon::Error
    def initialize(msg = nil, name:, version:)
      msg ||= "Unknown framework version: expected \"#{name}\" to have version #{version}."
      super(msg)
    end

    def available
    end
  end

  class UnknownDriver < Teaspoon::Error
    def initialize(msg = nil, name:)
      msg ||= "Unknown driver: expected \"#{name}\" to be a registered driver."
      super(msg)
    end

    def available
    end
  end

  class UnknownFormatter < Teaspoon::Error
    def initialize(msg = nil, name:)
      msg ||= "Unknown formatter: expected \"#{name}\" to be a registered formatter."
      super(msg)
    end

    def available
    end
  end

  class UnspecifiedFramework < Teaspoon::Error
    def initialize(msg = nil, name:)
      msg ||= "Missing framework: expected \"#{name}\" suite to configure one using `suite.use_framework`."
      super(msg)
    end

    def available
    end
  end

  class UnspecifiedDependencies < Teaspoon::Error
    def initialize(msg = nil, framework:, version:)
      msg ||= "Missing dependencies: expected framework \"#{framework}\" (#{version}) to specify the `dependencies` option when registering."
      super(msg)
    end

    def available
    end
  end

  class UnknownSuite < Teaspoon::Error
    def initialize(msg = nil, name:)
      msg ||= "Unknown suite configuration: expected \"#{name}\" to be a configured suite."
      super(msg)
    end

    def available
    end
  end

  class UnknownCoverage < Teaspoon::Error
    def initialize(msg = nil, name:)
      msg ||= "Unknown coverage configuration: expected \"#{name}\" to be a configured coverage."
      super(msg)
    end

    def available
    end
  end

  # general running errors

  class RunnerError < Teaspoon::Error
  end

  class FileWriteError < Teaspoon::Error
  end

  class MissingDependencyError < Teaspoon::Error
    def initialize(msg = nil)
      msg ||= "Unable to locate a required external dependency."
      super(msg)
    end
  end

  class DependencyError < Teaspoon::Error
    def initialize(msg = nil)
      msg ||= "Problem calling out to an external dependency."
      super(msg)
    end
  end

  class ServerError < Teaspoon::Error
    def initialize(msg = nil, desc: nil)
      msg ||= "Unable to start teaspoon server; #{desc || 'for an unknown reason'}."
      super(msg)
    end
  end

  class DriverOptionsError < Teaspoon::Error
    def initialize(msg = nil, types: nil)
      msg ||= "Malformed driver options#{types ? ": expected a valid #{types}." : '.'}"
      super(msg)
    end
  end

  class AssetNotServableError < Teaspoon::Error
    def initialize(msg = nil, filename: nil)
      msg ||= "Unable to serve asset: expected \"#{filename || 'unknown file'}\" to be within a registered asset path."
      super(msg)
    end
  end
end
