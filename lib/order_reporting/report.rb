module OrderReporting
  class Report
    attr_reader :name

    def initialize(name)
      @name = name
    end

    def send_report
      orders.tap do |orders|
        deliver(mailer.send(@name, orders))
      end
    end

    private

    def deliver(mail)
      if mail.respond_to?(:deliver)
        mail.deliver
      elsif mail.respond_to?(:deliver_now)
        mail.deliver_now
      end
    end

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
