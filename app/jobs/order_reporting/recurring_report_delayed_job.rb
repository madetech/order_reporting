module OrderReporting
  RecurringReportJob = Struct.new(:scheduler, :report, :options)

  class RecurringReportDelayedJob < RecurringReportJob
    def perform
      report.send_report
    end

    def success
      options[:even_if_job_exists] = true
      scheduler.schedule(report, options)
    end
  end
end
