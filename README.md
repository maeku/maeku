# maeku (前句), a journalling platform

[![Build Status][travis-ci-badge]][travis-ci-maeku]

[travis-ci-badge]: https://travis-ci.com/maeku/maeku.svg?branch=master
[travis-ci-maeku]: https://travis-ci.com/maeku/maeku

The term *maeku* is used to describe elements of the Japanese collaborative
poetry genre [renga][1]. Specifically, *maeku* refers to a verse where unlikely
words are strung together to evoke a new or surprising image.

Maeku is a [Ruby on Rails][2]-based journalling platform. Eventually, it will
support multiple users and be extensible with multiple post types. It's inspired
by Tumblr, [Hi.co][3] (defunct), Japanese poetry, and the idea of controlling
your own blog content on the web.

**Maeku is not in a usable state.**

## Developer environment

You can clone this repository and use the included `dummy` Rails application for
local Maeku development.

The recommended setup path is as follows:

1. Clone the repo:

       git clone https://github.com/maeku/maeku maeku

2. Install dependencies with `bundler`:

       cd maeku
       bundle install

3. Migrate and seed the `dummy` database using the provided `dummy:setup` Rake
   task:

       bundle exec rake dummy:setup

4. And start the `dummy` application's Rails server using the `dummy:server`
   Rake task:

       bundle exec rake dummy:server

### Editor

If you want to develop on the `maeku_editor` gem locally, you also need to run a
local Webpack developer server. If you install Yarn, it's easy to get
dependencies installed and run the `webpack-dev-server` in the background:

    cd editor
    yarn install
    yarn webpack-dev-server

[1]: https://en.wikipedia.org/wiki/Renga
[2]: https://https://rubyonrails.org
[3]: https://medium.com/@craigmod/archiving-our-online-communities-e5868eab4d9a

