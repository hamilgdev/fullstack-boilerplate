import { NestFactory } from '@nestjs/core';
import { ValidationPipe } from '@nestjs/common';

import { AppModule } from './app.module';
import { EnvConfig } from '@/src/config/env.config';

const GLOBAL_PREFIX = 'api';

async function bootstrap() {
  const app = await NestFactory.create(AppModule);
  app.enableCors();
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

  await app.listen(EnvConfig().port);
  console.log(`Application is running on: ${await app.getUrl()}`);
}
bootstrap();
