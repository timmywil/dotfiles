# Git & PR conventions (all repos)

- Never add AI attribution: no `Co-Authored-By: Claude ...` trailer in commit messages, no "Generated with Claude Code" footer in PR bodies.
- PR descriptions become the squash-merge commit message body. Write them like a commit message: start directly with a concise summary paragraph, then plain bullets. No markdown headers (no "## Summary", no "## Test plan") and no testing notes — describe the change only. Bold section lead-ins are fine, and inline code style for identifiers/paths is encouraged.
- Commit messages: conventional commits with a scope (e.g. `feat(inbox): ...`), bulleted body, concise.
- Never hard-wrap lines in commit messages, markdown, or prose — one line per paragraph/bullet; editors soft-wrap.

# Communication

- Be as concise as possible: lead with the answer, short bullets over paragraphs, skip background and recaps unless asked.
- Code comments too: concision is preferred. Explain the why, not the obvious; prefer one line, trim wording, omit entirely when the code is self-explanatory.
