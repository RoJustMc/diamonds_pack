USE `es_extended`;

INSERT INTO `addon_account` (name, label, shared) VALUES
	('society_diamonds','Diamonds',1)
;

INSERT INTO `datastore` (name, label, shared) VALUES
	('society_diamonds','Diamonds',1)
;

INSERT INTO `addon_inventory` (name, label, shared) VALUES
	('society_diamonds', 'Diamonds', 1)
;

INSERT INTO `jobs` (name, label) VALUES
	('diamonds', 'Diamonds')
;

INSERT INTO `job_grades` (job_name, grade, name, label, salary, skin_male, skin_female) VALUES
	('diamonds',0,'recruit','Neuling',0,'{}','{}'),
	('diamonds',1,'officer','Member',0,'{}','{}'),
	('diamonds',2,'officer','Runner',0,'{}','{}'),
	('diamonds',3,'sergeant','Caller',0,'{}','{}'),
	('diamonds',4,'lieutenant','Vize-OG',0,'{}','{}'),
	('diamonds',5,'boss','OG',0,'{}','{}')
;

