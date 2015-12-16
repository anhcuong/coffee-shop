docker:
	docker build -t princep3/rails .
run:
	docker run --name=app --rm -it -v $$(pwd):/app -w /app/coffeeshop --net=host princep3/rails sh -c "bundle install && rails s -b 0.0.0.0"




