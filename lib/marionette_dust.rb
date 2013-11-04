require "marionette_dust/version"

module MarionetteDust

  autoload(:Dust, 'dust_engine/dust')
  autoload(:TiltDust, 'dust_engine/tilt_dust')

  require "marionette_dust/engine" if defined?(Rails::Engine)

  def self.path
    File.expand_path("../../vendor/assets/javascripts/marionette_dust/", __FILE__)
  end
end
