CREATE OR REPLACE FUNCTION validate_summary_func() 
	RETURNS TRIGGER LANGUAGE plpgsql
AS
$trigfunc$
BEGIN
	RAISE EXCEPTION USING MESSAGE = 'The summary is being inserted incorrectly.',
	ERRCODE = 22000;
END;
$trigfunc$;

CREATE TRIGGER validate_summary_trg
BEFORE UPDATE OR INSERT ON Post
FOR EACH ROW WHEN(NEW.summary != SUBSTRING(New.content FROM 1 FOR 10)|| '...')
EXECUTE PROCEDURE validate_summary_func();
				  
INSERT INTO Post(post_id, person_id, content, created_on, summary)
VALUES (nextval('post_seq'), (SELECT person_id FROM Person WHERE first_name = 'Ryan'),
		'It is raning outside',
		CAST('10-SEP-2022' AS DATE),
		SUBSTRING('It is raning outside' FROM 1 FOR 10)  || '...');

INSERT INTO Post(post_id, person_id, content, created_on, summary)
VALUES (nextval('post_seq'), (SELECT person_id FROM Person WHERE first_name = 'Sophia'),
		'I am feeling so hot now',
		CAST('11-SEP-2020' AS DATE),
		SUBSTRING('I am feeling so hot now' FROM 1 FOR 5)  || '...');

SELECT * FROM Post;