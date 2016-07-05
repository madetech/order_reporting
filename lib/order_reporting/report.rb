module OrderReporting
  class Report
    def initialize(name)
      @query = OrderReporting[name][:query]
    end

    def send_report
      orders
    end

    private

    def orders
      @query.orders
    end
  end
end
