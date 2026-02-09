#!/bin/bash

pipx install kas

# enable fzf
cat >> ~/.bashrc << EOF
[ -f /usr/share/doc/fzf/examples/key-bindings.bash ] && source /usr/share/doc/fzf/examples/key-bindings.bash
EOF

# fix docker volume ownership (defaults to root)
sudo chown dev:dev "build" "$DL_DIR" "$SSTATE_DIR"
