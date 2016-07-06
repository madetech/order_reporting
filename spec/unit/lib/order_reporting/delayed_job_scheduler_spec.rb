describe OrderReporting::DelayedJobScheduler do
  context 'when scheduling for 24 hours' do
    let(:mock_report) { Struct.new(:send_report).new(nil) }

    before { subject.schedule(mock_report, send_every: 24.hours) }

    it 'should schedule' do
      expect(Delayed::Job.count).to eq(1)
    end

    it 'should reschedule after being run' do
      first_job = Delayed::Job.first
      first_job.update!(run_at: Time.now)
      Delayed::Worker.new.work_off
      expect(first_job).to_not eq(Delayed::Job.first)
    end
  end
end
