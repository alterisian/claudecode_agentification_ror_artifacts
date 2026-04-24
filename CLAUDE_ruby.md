# Ruby Guidelines

## Environment

- Use the Ruby version specified in `.ruby-version` or `Gemfile`
- Manage versions with `rbenv` (preferred) or `rvm`
- Always run `bundle install` after modifying `Gemfile`
- Use `bundle exec` to prefix commands: `bundle exec rake`, `bundle exec rspec`

## Style

- Follow the community Ruby style guide enforced by RuboCop
- Run `bundle exec rubocop` before committing; auto-correct with `bundle exec rubocop -a`
- Two-space indentation, no tabs
- Use `frozen_string_literal: true` at the top of every file
- Prefer `do...end` for multi-line blocks, `{ }` for single-line
- Use `snake_case` for methods and variables, `CamelCase` for classes/modules, `SCREAMING_SNAKE_CASE` for constants

## Patterns

- Prefer keyword arguments for methods with more than two parameters
- Use `Enumerable` methods (`map`, `select`, `reduce`) over manual loops
- Guard clauses over nested conditionals
- Raise specific exception classes, never bare `raise RuntimeError`
- Use `Struct` or `Data` (Ruby 3.2+) for simple value objects instead of hashes
- Prefer `then`/`yield_self` for method chaining over intermediate variables

## Gems

- Pin gem versions in `Gemfile` for applications; use pessimistic constraints (`~>`) for libraries
- Run `bundle audit` to check for vulnerable dependencies when available
- Do not add gems to solve problems that Ruby's stdlib already handles

## Testing Hygiene

- Each class/module has a corresponding spec file
- Do not ship code without at least basic unit coverage
- See CLAUDE_rspec.md for testing conventions
