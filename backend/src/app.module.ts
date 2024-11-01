import { Module } from '@nestjs/common';
import { HealthCheckModule } from './modules/health-check/health-check.module';
import { PrismaModule } from './prisma/prisma.module';

@Module({
  imports: [HealthCheckModule, PrismaModule],
  controllers: [],
  providers: [],
})
export class AppModule {}
