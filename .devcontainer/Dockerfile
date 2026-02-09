FROM ubuntu:24.04

RUN if id "ubuntu" &>/dev/null; then \
		echo "Deleting user 'ubuntu' for noble" && userdel -f -r ubuntu || echo "Failed to delete ubuntu user for noble"; \
	else \
		echo "User 'ubuntu' does not exist for noble"; \
	fi

RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
	# restore man command
	&& yes | unminimize 2>&1 \
	&& apt-get upgrade -y \
	&& apt-get install -y --no-install-recommends \
		# bitbake dependencies
		build-essential chrpath cpio diffstat file gawk lz4 zstd \
		# additional tools
		bash-completion \
		device-tree-compiler \
		iproute2 \
		iputils-ping \
		fzf \
		git \
		libncurses-dev \
		pipx \
		python3-requests \
		ripgrep \
		sudo \
		tree \
		tmux \
		xxd \
	# Clean up
	&& apt-get autoremove -y && apt-get clean -y \
	&& rm -rf /var/lib/apt/lists/*

COPY --chmod=0755 onCreateCommand.sh /onCreateCommand.sh

ENV BB_SERVER_TIMEOUT=30
