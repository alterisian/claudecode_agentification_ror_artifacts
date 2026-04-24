@.claude/ruby.md
@.claude/rails.md
@.claude/rspec.md

# General Claude Code Guidelines

## Agentic Workflow

- Work autonomously through tasks without asking for confirmation on routine decisions
- Break complex tasks into discrete steps and track progress
- When blocked, exhaust alternatives before surfacing to the user
- Prefer smaller, focused commits over large sweeping changes
- Run tests and linters before reporting a task complete

## Git Practices

- Write commit messages in imperative mood: "Add feature" not "Added feature"
- Keep commits atomic — one logical change per commit
- Never force-push to main/master
- Check `git status` and `git diff` before committing
- Never commit secrets, credentials, or `.env` files

## Code Quality

- Delete dead code rather than commenting it out
- No comments that explain *what* — only *why* when non-obvious
- Prefer explicit over clever
- Do not introduce abstractions until the third repetition
- Fix the root cause, not the symptom

## File Operations

- Read a file before editing it
- Prefer `Edit` over full rewrites
- Never create `README.md` or documentation files unless explicitly asked

## Error Handling

- Only validate at system boundaries (user input, external APIs)
- Do not add defensive checks for impossible states
- Trust framework guarantees; do not re-implement them

## Security

- Never introduce SQL injection, XSS, command injection, or mass assignment vulnerabilities
- Never log sensitive data (passwords, tokens, PII)
- Treat all user input as untrusted
