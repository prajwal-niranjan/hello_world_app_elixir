# Stage 1: Build
FROM elixir:1.16-alpine AS build

RUN apk add --no-cache build-base git

ENV MIX_ENV=prod
WORKDIR /app

# Install hex + rebar
RUN mix local.hex --force && mix local.rebar --force

# Install deps
COPY mix.exs mix.lock ./
RUN mix deps.get --only prod
RUN mix deps.compile

# Copy source
COPY lib lib
COPY config config

# Compile + release
RUN mix compile
RUN mix release

# Stage 2: Runtime
FROM alpine:3.20 AS app

RUN apk add --no-cache libstdc++ openssl ncurses-libs

WORKDIR /app

COPY --from=build /app/_build/prod/rel/hello_world_app ./

ENV HOME=/app
ENV MIX_ENV=prod
ENV PORT=4000

EXPOSE 4000
CMD ["bin/hello_world_app", "start"]
