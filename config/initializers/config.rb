# -*- encoding : utf-8 -*-
module Tmwsd
  class Config
    cattr_accessor :settings

    if File.exist?("#{Rails.root}/config/application.yml")
      self.settings = YAML.load_file("#{Rails.root}/config/application.yml").with_indifferent_access
    else
      self.settings = {}
    end

    def self.[](key)
      lookup_key(key)
    end

    def self.method_missing(key)
      lookup_key(key)
    end

  private

    def self.lookup_key(key)
      settings[key] || ENV["TMWSD_"+key.to_s.upcase]
    end

  end
end
