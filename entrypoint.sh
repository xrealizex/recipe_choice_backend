#!/bin/bash
set -e

# Remove a potentially pre-existing server.pid for Rails.
bundle exec rake db:migrate 2>/dev/null || bundle exec rake db:setup

# Then exec the container's main process (what's set as CMD in the Dockerfile).
exec "$@"
