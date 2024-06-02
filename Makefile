# -------------------------🧩 APP-------------------------

# 👨🏽‍💻 Development

app.init_dev:
	cd frontend && npm install && cd ../backend && npm install

app.build_dev:
	docker compose -f docker-compose.dev.yml build --no-cache \
	; docker compose -f docker-compose.dev.yml down

app.start_dev:
	docker compose -f docker-compose.dev.yml down && docker compose -f docker-compose.dev.yml up \
	; docker compose -f docker-compose.dev.yml down 

app.stop_dev:
	docker compose -f docker-compose.dev.yml down

# 🚀 Production

app.build_prod:
	docker compose -f docker-compose.prod.yml build --no-cache \
	; docker compose -f docker-compose.prod.yml down

app.start_prod:
	docker compose -f docker-compose.prod.yml down && docker compose -f docker-compose.prod.yml up \
	; docker compose -f docker-compose.prod.yml down

app.stop_prod:
	docker compose -f docker-compose.prod.yml down

app.multi_platform.build_prod:

# -------------------------🔖 FRONTEND-------------------------

# 👨🏽‍💻 Development

frontend.init_dev:
	cd frontend && npm install

frontend.build_dev:
	docker compose -f docker-compose.dev.yml build --no-cache frontend

frontend.start_dev:
	docker compose -f docker-compose.dev.yml run \
	--rm --name host-stack-dev-frontend \
	--no-deps --service-ports frontend \
	; docker compose -f docker-compose.dev.yml down frontend

frontend.stop_dev:
	docker compose -f docker-compose.dev.yml down frontend

# 🚀 Production

frontend.build_prod:
	docker compose -f docker-compose.prod.yml build --no-cache frontend

frontend.start_prod:
	docker compose -f docker-compose.prod.yml run \
	--rm --name host-stack-prod-frontend \
	--no-deps --service-ports frontend \
	; docker compose -f docker-compose.prod.yml down frontend

frontend.stop_prod:
	docker compose -f docker-compose.prod.yml down frontend

frontend.multi_platform.build_prod:

# -------------------------🗂️ BACKEND-------------------------

# 👨🏽‍💻 Development

backend.init_dev:
	cd backend && npm install

backend.build_dev:
	docker compose -f docker-compose.dev.yml build --no-cache backend

backend.start_dev:
	docker compose -f docker-compose.dev.yml run \
	--rm --name host-stack-dev-backend \
	--service-ports backend \
	; docker compose -f docker-compose.dev.yml down backend

backend.stop_dev:
	docker compose -f docker-compose.dev.yml down backend

# backend.test:
# 	cd backend && npm run test

# backend.test.watch:
# 	cd backend && npm run test:watch

# 🚀 Production

backend.build_prod:
	docker compose -f docker-compose.prod.yml build --no-cache backend

backend.start_prod:
	docker compose -f docker-compose.prod.yml run \
	--rm --name host-stack-prod-backend \
	--service-ports backend \
	; docker compose -f docker-compose.prod.yml down backend

backend.stop_prod:
	docker compose -f docker-compose.prod.yml down backend

backend.multi_platform.build_prod:

# -------------------------🗄️ DATABASE-------------------------

database.start_dev:
	docker compose -f docker-compose.dev.yml run \
	--rm --name host-stack-dev-database \
	--no-deps --service-ports database \
	; docker compose -f docker-compose.dev.yml down database

database.stop_dev:
	docker compose stop database

prisma.generate:
	cd backend && npm run prisma:generate

prisma.migrate:
	cd backend && npm run prisma:migrate

prisma.seed:
	cd backend && npm run prisma:seed