require 'yaml'
require 'singleton'

class Config
  include Singleton

  attr_reader :data

  def self.data
    instance.data
  end

  %w[user_name board_name list_name card_name].each do |method_name|
    define_singleton_method method_name do
      data.fetch(method_name.gsub('_name', ''))
    end
  end

  def initialize
    @data = load_data
  end

  private

  def load_data
    YAML.load_file('./config/config.yml')
  end
end
