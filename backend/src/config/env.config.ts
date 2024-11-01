import 'dotenv/config';

import * as joi from 'joi';

interface EnvVars {
  NEST_PORT: number;
  NODE_ENV: string;
  CORS_ORIGINS: string;
}

const envVarsSchema = joi
  .object({
    NEST_PORT: joi.number().required(),
    NODE_ENV: joi.string().required(),
    CORS_ORIGINS: joi.string().required(),
  })
  .unknown(true);

const { error, value } = envVarsSchema.validate(process.env);

if (error) throw new Error(`Config validation error: ${error.message}`);

const envVars: EnvVars = value;

export const envs = {
  NEST_PORT: envVars.NEST_PORT,
  NODE_ENV: envVars.NODE_ENV,
  CORS_ORIGINS: envVars.CORS_ORIGINS,
};
