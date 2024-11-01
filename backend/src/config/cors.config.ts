import { envs } from './env.config';

let allowedOrigins: (RegExp | string)[] = [/localhost:\d{4}$/];

if (envs.CORS_ORIGINS)
  allowedOrigins = allowedOrigins.concat(envs.CORS_ORIGINS.split(','));

export const corsConfig = {
  origin: allowedOrigins,
  methods: 'GET,HEAD,PUT,PATCH,POST,DELETE',
  allowedHeaders: ['Authorization', 'X-Requested-With', 'Content-Type'],
  maxAge: 86400, // NOTICE: 1 day
  credentials: true,
};
