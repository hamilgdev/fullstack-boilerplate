export const EnvConfig = () => ({
  environment: process.env.NODE_ENV || 'development',
  port: process.env.NEST_PORT || '3000',
});
