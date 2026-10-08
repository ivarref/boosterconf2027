#!/usr/bin/env bash

apt-get update

apt-get install -y --no-install-recommends      \
        build-essential                         \
        cloud-guest-utils                       \
        pkg-config                              \
        libssl-dev                              \
        curl                                    \
        git                                     \
        tmux                                    \
        sysstat                                 \
        ripgrep                                 \
        fish                                    \
        zsh                                     \
        inotify-tools                           \
        avahi-daemon                            \
        socat                                   \
        bat                                     \
        bpftrace                                \
        strace                                  \
        netcat-openbsd

curl https://mise.run | sh
echo 'eval "$(~/.local/bin/mise activate bash)"' >> "$HOME/.bashrc"
echo 'export PATH="$HOME/.local/bin:$PATH"' >> "$HOME/.bashrc"

export PATH="$HOME/.local/bin:$PATH"
eval "$(mise activate bash)"

mkdir -p .config/mise/

cat > .config/mise/config.toml <<MISE
    [settings]
    # Always use the venv created by uv, if available in directory
    python.uv_venv_auto = true
    experimental = true

    # Trust everything by default, since we're already in a VM sandbox
    trusted_config_paths = ["/"]

    [tools]
    uv = "0.9.25"
    node = "24.13.0"
MISE

touch .config/mise/mise.lock
mise install
