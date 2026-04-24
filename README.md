# ClaudeCode

A collection of `CLAUDE.md` artifacts for Ruby on Rails projects with RSpec.
Drop them into a new project so Claude Code has opinionated, project-specific guidance from day one.

## Usage

### New Rails app (recommended)

Pass the template when creating your app:

```bash
rails new myapp -m https://raw.githubusercontent.com/alterisian/claudecode_agentification_ror_artifacts/main/template.rb
```

This fetches `CLAUDE.md` and `.claude/` into the new project automatically.

### Manual / existing project

Clone and copy the files into your project root:

```bash
git clone https://github.com/alterisian/claudecode_agentification_ror_artifacts
cp -r claudecode_agentification_ror_artifacts/CLAUDE.md claudecode_agentification_ror_artifacts/.claude your-project/
```

Claude Code picks up `CLAUDE.md` from the project root automatically,
which imports the supplementary files from `.claude/`.

## What's included

```
CLAUDE.md          # entry point — imports the files below
.claude/
  rails.md         # Rails conventions: models, migrations, controllers, jobs, security
  ruby.md          # Ruby style, patterns, gem hygiene
  rspec.md         # RSpec structure, FactoryBot, mocking, database cleaner
```

## Customising

These files are starting points. Edit them to match your team's actual conventions —
the closer they reflect what your project does, the more useful Claude Code becomes.
