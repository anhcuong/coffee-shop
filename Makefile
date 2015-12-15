docker:
	docker build -t princep3/rails .
run:
	docker run --name=app --rm -it -v $(pwd):/app -w /app/coffeeshop --net=host princep3/rails rails s




