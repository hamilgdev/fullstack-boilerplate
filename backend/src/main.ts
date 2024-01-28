import { NestFactory } from '@nestjs/core';
import { ValidationPipe } from '@nestjs/common';
import { SwaggerModule, DocumentBuilder } from '@nestjs/swagger';

import { AppModule } from './app.module';
import { EnvConfig, corsConfig } from '@/src/config';
import { SWAGGER_INFO } from '@/src/common';

const GLOBAL_PREFIX = 'api';

async function bootstrap() {
  const app = await NestFactory.create(AppModule);
  app.enableCors(corsConfig);
  app.setGlobalPrefix(GLOBAL_PREFIX);
  app.useGlobalPipes(
    new ValidationPipe({
      whitelist: true,
      forbidNonWhitelisted: true,
      // transforma los query params string a number
      transform: true,
      transformOptions: { enableImplicitConversion: true },
    }),
  );

  const config = new DocumentBuilder()
    .setTitle(SWAGGER_INFO.title)
    .setDescription(SWAGGER_INFO.description)
    .setVersion(SWAGGER_INFO.version)
    .build();
  const document = SwaggerModule.createDocument(app, config);
  SwaggerModule.setup(GLOBAL_PREFIX, app, document);

  await app.listen(EnvConfig().port);
  console.log(`Application is running on: ${await app.getUrl()}`);
}
bootstrap();
