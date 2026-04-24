# ClaudeCode

A collection of `CLAUDE.md` artifacts for Ruby on Rails projects with RSpec.
Drop them into a new project so Claude Code has opinionated, project-specific guidance from day one.

## Usage

Clone this repo into your new project directory:

```bash
git clone https://github.com/your-username/ClaudeCode my-project
cd my-project
rm -rf .git
git init
```

Then start building. Claude Code picks up `CLAUDE.md` from the project root automatically,
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
