SPACESHIP_PROMPT_ORDER=(
	time          # Time stamps section
	user          # Username section
	dir           # Current directory section
	host          # Hostname section
	git           # Git section (git_branch + git_status)
	node          # Node.js section
	exec_time     # Execution time
	line_sep      # Line break
	jobs          # Background jobs indicator
	exit_code     # Exit code section
	char          # Prompt character
)

SPACESHIP_PROMPT_FIRST_PREFIX_SHOW=true
SPACESHIP_PROMPT_DEFAULT_PREFIX=' '

SPACESHIP_TIME_SHOW=true
SPACESHIP_TIME_PREFIX='at '
SPACESHIP_TIME_COLOR="white"
SPACESHIP_TIME_FORMAT=%D{%L:%M}
SPACESHIP_TIME_12HR=true