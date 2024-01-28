# -------------------------🧩 APP-------------------------

app.init:
	cd frontend && npm install && cd ../backend && npm install

app.build_dev:
	docker compose build --no-cache ; docker compose down

app.start_dev:
	docker compose down && docker compose up ; docker compose down

app.stop_dev:
	docker compose down

# -------------------------🔖 FRONTEND-------------------------

frontend.init:
	cd frontend && npm install

frontend.build:
	docker compose build --no-cache frontend

frontend.start:
	docker compose run --rm --name host-stack-frontend \
	--no-deps --service-ports frontend

frontend.stop:
	docker compose stop frontend

# -------------------------🗂️ BACKEND-------------------------

backend.init:
	cd backend && npm install

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


# -------------------------🗄️ DATABASE-------------------------

database.start:
	docker compose run --rm --name host-stack-database \
	--no-deps --service-ports database ; docker compose down database

database.stop:
	docker compose stop database

prisma.generate:
	cd backend && npm run prisma:generate

prisma.migrate:
	cd backend && npm run prisma:migrate

prisma.seed:
	cd backend && npm run prisma:seed