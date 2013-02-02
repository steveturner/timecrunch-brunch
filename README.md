# Brunch with Chaplin and Bootstrap
A skeleton (boilerplate) for [Brunch](http://brunch.io)
based on [Chaplin](https://github.com/chaplinjs/chaplin) framework and the [Bootstrap](http://twitter.github.com/bootstrap) toolkit.

Requires [Brunch](http://brunch.io/) 1.3+.

## Getting started
* Install NodeJS http://nodejs.org/
* npm install -g brunch
* Build the project with `brunch b` or `brunch w`.
* Open the `public/` dir to see the result.
* Write your code.

* Generally, executing brunch watch --server locally while developing is the best method.

See [Chaplin github page](https://github.com/chaplinjs/chaplin) or [Brunch github page](http://brunch.io/) for
documentation.

## Difference from Brunch-with-Chaplin skeleton
[Brunch-with-Chaplin skeleton](https://github.com/paulmillr/brunch-with-chaplin)
is a official skeleton for brunch. This skeleton is almost the same,
except a few changes:

* Added Header.
* Added authentication abstractions (`SessionController`, `LoginView` etc).
* CommonJS is used instead of AMD, because it's easier to use & debug.

## Features
* HTML5Boilerplate 3.0 html & css are included.
* CoffeeScript + Stylus + Handlebars as app languages
(you can change this to anything you want)
* Backbone as main framework
* Cross-module communication using the Mediator and Publish/Subscribe patterns
* Controllers for managing individual UI views
* Rails-style routes which map URLs to controller actions
* An application view as dispatcher and view manager
* Extended model, view and collection classes to avoid repetition and
enforce conventions
* Strict memory management and object disposal
* A collection with additional manipulation methods for smarter change events
* A collection view for easy and intelligent list rendering
* Client-side authentication using service providers like Facebook, Google
and Twitter

## Other
Versions of software the skeleton uses:

* Bootstrap 2.0.4
* jQuery 1.7.2
* Backbone 0.9.2
* Underscore 1.3.3
* Chaplin [2dc3b2](https://github.com/moviepilot/chaplin/commit/2dc3b2e2d0eb95678367aad3e2af0f16c889bac7)


