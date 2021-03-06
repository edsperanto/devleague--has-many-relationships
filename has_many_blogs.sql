-- has_many_blogs.sql

\connect Edward
DROP USER IF EXISTS "has_many_user";
CREATE USER "has_many_user";
DROP DATABASE IF EXISTS "has_many_blogs";
CREATE DATABASE "has_many_blogs" OWNER "has_many_user";

\connect has_many_blogs

DROP TABLE IF EXISTS "users";
CREATE TABLE "users" (
	id serial NOT NULL PRIMARY KEY,
	username VARCHAR(90) NOT NULL,
	first_name VARCHAR(90) NULL,
	last_name	VARCHAR(90) NULL,
	created_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT now(),
	updated_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT now()
);

DROP TABLE IF EXISTS "posts";
CREATE TABLE "posts" (
	id serial NOT NULL PRIMARY KEY,
	title VARCHAR(180) NULL,
	url VARCHAR(510) NULL,
	content	text NULL,
	created_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT now(),
	updated_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT now(),
	users_id integer REFERENCES users(id) NOT NULL
);

DROP TABLE IF EXISTS "comments";
CREATE TABLE "comments" (
	id serial NOT NULL PRIMARY KEY,
	body VARCHAR(510) NULL,
	created_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT now(),
	updated_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT now(),
	users_id integer REFERENCES users(id) NOT NULL,
	posts_id integer REFERENCES posts(id) NOT NULL
);

\i scripts/blog_data.sql
\i joins.sql
