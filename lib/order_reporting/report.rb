module OrderReporting
  class Report
    def initialize(name)
      @report_criteria_block = OrderReporting[name]
    end

    def send_report
      orders
    end

    private

    def orders
      @report_criteria_block.call
    end
  end
end
