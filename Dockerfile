FROM ruby:2.2
MAINTAINER Frank Tran
RUN apt-get update && apt-get install -y nodejs
RUN gem install rails bundler