#!/usr/bin/env bash

. cookbook/cookbook.sh

prelude

add btcd b1

add lnd alice
add lnd bob
add lnd charlie

# generate init script to build connections
cat > init <<EOF
#!/usr/bin/env bash

set -e -o pipefail

# assuming LN -> Bitcoin connections
#
# alice -> b1 (btcd)
# bob -> b1 (btcd)
# charlie -> b1 (btcd)

# connect LN nodes
connect alice charlie
connect charlie bob
EOF
chmod +x init
