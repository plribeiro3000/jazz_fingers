Jazz Fingers
============

This repo is a fork, with updates and bug fixes based on [`jazz_hands`](https://github.com/nixme/jazz_hands).

Spending hours in the pry console? Spruce it up and show off those
hard-working fingers!

**jazz_fingers** is an opinionated set of console-related gems and a bit of glue:

* [**Pry**][pry] for a powerful shell alternative to IRB.
* [**Awesome Print**][awesome_print] for stylish pretty print.
* [**Hirb**][hirb] for tabular collection output.
* [**Pry Doc**][pry-doc] to browse Ruby source, including C, directly from the
  console.
* [**Pry Git**][pry-git] to teach the console about git. Diffs, blames, and
  commits on methods and classes, not just files.
* [**Pry Remote**][pry-remote] to connect remotely to a Pry console.
* [**Pry Coolline**][pry-coolline] for syntax highlighting as you type.


## Usage

Ruby 2.0.0+. Add to your project Gemfile:

```ruby
group :development, :test do
  gem 'jazz_fingers'
end
```

That's it. Run `pry` as usual.

[Hirb][hirb] isn't enabled by default. To use, run `Hirb.enable` in the console.

Ruby compiled against a proper readline library, ideally GNU readline, is
recommended. Alternatively, [`gem install rb-readline`][rb-readline] for an
acceptible backup. Using ruby compiled against a `libedit` wrapper (primarily OS
X) will work but is not recommended.


## Options

Change the following options by creating an initializer
Example `config/initializers/jazz_fingers.rb`:

```ruby
if defined?(JazzFingers)
  JazzFingers.colored_prompt = false
  JazzFingers.awesome_print = false
  JazzFingers.coolline = false

  require 'jazz_fingers/setup'
end
```

### `colored_prompt`

Color the console prompt? Defaults to `true` when the current ruby is compiled
against GNU readline or `rb-readline`, which don't have issues counting
characters in colored prompts. `false` for libedit.

Note: `Pry.color = false` trumps this setting and disables all console coloring.

### `prompt_separator`

Separator string between the application name and line input. Defaults to `»`
for GNU readline or libedit. Defaults to `>` for `rb-readline` which fails on
mixed encodings.


[pry]:                http://pry.github.com
[awesome_print]:      https://github.com/michaeldv/awesome_print
[hirb]:               https://github.com/cldwalker/hirb
[pry-doc]:            https://github.com/pry/pry-doc
[pry-git]:            https://github.com/pry/pry-git
[pry-remote]:         https://github.com/Mon-Ouie/pry-remote
[pry-coolline]:       https://github.com/pry/pry-coolline
[coderay]:            https://github.com/rubychan/coderay
[rb-readline]:        https://github.com/luislavena/rb-readline
[pullrequests]:       https://github.com/plribeiro3000/jazz_fingers/pulls
[issues]:             https://github.com/plribeiro3000/jazz_fingers/issues
[changelog]:          https://github.com/plribeiro3000/jazz_fingers/blob/master/CHANGELOG.md
