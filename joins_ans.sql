
-- joins.sql

SELECT * FROM users;

SELECT * FROM posts WHERE posts.user_id = 100;

SELECT posts.*, users.first_name, users.last_name FROM users INNER JOIN posts ON users.id = posts.users_id WHERE users_id = 200;

SELECT posts.*;

-- 4. Create a query to get all posts fields, and the user's username, from the posts table where the user's first name is 'Norene' and the user's last_name is 'Schmitt'

-- DECLARATIVE PROGRAMMING

SELECT p.*, u.username FROM posts
	INNER JOIN users u
	ON p.users_id = u.id
	WHERE u.first_name = 'Norene'
	AND u.last_name = 'Schmitt';

-- 5. Create a query to get usernames from the users table where the user has created a post after January 1, 2015

SELECT username, posts.* FROM users
	JOIN posts
	ON posts.users_id = users.id
	WHERE posts.created_at > '2015-01-01 00:00:00-10';

-- 6. Create a query to get the post title, post content, and user's username where the user who created the post joined before January 1, 2015

/* in HAWAII 23552
	 in GREENWICH 23488 */

SELECT p.title FROM users u
	INNER JOIN posts p
	ON p.users_id = u.id
	WHERE u.created_at < '2015-01-01 00:00:00-10';

-- 7. Create a query to get the all rows in the comments table, showing post title (aliased as 'Post Title'), and the all the comments's fields

SELECT c.*, p.title as "Post Title"
	FROM posts p
	INNER JOIN comments c
	ON c.posts_id = p.id;

-- 8. Create a query to get the all rows in the comments table, showing post title (aliased as post_title), post url (aliased as post_url), and the comment body (aliased as comment_body) where the post was created before January 1, 2015

-- SELECT c.*, p.title as "post_title", p.url as "post_url", c.body as "comment_body"
--	FROM users u
--	INNER JOIN posts p
--	ON p.users_id = u.id
--	INNER JOIN comments c
--	ON c.posts_id = p.id
--	WHERE p.created_at < '2015-01-01 00:00:00-10';
