# Use Alpine as a base image for a minimal footprint
FROM alpine:latest

# Set environment variables
ENV SNYK_VERSION=latest

# Install required dependencies
RUN apk add --no-cache \
    nodejs \
    npm \
    curl \
    && npm install -g snyk@$SNYK_VERSION \
    && snyk --version

# Set SNYK_TOKEN as an environment variable (optional, better to pass at runtime)
# ENV SNYK_TOKEN=SNYK_TOKEN

# Set working directory
WORKDIR /app

# Default command to keep container alive (override when running)
CMD ["snyk", "--help"]
