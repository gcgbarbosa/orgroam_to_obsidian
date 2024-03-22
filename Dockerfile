FROM pandoc/alpine:latest

RUN apk update
RUN apk add ruby ruby-etc
RUN gem install bundler -v 2.4.22

RUN mkdir -p /opt/orgroam-to-obsidian
WORKDIR /opt/orgroam-to-obsidian
ADD . /opt/orgroam-to-obsidian
RUN bundle install

ENTRYPOINT ["/opt/orgroam-to-obsidian/convert.rb"]
