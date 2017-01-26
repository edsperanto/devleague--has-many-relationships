-- has_many_blogs.sql

DROP USER IF EXISTS "has_many_user";
CREATE USER "has_many_user";
DROP DATABASE IF EXISTS "has_many_blogs";
CREATE DATABASE "has_many_blogs" OWNER "has_many_user";

DROP TABLE IF EXISTS "users";
CREATE TABLE "users" (
	id serial NOT NULL PRIMARY KEY,
	username VARCHAR(90) NOT NULL,
	first_name VARCHAR(90) NULL,
	last_name	VARCHAR(90) NULL,
	created_at timestamp NOT NULL now(),
	updated_at timestamp NOT NULL now()
);

