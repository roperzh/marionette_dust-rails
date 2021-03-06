[![Gem Version][GV img]][Gem Version]
[![Dependency Status][GM img]][Gemnasium]
[![Build Status][BS img]][Build Status]
[![Code Climate][CC img]][Code Climate]

MarionetteDust - Rails
=======

Provides full integration between [Marionette.js][1] (and dependencies), [Dust.js][2] and the Asset Pipeline, also includes generators for a typical marionette application.

Installation
-------


Add marionette_dust to your gemfile:

```ruby
gem 'marionette_dust'
```
Download and install by running:

```
$ bundle install
```

Initialize your app with:

```
$ rails generate md:install
```

This adds `//= require marionette_dust` in your application.js manifest and generates the basic scaffold for your marionette application:

```
app/
└── assets/
    └── javascripts/
        ├── apps/
        ├── entities/
        └── app.js
```

You can past an optional argument ( -c ) if you want coffeescript files.

Generators
-------
All generators are based on [marionette modules][3], the original idea is described in the excellent book [Backbone.Marionette.js: A Gentle Introduction][4], and the all credits go to [BackboneRails.com][5]

- **Scaffold**

    Generates a scaffold for a sub-app, under apps folder, running:

    ```
    $ rails generate md:scaffold Foo [-c]
    ```

    will generate:
```
app/
└── assets/
    └── javascripts/
        ├── apps/
        |    └── foo/
        |        └── foo_app.js
        └── entities/
            └── foo.js
```

- **Submodule**

    Generates a submodule under an existent app (previously generated with the Scaffold generator), running:

    ```
    $ rails generate md:submodule bar --parent foo [-c]
    ```

    will generate:
```
app/
└── assets/
    └── javascripts/
        ├── apps/
        |    └── foo/
        |        ├── bar/
        |            ├── bar_view.js
        |            └── bar_controller.js
        |        └── foo_app.js
        └── entities/
        |    └── foo.js
        └── templates/
            └── foo/
                └── bar/
                    └── bar.jst.dust
```

About
-------
This version includes:

 * Marionette.js v1.2.2
 * Dust.js v2.2.2

Also this project is inspired by:

[Backbone on rails][7] and [Dust assets][6]

Special thanks to [@sauron][8] for making the test suite possible

Contributing
-------

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

[![githalytics.com alpha](https://cruel-carlota.pagodabox.com/0fcf36aa176a3fc30ebbec87bf7b28d2 "githalytics.com")](http://githalytics.com/roperzh/marionette_dust-rails)

[1]: http://marionettejs.com/
[2]: http://linkedin.github.io/dustjs/
[3]: https://github.com/marionettejs/backbone.marionette/blob/master/docs/marionette.application.module.md
[4]: https://leanpub.com/marionette-gentle-introduction
[5]: http://www.backbonerails.com/
[6]: https://github.com/hasmanydevelopers/dust_assets
[7]: https://github.com/meleyal/backbone-on-rails
[8]: https://github.com/sauron

[Build Status]: https://travis-ci.org/roperzh/marionette_dust-rails
[Code Climate]: https://codeclimate.com/github/roperzh/marionette_dust-rails
[Gemnasium]: https://gemnasium.com/roperzh/marionette_dust-rails
[Gem Version]: https://rubygems.org/gems/marionette_dust

[BS img]: https://travis-ci.org/roperzh/marionette_dust-rails.png
[CC img]: https://codeclimate.com/github/roperzh/marionette_dust-rails.png
[GM img]: https://gemnasium.com/roperzh/marionette_dust-rails.png
[GV img]: https://badge.fury.io/rb/marionette_dust.png

[![Bitdeli Badge](https://d2weczhvl823v0.cloudfront.net/roperzh/marionette_dust-rails/trend.png)](https://bitdeli.com/free "Bitdeli Badge")
