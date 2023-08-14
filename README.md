# ventrata-test
Test repo for a dummy api for Ventrata

## Development Quickstart 

Get a test API key from [Stripe](https://dashboard.stripe.com/apikeys)

```bash
    git clone git@github.com:tatyree/ventrata_test.git
    cd ventrata_test 
    bundle 
    bin/rails db:setup
    export STRIPE_API_KEY='<key from stripe>'
    bin/rspec 
```

