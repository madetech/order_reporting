module OrderReporting
  class DelayedJobScheduler
    def schedule(report, options)
      unless options[:even_if_job_exists]
        return if Delayed::Job.where('handler LIKE ?', "%#{report.name}%").any?
      end

      job = RecurringReportDelayedJob.new(self, report, options)
      Delayed::Job.enqueue(job, run_at: options[:send_every].from_now)
    end
  end
end
