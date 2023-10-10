#!/usr/bin/env zsh
set -e

HASHICUPS_USERNAME="education"
HASHICUPS_PASSWORD="test123"

OUT=$(curl -s -X POST localhost:19090/signup -d '{"username":"'${HASHICUPS_USERNAME}'", "password":"'${HASHICUPS_PASSWORD}'"}')

HASHICUPS_TOKEN=$(jq -r '.token' <<< ${OUT})

cat > setenv <<EOF
HASHICUPS_TOKEN=${HASHICUPS_TOKEN}
HASHICUPS_USERNAME=${HASHICUPS_USERNAME}
HASHICUPS_PASSWORD=${HASHICUPS_PASSWORD}
HASHICUPS_HOST="http://localhost:19090"
export HASHICUPS_TOKEN HASHICUPS_USERNAME HASHICUPS_PASSWORD HASHICUPS_HOST
EOF

echo "User Created"
echo "Run: source ./setenv to set necessary environment variables."
