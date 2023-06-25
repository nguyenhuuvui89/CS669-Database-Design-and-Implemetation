CREATE OR REPLACE FUNCTION liked_on_func()
RETURNS TRIGGER LANGUAGE plpgsql
AS 
$$
DECLARE 
	v_valid_liked_on DATE;
BEGIN
	SELECT post.created_on
	INTO v_valid_liked_on
	FROM Post 
	WHERE Post.post_id = New.post_id;
	
	IF New.liked_on < v_valid_liked_on THEN
	RAISE EXCEPTION USING MESSAGE = 'The liked_on date should be after the post created_on date',
	ERRCODE = 22000;
	END IF;
	RETURN NEW;		
END;
$$;

CREATE TRIGGER liked_on_trg
BEFORE UPDATE OR INSERT ON Likes
FOR EACH ROW
EXECUTE PROCEDURE liked_on_func()

INSERT INTO likes (likes_id, person_id, post_id, liked_on) 
VALUES (nextval('likes_seq'), 5, 4, CAST('21-SEP-2022' AS DATE));

INSERT INTO likes (likes_id, person_id, post_id, liked_on) 
VALUES (nextval('likes_seq'), 1, 3, CAST('10-SEP-2022' AS DATE));

SELECT * FROM Likes;
