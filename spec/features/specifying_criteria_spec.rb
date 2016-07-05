feature 'Specifying criteria for a report' do
  scenario 'Configuring single report' do
    when_the_customer_service_desk_wishes_to_receive_latest_order_report
    then_all_completed_orders_in_last_24_hours_should_be_reported
  end

  def when_the_customer_service_desk_wishes_to_receive_latest_order_report
    OrderReporting.define_report :latest_orders do
      Spree::Order.complete.where('updated_at > ?', 24.hours.ago)
    end
  end

  def then_all_completed_orders_in_last_24_hours_should_be_reported
    create(:completed_order_with_totals)
    expect(OrderReporting::Report.new(:latest_orders).send_report.count).to eq(1)
  end
end
