# CHANGELOG

## 6.1.0 (2021-04-19)
* Update [amazing_print][amazing_print] to v1.3.0

## 6.0.0.pre.rc1 (2020-10-22)
* Switched [awesome_print][awesome_print] with [amazing_print][amazing_print]

## 5.2.0 (2020-07-22)
* Fixed application name

## 5.2.1 (2020-07-16)
* Fix Rails deprecation

## 5.2.0 (2020-05-09)
* Added Pry custom commands
* Customize AwesomePrint configuration
* Customize CodeRay colors

## 5.1.0.rc1 (2020-04-25)
* Change deprecated method on pry > 0.13.0
* Improve naming context

## 5.0.1 (2019-06-02)
* Remove documentation for removed dependency
* Use non deprecated method of `pry` if existent

## 5.0.0 (2018-05-02)
* Remove [pry-doc][pry-doc] dependency to reduce memory footprint
* Remove [hirb][hirb] dependency since its not being actively maintained

## 4.0.1 (2016-05-26)
* Remove requires for `pry-remote`

## 4.0.0 (2016-05-26)
* Remove [pry-remote][pry-remote] dependency

## 3.0.2 (2016-03-07)
* Downgrade [pry-byebug][pry-byebug] to fix issues with [pry-remote][pry-remote]

## 3.0.1 (2016-02-28)
* Separate prompt and print output with a new line

## 3.0.0 (2015-09-22)

* Remove [pry-git] dependency
* Switch to HTTPS in Gemfile

## 2.0.2 (2015-09-06)

* Fix YARD issue when ENV['HOME'] is empty

## 2.0.1 (2015-06-29)

* Fix application name when outside Rails

## 2.0.1.rc1 (2015-05-27)

* Fix load of [pry][pry] plugins
* Fix application name when inside Rails
* Add feature to set a custom Name

## 2.0.0 (2015-05-31)

* Add alias to the most used commands
* Update [pry-byebug][pry-byebug] to ~> v3.1
* Improve abstraction by creating models to handle specific responsibilities
* Add configuration to enable/disable [pry-coolline][pry-coolline]
* Add configuration to enable/disable [awesome_print][awesome_print]
* Remove [pry-rails][pry-rails] dependency
* Remove [railties][railties] dependency

## 1.0.0 (2015-02-05)
* Downgrade [pry-byebug][pry-byebug] to v1.3.3

## 0.5.5 (2015-02-03)

* Update [pry-byebug][pry-byebug] to v2.0.0
* Update [awesome_print][awesome_print] to v1.6.1

## 0.5.4 (2014-11-06)

* Remove [pry-stack_explorer][pry-stack_explorer]

## 0.5.3 (2014-11-04)

* Using [pry-byebug][pry-byebug] to use ruby >= 2.0.0.
* Switched [coolline][coolline] with [pry-coolline][pry-coolline]
* Upgrade [pry][pry] to 0.10, [pry-doc][pry-doc] to 0.6
* Rename to `JazzFingers` to allow releasing.

## 0.5.2 (2013-10-24)

* Upgrade [pry-rails][pry-rails] to the latest 0.3.2,
  [awesome_print][awesome_print] to 1.2 and loosen it's dependency, and removed
  [coderay][coderay] as an explicit dependency since [pry][pry] already includes
  it.

## 0.5.1 (2013-06-28)

* Upgrade [pry-rails][pry-rails] to the latest 0.3.1, [pry-doc][pry-doc] 0.4.6,
  [coolline][coolline] 0.4.2.


## 0.5.0 (2013-03-13)

* Rails 4, Ruby 2.0.0 compatibility.
* Upgrade [pry][pry] to the latest 0.9.12,
  [pry-stack_explorer][pry-stack_explorer] 0.4.9, [pry-remote][pry-remote]
  0.1.7, [pry-debugger][pry-debugger] 0.2.2, [hirb][hirb] 0.7.1,
  [coderay][coderay] 1.0.9.


## 0.4.0 (2012-12-27)

* Add [pry-rails][pry-rails] 0.2.2 for maintained console hooks and new
  `show-routes`, `show-models`, and `show-middleware` commands.
* Add `JazzHands.colored_prompt` and `JazzHands.prompt_separator` options.
  Detect readline library to turn off incompatible colored prompt or Unicode
  prompt separator where appropriate. Fixes #1 and #2.
