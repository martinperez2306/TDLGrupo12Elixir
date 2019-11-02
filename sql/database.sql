CREATE DATABASE chat_dev
    WITH 
    OWNER = postgres
    ENCODING = 'UTF8'
    CONNECTION LIMIT = -1;

COMMENT ON DATABASE chat_dev
    IS 'Base de datos de Desarrollo para TDL sobre el chat server';