module OrderReporting
  RecurringReportJob = Struct.new(:scheduler, :report, :options)

  class RecurringReportDelayedJob < RecurringReportJob
    def perform
      report.send_report
    ensure
      scheduler.schedule(report, options)
    end
  end
end
