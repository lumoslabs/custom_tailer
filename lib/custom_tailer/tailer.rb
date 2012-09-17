class CustomTailer::Tailer
  attr_accessor :regexp

  def initialize(options = {})
    @metrics = []
  end

  def metric(&block)
    raise "Invalid configuration - no block passed to 'metric'" unless block_given?
    CustomTailer::Metric.new.tap do |metric|
      block.call(metric)
      @metrics << metric
    end
  end
end
