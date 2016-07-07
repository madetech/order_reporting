describe OrderReporting::Report do
  subject { described_class.new(:my_report) }

  let(:mock_mailer_class) { double(my_report: mock_deliver) }

  before do
    OrderReporting.define_report :my_report do |report|
      report.mailer_class = mock_mailer_class
      report.query = double(orders: [])
    end

    subject.send_report
  end

  context 'when mailing using rails custom mailer' do
    let(:mock_deliver) { nil }

    it 'should not call anything' do
      expect(mock_mailer_class).to have_received(:my_report)
    end
  end

  context 'when mailing using rails <= v4.1 mailer' do
    let(:mock_deliver) { double(deliver: nil) }

    it 'should call deliver' do
      expect(mock_deliver).to have_received(:deliver)
    end
  end

  context 'when mailing using rails > v4.2 mailer' do
    let(:mock_deliver) { double(deliver_now: nil) }

    it 'should call deliver' do
      expect(mock_deliver).to have_received(:deliver_now)
    end
  end
end
