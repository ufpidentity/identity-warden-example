## Overview

This example is based on the excellent [resource](https://github.com/radar/guides/tree/master/warden) provided by [Radar](https://github.com/radar)
To build this example, assuming you have a working ruby/RoR environment, do:

    bundle install
    rake db:create
    rake db:migrate
    rails s

which installs the required gems, creates the db, initializes the required tables (user and session), and starts a rails server on http://localhost:3000. 

With a browser, go to [http://localhost:3000/login](http://localhost:3000/login) and you are prompted for a username. The credentials supplied with the example are guest credentials. Enter in a username of 'guest' and click Login. If all goes well, you will be prompted for a Password. Enter in 'guest' as the password and you will be redirected to a success page where you can Logout. Very simple example showing how to use the service.

The credentials are in the [config](https://github.com/ufpidentity/identity-warden-example/tree/master/config) directory (example.com.pem; the certificate, example.com.key.pem; the private key, and truststore.pem; the trust certificates for verifying the server-side connection)

The credentials and the identity provider are configured in the [config/application.rb](https://github.com/ufpidentity/identity-warden-example/blob/master/config/application.rb). The relevant portion is:

    config.identity_key = 'config/example.com.key.pem'
    config.identity_key_password = 'test'
    config.identity_certificate = 'config/example.com.pem'
    config.identity_truststore = 'config/truststore.pem'

    Warden::Strategies.add(:identity, Warden::Strategies::IdentityStrategy)

    config.middleware.use Warden::Manager do |manager|
      manager.default_strategies :identity
    end

which points the Rails.configuration to the key, the key password, the certificate and the truststore. Then we add our strategy to Warden's list of strategies, and ask Warden to please use our strategy as the default. The code in [app/views/login/new.html.erb](https://github.com/ufpidentity/identity-warden-example/blob/master/app/views/login/new.html.erb) shows how to use the service in your login page.

## Getting Credentials