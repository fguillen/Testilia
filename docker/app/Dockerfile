FROM silvioq/ruby-1.8.7

# Install dependencies
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN gem install bundler -v 1.3.5

# Set an environment variable where the Rails app is installed to inside of Docker image:
ENV RAILS_ROOT /var/www/app
RUN mkdir -p $RAILS_ROOT

# Set working directory, where the commands will be ran:
WORKDIR $RAILS_ROOT

# Setting env up
ENV RAILS_ENV="production"
ENV RACK_ENV="production"
ENV SECRET_KEY_BASE="8704xxhhb0b5889cb81d8452a218251f7940d285ffgg79a3c9b4108dd1e9875227a868bb122bc23c833432ca37b3fe7b7c514xxccc9285661e5b2ce8a5a53453"

# Adding gems
COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock

RUN bundle install

# Adding project files
COPY . .

EXPOSE 3000
CMD ["bundle", "exec", "puma", "-C", "config/puma.rb"]
