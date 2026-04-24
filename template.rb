REPO = "https://raw.githubusercontent.com/alterisian/claudecode_agentification_ror_artifacts/main"

say "Installing Claude Code guidelines..."

get "#{REPO}/CLAUDE.md", "CLAUDE.md"

empty_directory ".claude"
get "#{REPO}/.claude/ruby.md",  ".claude/ruby.md"
get "#{REPO}/.claude/rails.md", ".claude/rails.md"
get "#{REPO}/.claude/rspec.md", ".claude/rspec.md"

say "Done — CLAUDE.md and .claude/ guidelines added.", :green
