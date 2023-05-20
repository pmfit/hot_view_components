# frozen_string_literal: true

require_relative './action_view'

module HotViewComponents
  class Engine < ::Rails::Engine
    isolate_namespace HotViewComponents

    config.autoload_paths << File.expand_path('./action_view.rb', __dir__)
    config.autoload_paths << File.expand_path('./api.rb', __dir__)

    initializer "my-engine.importmap", before: "importmap" do |app|
      app.config.importmap.paths << Engine.root.join("config/importmap.rb")
    end
  end
end
