ARG REPO_SOURCE="ghcr.io"
ARG REPO_OWNER="ublue-os"
ARG BASE_IMAGE="ucore-minimal"
ARG TAG_VERSION="stable-zfs"

# Allow build scripts to be referenced without being copied into the final image
FROM scratch AS ctx
COPY build_files /
COPY cosign.pub /signing

#0 Base Image
FROM ${REPO_SOURCE}/${REPO_OWNER}/${BASE_IMAGE}:${TAG_VERSION}

# Run all container build scripts
RUN --mount=type=bind,from=ctx,source=/,target=/ctx \
    --mount=type=cache,dst=/var/cache \
    --mount=type=cache,dst=/var/log \
    --mount=type=tmpfs,dst=/tmp \
    set -e; \
    for script in \
        remove-packages \
        tweaks \
        greenboot \
        man \
        cockpit \
        samba \
        terminal \
        fusion-packages \
        media \
        github \
    ; do \
        echo "=== Running $script.sh ==="; \
        bash /ctx/$script.sh; \
        ostree container commit; \
    done

# Optional/Commented out scripts
# bash /ctx/nix.sh && ostree container commit
# bash /ctx/booster.sh && ostree container commit
