# RSpec Guidelines

## Running Tests

```bash
bundle exec rspec                        # full suite
bundle exec rspec spec/models/           # directory
bundle exec rspec spec/models/user_spec.rb           # single file
bundle exec rspec spec/models/user_spec.rb:42        # single example
bundle exec rspec --format documentation             # verbose output
bundle exec rspec --only-failures                    # re-run failures
```

## File Structure

```
spec/
  support/          # shared helpers, matchers, configs
  factories/        # FactoryBot definitions
  models/
  controllers/
  requests/         # API / integration request specs
  services/
  jobs/
  mailers/
  system/           # Capybara end-to-end specs
  spec_helper.rb
  rails_helper.rb
```

## Spec Structure

- Use `describe` for classes/modules, `context` for conditions, `it` for assertions
- One expectation per example when practical; group related assertions with `aggregate_failures`
- Name `it` blocks in plain language: `it "returns nil when the user is inactive"`
- Use `subject` and `described_class` to keep specs DRY and rename-safe

```ruby
RSpec.describe UserPolicy do
  subject(:policy) { described_class.new(user, record) }

  context "when the user is an admin" do
    let(:user) { build(:user, :admin) }

    it { is_expected.to permit_action(:destroy) }
  end
end
```

## FactoryBot

- One factory file per model in `spec/factories/`
- Define minimal valid factories; use traits for optional states
- Prefer `build` / `build_stubbed` over `create` to avoid unnecessary DB writes
- Never use `create` inside `let` when `build` is sufficient

```ruby
FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "user#{n}@example.com" }
    name { "Test User" }

    trait :admin do
      role { :admin }
    end
  end
end
```

## Mocking & Stubbing

- Mock at the boundary (external HTTP calls, third-party services, mailers)
- Do not mock the database — use real records for model/integration specs
- Use `instance_double` / `class_double` for verified doubles
- Stub with `allow(obj).to receive(:method).and_return(value)`
- Assert interactions with `expect(obj).to receive(:method).once`

## Shared Examples & Helpers

- Extract shared examples to `spec/support/shared_examples/`
- Use `shared_context` for common setup (e.g., authenticated request)
- Require support files via `Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }` in `rails_helper.rb`

## Matchers

- Prefer built-in matchers: `eq`, `be`, `include`, `match`, `raise_error`
- Use `have_attributes` for asserting on multiple fields at once
- Use `change { }.by(n)` for mutation assertions

## Performance

- Tag slow specs with `tag: :slow` and exclude from default run
- Use `let` (lazy) over `let!` (eager) unless the value must exist before the example runs
- Avoid `before(:all)` / `before(:suite)` unless absolutely necessary — they leak state

## Database Cleaner / Transactions

- Use `DatabaseCleaner` strategy `:transaction` for unit specs
- Use `:truncation` or `:deletion` only for specs that require JS (Capybara with a real browser)
- Never leave global state dirty between examples
