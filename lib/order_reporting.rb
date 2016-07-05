require 'order_reporting/engine'
require 'order_reporting/report'
require 'order_reporting/schedulers/delayed_job_scheduler'
require 'order_reporting/queries/latest_orders_query'

module OrderReporting
  extend self

  attr_accessor :scheduler
  attr_accessor :mailer_class

  def define_report(name, options = {})
    @reports ||= {}
    @reports[name] = options.merge(name: name)
    setup_recurring_report(name)
  end

  def setup_recurring_report(name)
    return unless @reports[name].respond_to?(:send_every)
    scheduler.schedule(Report.new(name), self[name])
  end

  def [](name)
    @reports[name]
  end
end
