# syntax=docker/dockerfile:1.7

ARG NODE_VERSION=24.18.0
ARG PNPM_VERSION=11.18.0

FROM node:${NODE_VERSION}-bookworm-slim AS base
ARG PNPM_VERSION
ENV PNPM_HOME=/pnpm
ENV PATH=${PNPM_HOME}:${PATH}
WORKDIR /workspace
RUN npm install --global pnpm@${PNPM_VERSION}

FROM base AS dependencies
COPY package.json pnpm-lock.yaml pnpm-workspace.yaml ./
RUN pnpm install --frozen-lockfile

FROM dependencies AS build
COPY . .
# The application bootstrap will define the build script and dist contract.
RUN pnpm run build

FROM node:${NODE_VERSION}-bookworm-slim AS runtime
ENV NODE_ENV=production
WORKDIR /app
RUN chown node:node /app
COPY --from=build --chown=node:node /workspace/dist ./dist
USER node
ENTRYPOINT ["/bin/sh", "-c"]
CMD ["node dist/main.js"]
