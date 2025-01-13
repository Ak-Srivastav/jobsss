env ?= development

run:
	cp .env.$(env) .env
ifeq ($(env),development)
	nodemon
else
	npm start
endif

init:
	npm install
	chmod +x ./src/helper/createJobs

create:
	./src/helper/createJobs

start-sql:
	docker-compose -f docker-compose.$(env).yml up -d db phpmyadmin

stop-sql:
	docker-compose -f docker-compose.$(env).yml down

