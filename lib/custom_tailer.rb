class CustomTailer
  attr_accessor :config_file

  def initialize(options = {})
    @tailers = []
    @config_file = options.delete(:config_file)
    instance_eval(File.read(@config_file)) if @config_file
  end

  private

  def statsd(*args)
    @statsd = Statsd.new(args)
  end

  def tailer(logfile, &block)
    raise "Invalid configuration - no block passed to 'tailer'" unless block_given?
    Tailer.new.tap do |tailer|
      block.call(tailer)
      @tailers << tailer
    end
  end
end

require 'custom_tailer/tailer'
require 'custom_tailer/metric'
require 'custom_tailer/statsd'
