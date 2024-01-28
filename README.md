# Fullstack Boilerplate

A boilerplate for fullstack applications with **NextJS**, **NestJS** and, **PostgreSQL**.

## 📜 System Requirement

- Node.js `20.10.0` or later [👉 Install Node](https://nodejs.org/es/download)
- Nextjs `14.0.4` or later [👉 Install Next](https://nextjs.org/docs/getting-started)
- Nestjs `10.0.0` or later [👉 Install Nest](https://docs.nestjs.com/)
- NPM [👉 Install npm](https://docs.npmjs.com/downloading-and-installing-node-js-and-npm)

### Visual Studio Code

Extensions aditionals

- [ESLint](https://marketplace.visualstudio.com/items?itemName=dbaeumer.vscode-eslint): It helps you see the alerts from the linter in real-time in your editor.

## 🗃️ Environment

You can use the `.env.template` file to create your `.env` file. This file is used to set the environment variables.

## 📚 Folder Structure

- `frontend/`: Source code base. Frontend made with **NextJS**
- `backend/`: Source code base. Backend made with **NestJS**
- `provision/`: The files to provision the Docker containers

## 🐳 Running the app inside containers

To run the application with containers you will need:

- Docker. [👉 Install Docker](https://docs.docker.com/get-docker/)
- Docker Compose. [👉 Install Docker Compose](https://docs.docker.com/compose/install/)
- Make. [👉 Install Make](https://www.gnu.org/software/make/)

then run the following command int the root `/` to initialize the application:

Build the containers

```bash
  make app.build_dev
```

Run the containers

```bash
  make app.run_dev
```

Or you can run the **frontend** container with one command

```bash
  make frontend.start
```

Or you can run the **backend** container with one command

```bash
  make backend.start
```

Also you can run the **database** container with one command

```bash
  make database.start
```

Run tests

```bash
  make backend.test
```

```bash
  make backend.test.watch
```
