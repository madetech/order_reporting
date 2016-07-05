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
