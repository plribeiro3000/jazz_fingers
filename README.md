Jazz Fingers
============

This repo is a fork, with updates and bug fixes based on [`jazz_hands`](https://github.com/nixme/jazz_hands).

Spending hours in the pry console? Spruce it up and show off those
hard-working fingers!

**jazz_fingers** is an opinionated set of console-related gems and a bit of glue:

* [**Pry**][pry] for a powerful shell alternative to IRB.
* [**Amazing Print**][amazing_print] for stylish pretty print.
  console.
* [**Pry Coolline**][pry-coolline] for syntax highlighting as you type.

## Notes on Update to `5.0.0`
* [**Hirb**][hirb] was removed since it is not actively being maintained
* [**Pry-Doc**][pry-doc] was removed since it adds a lot of memory footprint which makes `JazzFingers` too heavy to use in production.
Add it to your `Gemfile` if you want it back
* `jazz_fingers/setup` is not needed since the setup is done automatically after the configuration block ends
* Call `JazzFingers.setup!` if you are using the default configurations

## Usage

Ruby 2.0.0+. Add to your project Gemfile:

```ruby
group :development, :test do
  gem 'jazz_fingers'
end
```

That's it. Run `pry` as usual.

Ruby compiled against a proper readline library, ideally GNU readline, is
recommended. Alternatively, [`gem install rb-readline`][rb-readline] for an
acceptible backup. Using ruby compiled against a `libedit` wrapper (primarily OS
X) will work but is not recommended.


## Options

Some configurations can be overwritten:

```ruby
if defined?(JazzFingers)
  JazzFingers.configure do |config|
    config.colored_prompt = false
    config.amazing_print = false
    config.coolline = false
    config.application_name = MyAwesomeProject
  end
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
[amazing_print]:      https://github.com/amazing-print/amazing_print
[hirb]:               https://github.com/cldwalker/hirb
[pry-doc]:            https://github.com/pry/pry-doc
[pry-coolline]:       https://github.com/pry/pry-coolline
[coderay]:            https://github.com/rubychan/coderay
[rb-readline]:        https://github.com/luislavena/rb-readline
[pullrequests]:       https://github.com/plribeiro3000/jazz_fingers/pulls
[issues]:             https://github.com/plribeiro3000/jazz_fingers/issues
[changelog]:          https://github.com/plribeiro3000/jazz_fingers/blob/master/CHANGELOG.md
