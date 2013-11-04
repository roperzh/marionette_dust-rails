[![Dependency Status][GM img]][Gemnasium]
[![Build Status][BS img]][Build Status]
[![Code Climate][CC img]][Code Climate]

MarionetteDust - Rails
=======

Provides full integration between [Marionette.js][1] (and dependencies), [Dust.js][2] and the Asset Pipeline, also includes generators for a typical marionette application.

Installation
-------


Add marionette_dust in your gemfile:

```ruby
gem 'marionette_dust'
```
Download and install by running:

```
$ bundle install
```

Initialize your app with:

```
$ rails generate marionette_dust:install
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

Generators
-------
All generators are based on [marionette modules][3], the original idea is described in the exellent book [Backbone.Marionette.js: A Gentle Introduction][4], and the all credits go to [BackboneRails.com][5]

- **Scaffold**

    Generates a scaffold for a sub-app, under apps folder, running:

    ```
    $ rails generate marionette_dust:scaffold Foo
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
    $ rails generate marionette_dust:submodule bar --parent foo
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

Contributing
-------

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

[1]: http://marionettejs.com/
[2]: http://linkedin.github.io/dustjs/
[3]: https://github.com/marionettejs/backbone.marionette/blob/master/docs/marionette.application.module.md
[4]: https://leanpub.com/marionette-gentle-introduction
[5]: http://www.backbonerails.com/

[Build Status]: https://travis-ci.org/RobertoDip/marionette_dust-rails
[Code Climate]: https://codeclimate.com/github/RobertoDip/marionette_dust-rails
[Gemnasium]: https://gemnasium.com/RobertoDip/marionette_dust-rails

[BS img]: https://travis-ci.org/RobertoDip/marionette_dust-rails.png
[CC img]: https://codeclimate.com/github/RobertoDip/marionette_dust-rails.png
[GM img]: https://gemnasium.com/RobertoDip/marionette_dust-rails.png