* Upgrade [pry][pry] to the latest 0.9.10, [pry-doc][pry-doc] 0.4.4,
  [pry-stack_explorer][pry-stack_explorer] 0.4.7, [pry-remote][pry-remote]
  0.1.6, [pry-debugger][pry-debugger] 0.2.1, [hirb][hirb] 0.7.0,
  [Coolline][coolline] 0.4.0, [coderay][coderay] 1.0.8,
  [awesome_print][awesome_print] 1.1.0. Fixes #4.

## 0.3.1 (2012-06-11)

* Upgrade [pry-debugger][pry-debugger] to 0.2.0.

## 0.3.0 (2012-06-07)

* Replace [pry-nav][pry-nav] with [pry-debugger][pry-debugger] for improved
  performance and no segfaults. `JazzHands.enable_pry_nav` removed.
* Upgrade [pry][pry] to the latest 0.9.9, [pry-doc][pry-doc] 0.4.2,
  [pry-git][pry-git] 0.2.3, [pry-stack_explorer][pry-stack_explorer] 0.4.2,
  [pry-remote][pry-remote] 0.1.4, [coderay][coderay] 1.0.6.

## 0.2.0 (2012-03-19)

* Add [pry-stack_explorer][pry-stack_explorer] 0.4.1.
* Upgrade [pry-remote][pry-remote] to 0.1.1 and [pry-nav][pry-nav] to 0.2.0.
* Upgrade recommended gem minor versions: [pry][pry] 0.9.8.4, [pry-doc][pry-doc]
  0.4.1, [hirb][hirb] 0.6.2, and [coderay][coderay] 1.0.5.

## 0.1.2 (2012-01-23)

* Improved Rails 3.2 compatibility. Console methods like `app`, `new_session`,
  `reload!`, `helper`, and `controller` work as expected.

## 0.1.1 (2012-01-20)

* Rails 3.2 compatibility

## 0.1.0 (2012-01-04)

* For performance, enable [pry-nav][pry-nav] only on MRI 1.9.3 by default. To
  use on MRI 1.9.2, add `JazzHands.enable_pry_nav` to a Rails initializer.
* Due to buggy behavior, syntax highlighting as you type via
  [Coolline][coolline] and [Coderay][coderay] is disabled by default. Enable
  with `JazzHands.enable_syntax_highlighting_as_you_type` in a Rails
  initializer. MRI 1.9.3 only.
* Fix [Hirb][hirb] support.
* Upgrade [awesome_print][awesome_print] to 1.0.2.

## 0.0.6 (2011-12-03)

* Add line numbers to the prompt for easy reference when using `_in_` and
  `_out`.
* Upgrade [pry-nav][pry-nav] to 0.0.4.


## 0.0.5 (2011-12-01)

* Add [Hirb][hirb] support. Enable with `Hirb.enable` in the console.
* Upgrade [pry-nav][pry-nav] to 0.0.3.


## 0.0.4 (2011-11-30)

* Add explicit requires for pry plugin gems.


## 0.0.3 (2011-11-30)

* Add [pry-nav][pry-nav].
* Upgrade [awesome_print][awesome_print] to 1.0.1.


## 0.0.2 (2011-11-25)

* Add [pry-doc][pry-doc].


## 0.0.1 (2011-11-25)

* First release. Combine [pry][pry], [awesome_print][awesome_print],
  [coolline][coolline] + [coderay][coderay], [pry-remote][pry-remote],
  [pry-git][pry-git]. Bit of glue to replace IRB with pry in Rails console,
  pretty colors.


[pry]:                http://pry.github.com
[awesome_print]:      https://github.com/michaeldv/awesome_print
[amazing_print]:      https://github.com/amazing-print/amazing_print
[pry-doc]:            https://github.com/pry/pry-doc
[pry-git]:            https://github.com/pry/pry-git
[pry-nav]:            https://github.com/nixme/pry-nav
[pry-remote]:         https://github.com/Mon-Ouie/pry-remote
[coolline]:           https://github.com/Mon-Ouie/coolline
[pry-coolline]:        https://github.com/pry/pry-coolline
[coderay]:            https://github.com/rubychan/coderay
[hirb]:               https://github.com/cldwalker/hirb
[pry-stack_explorer]: https://github.com/pry/pry-stack_explorer
[pry-debugger]:       https://github.com/nixme/pry-debugger
[pry-rails]:          https://github.com/rweng/pry-rails
[pry-byebug]:         https://github.com/deivid-rodriguez/pry-byebug
[railties]:           https://github.com/rails/rails
