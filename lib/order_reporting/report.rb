module OrderReporting
  class Report
    def initialize(name)
      @name = name
    end

    def send_report
      orders.tap { |orders| mailer.send(@name, orders) }
    end

    private

    def mailer
      report[:mailer_class] || OrderReporting.mailer_class
    end

    def orders
      report[:query].orders
    end

    def report
      OrderReporting[@name]
    end
  end
end
