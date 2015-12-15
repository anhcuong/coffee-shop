install:
	docker run -it --rm --user "$(id -u):$(id -g)" -v "$PWD/coffeeshop":/usr/src/app -w /usr/src/app ruby:2.1 bundle install

run:
	docker run -it --rm  --user "$(id -u):$(id -g)" -v "$PWD/coffeeshop":/usr/src/app -w /usr/src/app -P rails bundle exec rails s




