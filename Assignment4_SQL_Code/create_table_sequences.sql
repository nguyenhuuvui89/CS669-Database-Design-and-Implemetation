
INSERT INTO person 
VALUES 
	(nextval('person_seq'), 'Mike', 'Judes','mikej'),
	(nextval('person_seq'), 'Ryan', 'Bryant','R.Bryant'),
	(nextval('person_seq'), 'Lindsay', 'Gambin','Linsday_G'),
	(nextval('person_seq'), 'Sophia', 'Ng','Sophia_Ng'),
	(nextval('person_seq'), 'Marinda', 'Dean','Marinda.D');

INSERT INTO Post 
VALUES
 	(nextval('post_seq'),(SELECT person_id FROM Person WHERE first_name = 'Mike'), 
	 'The weather is nice today', CAST('20-SEP-2022' AS DATE), 'The weathe...' ),
	 
	(nextval('post_seq'),(SELECT person_id FROM Person WHERE first_name = 'Lindsay'), 
	 'Check in Miami Beach', CAST('21-SEP-2022' AS DATE), 'Check in M...' ),
	 
	(nextval('post_seq'),(SELECT person_id FROM Person WHERE first_name = 'Marinda'), 
	 'Amazing Sunset', CAST('18-SEP-2022' AS DATE), 'Amazing Su...' ),
	 
	(nextval('post_seq'),(SELECT person_id FROM Person WHERE first_name = 'Sophia'), 
	 'I am coming home', CAST('19-SEP-2022' AS DATE), 'I am comin...' ),
	 
	(nextval('post_seq'),(SELECT person_id FROM Person WHERE first_name = 'Ryan'), 
	 'Just bought new iphone', CAST('12-SEP-2022' AS DATE), 'Just bough...' ),
	 
	(nextval('post_seq'),(SELECT person_id FROM Person WHERE first_name = 'Mike'), 
	 'I am so angry', CAST('25-SEP-2022' AS DATE), 'I am so an...' ),
	 
	(nextval('post_seq'),(SELECT person_id FROM Person WHERE first_name = 'Sophia'), 
	 'I love swimming', CAST('23-SEP-2022' AS DATE), 'I love swi...' ),
	 
	(nextval('post_seq'),(SELECT person_id FROM Person WHERE first_name = 'Lindsay'), 
	 'Going to cruise ship', CAST('26-SEP-2022' AS DATE), 'Going to c...' );

INSERT INTO Likes 
VALUES
	(nextval('likes_seq'), (SELECT person_id FROM Person WHERE first_name = 'Mike'), 
	(SELECT post_id FROM Post WHERE summary = 'Check in M...'), CAST('22-SEP-2022' AS DATE)),
	
	(nextval('likes_seq'), (SELECT person_id FROM Person WHERE first_name = 'Lindsay'), 
	(SELECT post_id FROM Post WHERE summary = 'I am comin...'), CAST('21-SEP-2022' AS DATE)),
	
	(nextval('likes_seq'), (SELECT person_id FROM Person WHERE first_name = 'Sophia'), 
	(SELECT post_id FROM Post WHERE summary = 'Just bough...'), CAST('18-SEP-2022' AS DATE)),
	
	(nextval('likes_seq'), (SELECT person_id FROM Person WHERE first_name = 'Ryan'), 
	(SELECT post_id FROM Post WHERE summary = 'Going to c...'), CAST('29-SEP-2022' AS DATE)); 


	 
	 




















