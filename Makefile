init:
	docker-compose build
	docker-compose up -d db
	docker-compose run --rm chat_test_task rails db:create db:migrate
	mkdir -p tmp/pids
	docker-compose up -d

build:
	docker-compose build

up:
	docker-compose up -d

ps:
	docker-compose ps

down:
	docker-compose down

bash:
	docker-compose run --rm chat_test_task bash

reload_data:
	docker-compose up -d db
	docker-compose run --rm chat_test_task rails db:drop db:create db:migrate
