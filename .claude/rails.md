# Ruby on Rails Guidelines

## Setup & Commands

```bash
bundle exec rails server          # start dev server
bundle exec rails console         # open Rails console
bundle exec rails db:migrate      # run pending migrations
bundle exec rails db:rollback     # roll back last migration
bundle exec rails db:schema:load  # load schema from scratch
bundle exec rails routes          # list all routes
bundle exec rails test            # run Minitest suite (if used)
```

## Conventions

- Follow Rails conventions — convention over configuration
- Keep controllers thin; push logic into models or service objects
- Use `concerns` for shared model/controller behavior, but prefer explicit modules
- Namespace routes and controllers for non-trivial domains
- Use `before_action` for auth/lookup; avoid it for business logic

## Models

- Validate at the model layer, not only in forms or controllers
- Use scopes for reusable query logic: `scope :active, -> { where(active: true) }`
- Do not use `default_scope` — it creates invisible surprises
- Avoid `N+1` queries: use `includes`, `preload`, or `eager_load`
- Counter caches over manual `count` calls on associations

## Migrations

- Never edit a migration that has already been committed to main
- Make migrations reversible (`change` over `up`/`down` when possible)
- Do not put domain logic inside migrations
- Add database-level constraints (NOT NULL, foreign keys) in addition to model validations
- Run `bundle exec rails db:migrate:status` to confirm migration state

## Controllers

- Strong parameters via `params.require(...).permit(...)` — never pass raw params to the model
- Return appropriate HTTP status codes (`render json:, status: :unprocessable_entity`)
- Rescue known exceptions at the controller or `ApplicationController` level
- Keep actions to the seven RESTful defaults; add new controllers before adding non-RESTful actions

## Views / Serializers

- Use serializers (e.g., ActiveModel::Serializers or Blueprinter) for API responses
- Never put business logic in views or templates
- Sanitize user-generated content before rendering

## Background Jobs

- Use `ActiveJob` with a real adapter (Sidekiq, GoodJob) in production — not the inline adapter
- Idempotent jobs only: re-running a job must be safe
- Keep job payloads small — pass IDs, not full objects

## Security

- Enable `protect_from_forgery` for HTML responses
- Use `authenticate_user!` (Devise) or equivalent before privileged actions
- Never expose internal IDs in URLs for sensitive resources — use tokens or UUIDs
- Set `config.force_ssl = true` in production
- Review `config/initializers/filter_parameter_logging.rb` to ensure secrets are masked
