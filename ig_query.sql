USE ig_clone;

SELECT * FROM users;
SELECT * FROM photos;
SELECT * FROM comments;
SELECT * FROM likes;
SELECT * FROM follows;
SELECT * FROM tags;
SELECT * FROM photo_tags;


-- Users who have been aroung longest (5 oldest)

SELECT 
	username,
	created_at
FROM users
ORDER BY created_at LIMIT 5;

-- What day of the week do most users register on?

SELECT 	
    DAYNAME(created_at) as which_day,
    COUNT(*) AS total
FROM users
GROUP BY which_day
ORDER BY total DESC 
LIMIT 1;

-- Find users who have never posted on photo

SELECT
	username,
    IFNULL(image_url, 'No Post Yet')
FROM users
LEFT JOIN photos
	ON users.id = photos.user_id
WHERE image_url IS NULL;


-- Who got most likes on single photo

SELECT 
	username,
    COUNT(*) AS total
FROM photos
INNER JOIN likes
	ON likes.photo_id = photos.id
INNER JOIN users
	ON photos.user_id = users.id
GROUP BY photos.id
ORDER BY total DESC
LIMIT 1;

-- How many times does the user post?

SELECT 
    username,
 	COUNT(photos.id) as total
FROM users
JOIN photos
	ON photos.user_id = users.id
GROUP BY username;

-- Average

SELECT
	(SELECT COUNT(*) FROM photos) / (SELECT COUNT(*) FROM users) AS avg;


