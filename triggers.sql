DELIMITER $$
CREATE TRIGGER job_ins AFTER INSERT ON job
FOR EACH ROW
BEGIN 
INSERT INTO logs VALUES (username, CURRENT_TIMESTAMP(), 1, "insert", 'job');
END $$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER job_upd AFTER UPDATE ON job
FOR EACH ROW
BEGIN 
INSERT INTO logs VALUES (username, CURRENT_TIMESTAMP(), 1, "update", 'job');
END $$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER job_del AFTER DELETE ON job
FOR EACH ROW
BEGIN 
INSERT INTO logs VALUES (username, CURRENT_TIMESTAMP(), 1, "delete", 'job');
END $$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER employee_ins AFTER INSERT ON employee
FOR EACH ROW
BEGIN 
INSERT INTO logs VALUES (username, CURRENT_TIMESTAMP(), 1, "insert", 'employee');
END $$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER employee_upd AFTER UPDATE ON employee
FOR EACH ROW
BEGIN 
INSERT INTO logs VALUES (username, CURRENT_TIMESTAMP(), 1, "update", 'employee');
END $$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER employee_del AFTER DELETE ON employee
FOR EACH ROW
BEGIN 
INSERT INTO logs VALUES (username, CURRENT_TIMESTAMP(), 1, "delete", 'employee');
END $$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER requestevaluation_ins AFTER INSERT ON requestevaluation
FOR EACH ROW
BEGIN 
INSERT INTO logs VALUES (username, CURRENT_TIMESTAMP(), 1, "insert", 'requestevaluation');
END $$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER requestevaluation_upd AFTER UPDATE ON requestevaluation
FOR EACH ROW
BEGIN 
INSERT INTO logs VALUES (username, CURRENT_TIMESTAMP(), 1, "update", 'requestevaluation');
END $$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER requestevaluation_del AFTER DELETE ON requestevaluation
FOR EACH ROW
BEGIN 
INSERT INTO logs VALUES (username, CURRENT_TIMESTAMP(), 1, "delete", 'requestevaluation');
END $$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER prevent_comp_update BEFORE UPDATE ON company
FOR EACH ROW
BEGIN 
SET NEW.AFM = OLD.AFM;
SET NEW.DOY = OLD.DOY;
SET NEW.name = OLD.name;
END $$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER prevent_user_update BEFORE UPDATE ON `user`
FOR EACH ROW
BEGIN 
IF (SELECT role FROM user_role WHERE `user`.username=username) != "admin" THEN
SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'Not authorized for this action';
END IF;
END $$
DELIMITER ;

