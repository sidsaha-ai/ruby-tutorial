lint:
	rubocop code

fix-lint:
	rubocop code --auto-correct
	rubocop code -A

