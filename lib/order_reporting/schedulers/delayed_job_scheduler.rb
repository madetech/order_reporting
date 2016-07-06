module OrderReporting
  class DelayedJobScheduler
    def schedule(report, options)
      job = RecurringReportDelayedJob.new(self, report, options)
      Delayed::Job.enqueue(job, run_at: options[:send_every].from_now)
    end
  end
end
