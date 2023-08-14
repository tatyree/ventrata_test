# ventrata-test
Test repo for a dummy api for Ventrata

## Development Quickstart 

Get a test API key from [Stripe](https://dashboard.stripe.com/apikeys)

```bash
    git clone git@github.com:tatyree/ventrata_test.git
    cd ventrata_test 
    bundle install
    bin/rails db:setup
    export STRIPE_API_KEY='<key from stripe>'
    bin/rspec 
```

## Installation

Add `gem "ventrata_test", git: "https://github.com/tatyree/ventrata_test"` to the `Gemfile` in your postgresql Rails app. 
 
Set up your `STRIPE_API_KEY` environment variable
 
Then:

```bash
bundle install
bin/rails ventrata:install:migrations
bin/rails db:migrate 
```
 
Finally add `mount VentrataTest::Engine, at: "/ventrata_test/api"` to `config/routes.rb`

## TODO

 + The tests could easily include the most common failure cases. 
 + Add monitoring and alerting
 + Plug in to an observability framework
 + Automate the installation
 + Expand the workflow to cover the end-to-end purchase journey 
 + Integrate with authentication and restrict access to the endpoint(s)
 + Add and activate `Rswag` gem so it is also documented
 + Set up CI/CD and a protected branch on Github


