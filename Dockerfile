# -------------------------------
# Base stage
# -------------------------------
FROM node:20-alpine3.18 as base
RUN apk --no-cache add \
        ca-certificates \
        openssh-client \
        git

WORKDIR /app

# Add SSH config and key to be able to authenticate to private gitlab
# Used for installing private packages
ARG SSH_CONFIG
ENV SSH_CONFIG ${SSH_CONFIG}

ARG SSH_KEY
ENV SSH_KEY ${SSH_KEY}

RUN mkdir -p /home/node/.ssh && \
    echo "$SSH_CONFIG" | sed 's/\\n/\n/g' > /home/node/.ssh/config && \
    echo "$SSH_KEY" | sed 's/\\n/\n/g' > /home/node/.ssh/id_rsa && \
    chmod 0600 /home/node/.ssh/id_rsa && \
    chown node:node /home/node/.ssh/id_rsa


# -------------------------------
# Dev stage
# -------------------------------
FROM base as dev

ARG USER_UID
ENV USER_UID ${USER_UID}

ARG USER_GID
ENV USER_GID ${USER_GID}

# Update UID and GID of the user and group
RUN sed -i -e "s/^node:x:[^:]*:/node:x:${USER_UID}:/g" /etc/passwd
RUN sed -i -e "s/^node:x:[^:]*:/node:x:${USER_GID}:/g" /etc/group

# Fix permissions for the renamed user
RUN chown -R node:node /home/node /app

RUN apk --no-cache add \
        bash \
        bash-completion \
        make \
        vim

# Add entrypoint
COPY ./docker/entrypoint.sh /usr/local/bin/entrypoint
RUN chmod +x /usr/local/bin/entrypoint
ENTRYPOINT ["/usr/local/bin/entrypoint"]
