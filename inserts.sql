INSERT INTO company 
(AFM,	DOY,    			name,			phone,      street,         num,    city,           country) VALUES
(1234,	'CENTRAL ATHENS', 	'MASOUTHS', 	2102935762, 'MIAOULH',      NULL,   'ATHENS',       'GREECE'),
(2345, 	'THESSALONIKIS',	'LAVDAS',      	2396067901, 'KAROLOY',      NULL,   'THESSALONIKI', 'GREECE'),
(3456, 	'XANIWN',        	'STEIAKAKHS',   2810323459, 'XATZIDAKH',    NULL,   'CRETE',   		'GREECE');

INSERT INTO degree  
(titlos,                    idryma,                     bathmida) VALUES
('MHXANIKOS H/Y',           'UNIVERSITY OF PATRAS',     'MASTER'),
('HLEKTROLOGOS MHXANIKOS',  'TEI DUTIKHS ATTIKHS',      'UNIV'),
('APOLYTHRIO',              '57o LUKEIO ATHINWN',       'LYKEIO');

INSERT INTO  `user`
(username  , 	`password`, 	name , 		surname , 		reg_date , 	email) VALUES
('mark', 		'12', 			'markos', 	'seferlis', 	'2019-12-20',	'mark@hotmail.com'), 
('nick', 		'123',	 		'nikos', 	'papadopoulos', '2019-12-21',	'nick@hotmail.com'),
('mary', 		'1234', 		'maria', 	'makri', 		'2019-12-22',	'mary@hotmail.com'),
('kostas1', 	'12345', 		'kostas', 	'kakouros', 	'2019-09-11',	'kostas@hotmail.com'),
('marios1', 	'123456', 		'marios', 	'martakis', 	'2019-09-12',	'marios@hotmail.com'),
('dimitris1', 	'1234567', 		'dimitris', 'manis', 		'2019-09-13',	'dimitris@hotmail.com'),
('manos1', 		'12345678', 	'manos', 	'papas', 		'2019-09-14',	'manos@hotmail.com'),
('baggelis1', 	'1234567890',	'baggelis', 'lagos', 		'2019-09-15',	'baggelis@hotmail.com'),
('takis1', 		'12345678901',	'takis', 	'ksenos', 		'2019-09-16',	'takis@hotmail.com');

INSERT INTO employee    
(username, 	bio, 																			sistatikes, 																certificates, 											awards) VALUES
('mark', 	'He plays professional football and  have worked at walmart', 					'nothing', 																	'certificate of highschool graduation', 				'most football goals in a year award'),   
('nick', 	'Ηe worked for 5 companies and  he is as experiences as possible', 				'mr nick was the best employee of the month at our company for 12 months',	'highschool diploma,degree of computer engineering',	'worlds best artificial intelligence project of year 2014-2015 award'),  
('mary', 	'She just completed her senior year of college and plays amateur volleyball', 	'mrs maria was one of our best students', 									'degree of hlektrologon mhxanikon', 					'nothing ');

INSERT INTO manager
(managerUsername, 	exp_years,	firm) VALUES
('kostas1', 		5,	 		1234), 
('marios1', 		6, 			2345),
('dimitris1',		7, 			3456); 

INSERT INTO needs   
(job_id,	antikeim_title) VALUES
(1, 		'servant' ), 
(2, 		'programming'), 
(3, 		'director of the company ceo');

INSERT INTO evaluator  
(username  , 	exp_years  , 	firm) VALUES
('manos1',		2,  			1234), 
('baggelis1',	3, 				2345), 
('takis1',		4, 				3456) ;

INSERT INTO antikeim  
(title , 						descr, 											belongs_to) VALUES
('servant', 					'bringing coffee', 								'n/a'), 
('programming ',				'programming at java language', 				'computer technology'),
('director of the company ceo', 'making important decisions for the company',	'n/a'); 

INSERT INTO project    
(empl,		num,	descr  ,																																	url) VALUES
('nick',	1,		'a program of artificial inteligence which plays chess ,is based on machine learning and is getting better by every game that it plays' ,	'nickproject.gr'), 
('mark', 	0,		'n/a',																																		'n/a'), 
('mary', 	0, 		'n/a',																																		'n/a');

INSERT INTO languages  
(employee, 	lang ) VALUES
('mark',	'EN'), 
('nick', 	'EN, FR, GR'), 
('mary', 	'EN, SP');

INSERT INTO requestevaluation 
(empl_username,	job_id ) VALUES
('mark',		'1'), 
('nick', 		'3'), 
('mary', 		'2');

INSERT INTO job    
(id,	start_date,		salary,		`position`,		edra,				evaluator,		announce_date,	    submission_date) VALUES
(1 , 	'2020-01-12', 	'1000', 	'servant', 		'thessaloniki',		'manos1',		'2019-12-25',		'2020-01-29'),
(2 , 	'2020-01-15', 	'10000', 	'programmer',	'xania',			'baggelis1',	'2019-12-25',		'2020-01-29'), 
(3 , 	'2020-01-18', 	'100000', 	'ceo', 			'athens',			'takis1',	    '2019-12-25',		'2020-01-29'); 

INSERT INTO has_degree    
(degr_title, 				degr_idryma, 				empl_username, 		etos, 		grade) VALUES 
('MHXANIKOS H/Y', 	'UNIVERSITY OF PATRAS', 	'nick',				5,			10),
('HLEKTROLOGOS MHXANIKOS', 	'TEI DUTIKHS ATTIKHS ', 	'mary', 			5, 			9) ;

INSERT INTO evaluationresult    
(EVid, 		empl_username ,	job_id,		grade, 	comments) VALUES
(12, 		'mark', 		1, 			2, 		'mr markos was 20 min late'),
(13, 		'nick', 		3, 			10, 	'mr nikos was very polite'), 
(14, 		'mary', 		2, 			7, 		'mrs maria was very confident'); 

INSERT INTO evaluation
(empl_username,	job_id,	interview, 	report,	achievements, 	evaluation_result) VALUES
('mark',		1, 		1, 			1,		0,				2), 
('nick', 		3, 		4, 			4, 		2,				10), 
('mary',		2, 		3,			3,		1,				7); 

INSERT INTO job_application 
(job_id,	empl_username) VALUES
(1, 		'mark'), 
(3, 		'nick'), 
(2, 		'mary');

INSERT INTO `log`  
(username , 	date_time, 	success,	kind, 	table_name     ) VALUES
('kostas1', 	'2020-01-01',	1,		'delete',	'evaluationresult'), 
('manos1', 		'2020-01-02',	1,		'update', 	'evaluation '), 
('baggelis1',	'2020-01-03',	1,		'insert',	'evaluation');

INSERT INTO user_role   
(username, 		role) VALUES
('mark', 		'employee'), 
('nick', 		'employee'), 
('mary', 		'employee'),
('kostas1', 	'manager'),
('marios1', 	'manager'),
('dimitris1', 	'manager'),
('manos1', 		'evaluator'),
('baggelis1', 	'evaluator'),
('takis1', 		'evaluator'); 