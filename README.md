Redbrew
====================================
A plugin manager (like Homebrew) for Redmine.

Install
----------------
Install dependencies:

    $ export UNUSE_PG=true
    $ bundle install --path vendor/bundle

Set up database:

    $ cp config/database.yml.sample config/database.yml
    $ bundle exec rake db:migrate

Set github oauth setting:

    $ export oauth_request_client_id=<YOUR_CLIENT_ID>
    $ export oauth_request_client_secret=<YOUR_SECRET_KEY>
    $ export oauth_callback_url=http://localhost:3000/login/oauth_callback

Start up rails server:

    $ bundle exec rails s

Access to http://localhost:3000/ .

How to test
----------------

    $ bundle exec rake db:migrate RAILS_ENV=test
    $ bundle exec rake spec

Authors
----------------
 * @suer
 * @mallowlabs

License
------------------------------
The MIT License (MIT)
Copyright (c) 2012 codefirst.org

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

