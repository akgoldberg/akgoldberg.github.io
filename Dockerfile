# Base image: Ruby with necessary dependencies for Jekyll
FROM ruby:3.2

# Install dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    nodejs \
    && rm -rf /var/lib/apt/lists/*

# Set the working directory inside the container
WORKDIR /usr/src/app

# Copy Gemfile and Gemfile.lock (if exists) for better dependency resolution
COPY Gemfile Gemfile.lock* ./

# Install bundler and dependencies
# Use a more recent bundler version for better compatibility
RUN gem install bundler:2.4.22 && bundle install

# Copy the rest of the site
COPY . .

# Expose port 4000 for Jekyll server
EXPOSE 4000

# Command to serve the Jekyll site with development configuration
CMD ["bundle", "exec", "jekyll", "serve", "--host", "0.0.0.0", "--watch", "--config", "_config.yml,_config.dev.yml"]