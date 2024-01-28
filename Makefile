# -------------------------APP-------------------------

app.build_dev:
	docker compose build --no-cache ; docker compose down

app.start_dev:
	docker compose down && docker compose up ; docker compose down

app.stop_dev:
	docker compose down

# -------------------------FRONTEND-------------------------

frontend.build:
	docker compose build --no-cache frontend

frontend.start:
	docker compose run --rm --name host-stack-frontend \
	--no-deps --service-ports frontend

frontend.stop:
	docker compose stop frontend

# -------------------------BACKEND-------------------------

backend.build:
	docker compose build --no-cache backend

backend.start:
	docker compose run --rm --name host-stack-backend \
	--service-ports backend ; docker compose down

backend.stop:
	docker compose stop backend

backend.test:
	cd backend && npm run test

backend.test.watch:
	cd backend && npm run test:watch


# -------------------------DATABASE-------------------------

database.start:
	docker compose run --rm --name host-stack-database \
	--no-deps --service-ports database ; docker compose down database

database.stop:
	docker compose stop database