require 'order_reporting/engine'
require 'order_reporting/report'

module OrderReporting
  extend self

  def define_report(name, &block)
    @reports ||= {}
    @reports[name] = block
  end

  def [](name)
    @reports[name]
  end
end
