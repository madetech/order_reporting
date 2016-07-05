module OrderReporting
  class LatestOrdersQuery
    def orders
      Spree::Order.complete.where('updated_at > ?', 24.hours.ago)
    end
  end
end
