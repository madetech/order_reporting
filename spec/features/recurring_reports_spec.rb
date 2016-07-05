feature 'Recurring reports' do
  scenario 'Sending report every 24 hours' do
    when_the_customer_service_desk_wishes_to_receive_a_report_every_24_hours
    then_once_a_report_has_been_sent_another_should_be_scheduled
  end

  def when_the_customer_service_desk_wishes_to_receive_a_report_every_24_hours
    OrderReporting.mailer_class = double(latest_orders: nil)
    OrderReporting.scheduler = OrderReporting::DelayedJobScheduler.new
    OrderReporting.define_report :latest_orders, send_every: 24.hours,
                                                 query: OrderReporting::LatestOrdersQuery.new
  end

  def then_once_a_report_has_been_sent_another_should_be_scheduled
    first_job = Delayed::Job.first
    first_job.update!(run_at: Time.now)
    Delayed::Worker.new.work_off
    expect(first_job).to_not eq(Delayed::Job.first)
  end
end
