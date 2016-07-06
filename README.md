# Order Reporting for Spree and Solidus

Automatically sends lists of orders via email based on criteria.

## Installing in Spree app

Add this to your Gemfile:

```
gem 'spree_order_reporting'
```

## Installing in Solidus app

Add this to your Gemfile:

```
gem 'solidus_order_reporting'
```

## Setup

Three steps to configure:

1. Setup gem with initializer
2. Create mailer and template
3. Create query object for selecting orders

### 1. Setup gem with initializer

Create an application initializer in `config/initializers/order_reporting.rb`:

``` ruby
OrderReporting.mailer_class = OrderReportMailer
OrderReporting.scheduler = OrderReporting::DelayedJobScheduler.new

OrderReporting.define_report :exported_orders do |config|
  config.send_every = 24.hours
  config.query = ExportedOrdersQuery.new
end
```

### 2. Create mailer and template

```ruby
class OrderReportMailer < ActionMailer::Base
  def exported_orders(orders)
    @orders = orders
    mail(to: 'cs@shop.com', subject: 'Exported Orders')
  end
end
```

### 3. Create query object for selecting orders

```ruby
class ExportedOrdersQuery
  def orders
    Spree::Order.exported.where('completed_at > ?', 24.hours.ago)
  end
end
```

## Development

Run spree tests:

```
BUNDLE_GEMFILE=Gemfile.spree.rb bundle
BUNDLE_GEMFILE=Gemfile.spree.rb bundle exec rake
```

Run solidus tests:

```
BUNDLE_GEMFILE=Gemfile.solidus.rb bundle
BUNDLE_GEMFILE=Gemfile.solidus.rb bundle exec rake
```

## Publishing

Before publishing you will need to have created a new release. To do so update `lib/order_reporting/version.rb` to new version number and commit this change as "New release vx.x.x". Then tag this commit with ```git tag vx.x.x``` and push it `git push origin vx.x.x`. Then you need to publish to RubyGems...

Publish Spree gem:

```
gem build spree_order_reporting.gemspec
gem publish spree_order_reporting-x.x.x.gem
```

Publish Solidus gem:

```
gem build solidus_order_reporting.gemspec
gem publish solidus_order_reporting-x.x.x.gem
```
