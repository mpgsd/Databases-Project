DROP PROCEDURE IF EXISTS employeejobprogress;
DELIMITER $
CREATE PROCEDURE employeejobprogress(IN empl_name VARCHAR(25), IN empl_surname VARCHAR(35))
BEGIN
	DECLARE usrname VARCHAR(12);
	DECLARE jobid INT;
	DECLARE evusrname VARCHAR(12);

	SELECT username INTO usrname FROM user WHERE name=empl_name and surname=empl_surname;

    SELECT * FROM job_applications WHERE empl_username=usrname;
	IF (SELECT evaluation_result FROM evaluation WHERE empl_username=usrname) = NULL THEN
		SELECT 'Evaluation still in progress';
	ELSE
		SELECT * FROM evaluation WHERE empl_username=usrname;
	END IF;

	SELECT job_id INTO jobid FROM evaluation_result WHERE empl_username=usrname;
	SELECT evaluator INTO evusrname FROM job WHERE id=jobid;
	SELECT name FROM user WHERE username=evusrname;
    SELECT surname FROM user WHERE username=evusrname;
END$
DELIMITER ;

DROP PROCEDURE IF EXISTS getevaluationprogress;
DELIMITER $
CREATE PROCEDURE getevaluationprogress(IN jobid INT)
BEGIN
	DECLARE empl_usrname VARCHAR(12);
	DECLARE jinterview INT;
	DECLARE jreport INT;
	DECLARE jachievements INT;
	DECLARE final INT;
    
	SELECT interview INTO jinterview FROM evaluation WHERE job_id=jobid;
	SELECT report INTO jreport FROM evaluation WHERE job_id=jobid;
	SELECT achievements INTO jachievements FROM evaluation WHERE job_id=jobid;
	SELECT empl_username INTO empl_usrname FROM evaluation WHERE job_id=jobid;
	IF (jinterview!=NULL AND jreport!=NULL AND jachievements!=NULL) THEN
	SET final = jinterview + jreport + jachievements;
	INSERT INTO evaluationresult (empl_username, job_id, grade, comments) VALUES (empl_usrname, jobid, final, '');
	END IF;
END$
DELIMITER ;

DROP PROCEDURE IF EXISTS getevaluationemployees;
DELIMITER $
CREATE PROCEDURE getevaluationemployees(IN jobid INT)
BEGIN
	DECLARE finished INT DEFAULT 0;
	DECLARE eval INT DEFAULT 0;
	DECLARE empl VARCHAR(12);

	DEClARE curEval 
		CURSOR FOR 
			SELECT evaluation_result FROM evaluation WHERE job_id=jobid;

	DEClARE curEmpl 
		CURSOR FOR 
			SELECT empl_username FROM evaluation WHERE job_id=jobid;

	DECLARE CONTINUE HANDLER 
        FOR NOT FOUND SET finished = 1;

	CREATE TABLE temp (empl_usrname VARCHAR(12), eval_result INT);

	OPEN curEval;
	OPEN curEmpl;

	getEval: LOOP
		FETCH curEval INTO eval;
		IF finished = 1 THEN 
			LEAVE getEval;
		END IF;

		FETCH curEmpl INTO empl;
		IF finished = 1 THEN 
			LEAVE getEval;
		END IF;
 
		IF eval != NULL THEN
			INSERT INTO temp VALUES (empl, eval);
		END IF;
	END LOOP getEval;
	ClOSE curEval;
	CLOSE curEmpl;
	
	SELECT * FROM temp 
	ORDER BY eval_result DESC;

	DROP TABLE temp;
END$
DELIMITER ;