feature 'Specifying criteria for a report' do
  scenario 'Configuring single report' do
    when_the_customer_service_desk_wishes_to_receive_latest_order_report
    then_all_completed_orders_in_last_24_hours_should_be_reported
  end

  def when_the_customer_service_desk_wishes_to_receive_latest_order_report
    OrderReporting.mailer_class = double(latest_orders: nil)
    OrderReporting.scheduler = double(schedule: nil)

    OrderReporting.define_report :latest_orders do |config|
      config.send_every = 24.hours
      config.query = OrderReporting::LatestOrdersQuery.new
    end
  end

  def then_all_completed_orders_in_last_24_hours_should_be_reported
    create(:completed_order_with_totals)
    expect(OrderReporting::Report.new(:latest_orders).send_report.count).to eq(1)
  end
end
