module VentrataTest
  class Engine < ::Rails::Engine
    isolate_namespace VentrataTest
    config.generators.api_only = true
  end
end
