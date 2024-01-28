import { Module } from '@nestjs/common';
import { ConfigModule } from '@nestjs/config';
import { EnvConfig } from '@/src/config/env.config';
import { HealthCheckModule } from './health-check/health-check.module';
import { PrismaModule } from './prisma/prisma.module';

@Module({
  imports: [
    ConfigModule.forRoot({
      load: [EnvConfig],
    }),
    HealthCheckModule,
    PrismaModule,
  ],
  controllers: [],
  providers: [],
})
export class AppModule {}
