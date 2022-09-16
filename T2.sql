CREATE EXTENSION citext;
CREATE DOMAIN domain_email AS citext
CHECK(
VALUE ~ '^\w+@[a-zA-Z_]+?\.[a-zA-Z]{2,3}$'
);

CREATE TABLE volunteer_general_information (
volunteer_first_name CHAR(30) NOT NULL,
volunteer_last_name CHAR(30) NOT NULL,
volunteer_email domain_email NOT NULL, 
volunteer_contact_number CHAR(10),
volunteer_suburb VARCHAR(30) NOT NULL,
volunteer_state CHAR(3) NOT NULL,
volunteer_about_me VARCHAR(1000),
volunteer_skills1 VARCHAR(30),
volunteer_skills2 VARCHAR(30),
volunteer_skills3 VARCHAR(30),
volunteer_skills4 VARCHAR(30),
volunteer_skills5 VARCHAR(30),
volunteer_resume BYTEA,
PRIMARY KEY (volunteer_email)
);

CREATE TABLE volunteer_profile_information (
volunteer_your_company CHAR(50) NOT NULL,
volunteer_identification_document BYTEA,
volunteer_profile_picture BYTEA, 
volunteer_about_me VARCHAR(1000),
volunteer_degree CHAR(100) NOT NULL,
volunteer_start_date DATE NOT NULL,
volunteer_end_date DATE NOT NULL,
volunteer_resume BYTEA,
volunteer_linkedin VARCHAR(200),
volunteer_facebook VARCHAR(200),
volunteer_instagram VARCHAR(200) 
);

CREATE TABLE organisation_general_information (
organisation_company_name CHAR(50) NOT NULL,
organisation_email domain_email NOT NULL,
organisation_contact_number CHAR(10),
organisation_about_us VARCHAR(2000) NOT NULL,
PRIMARY KEY (organisation_email)
);

CREATE TABLE organisation_profile_information (
organisation_company_description VARCHAR(2000) NOT NULL,
organisation_security_assessment BYTEA
);

INSERT INTO volunteer_general_information
	VALUES ('Charlie', 'Simpson', 'csim@deakin.com', 0412345678, 'Clayton', 'VIC', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.  Cras at libero id magna.', 'Ethical Hacking', 'Digital Forensics', 'Coding', 'Communications', 'Leadership', NULL);
INSERT INTO volunteer_general_information
	VALUES ('Beau', 'Harris', 'bhar@deakin.com', 0487654321, 'Burwood', 'VIC', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.  Cras at libero id magna.', 'Ethical Hacking', 'Digital Forensics', 'Coding', 'Communications', 'Leadership', NULL);
INSERT INTO volunteer_general_information
	VALUES ('Keegan', 'Mason', 'kmas@deakin.com', 0411222333, 'Glen Waverlet', 'VIC', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.  Cras at libero id magna.', 'Ethical Hacking', 'Digital Forensics', 'Coding', 'Communications', 'Leadership', NULL);
INSERT INTO volunteer_general_information
	VALUES ('Sam', 'MacLay', 'smac@deakin.com', 0411111111, 'Mount Waverley', 'VIC', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.  Cras at libero id magna.', 'Ethical Hacking', 'Digital Forensics', 'Coding', 'Communications', 'Leadership', NULL);
	
INSERT INTO volunteer_profile_information
	VALUES ('Google', 'NULL', 'NULL', 'Ut pulvinar ipsum augue. Mauris eu dapibus est. Ut dictum tortor a leo tempor feugiat. In hac habitasse platea dictumst.', 'Bachelor of Cyber Security', '01-Jan-2016', '01-Nov-2018', NULL, 'http://www.facebook.com/pinkbunny77', 'http://www.linkedin.com/charliesimpson', 'http://www.instagram.com/charliesface');
INSERT INTO volunteer_profile_information
	VALUES ('Microsoft', NULL, NULL, 'Ut pulvinar ipsum augue. Mauris eu dapibus est. Ut dictum tortor a leo tempor feugiat. In hac habitasse platea dictumst.', 'Master of Cyber Security', '01-Jan-2020', '01-Nov-2021', NULL, 'http://www.facebook.com/gocats2022', 'http://www.linkedin.com/beauharris1990', 'http://www.instagram.com/123456789');
INSERT INTO volunteer_profile_information
	VALUES ('Apple', NULL, NULL, 'Ut pulvinar ipsum augue. Mauris eu dapibus est. Ut dictum tortor a leo tempor feugiat. In hac habitasse platea dictumst.', 'Bachelor of Cyber Security', '01-Jan-2011', '01-Nov-2013', NULL, 'http://www.facebook.com/00817654', 'http://www.linkedin.com/01beauharris', 'http://www.instagram.com/harrisparty');
INSERT INTO volunteer_profile_information
	VALUES ('Hewlett-Packard', NULL, NULL, 'Ut pulvinar ipsum augue. Mauris eu dapibus est. Ut dictum tortor a leo tempor feugiat. In hac habitasse platea dictumst.', 'Master of Cyber Security', '01-Jan-2016', '01-Jul-2021', NULL, 'http://www.facebook.com/keeganmasson66', 'http://www.linkedin.com/masonk', 'http://www.instagram.com/keeganmason1089');

INSERT INTO organisation_general_information
	VAlUES ('ACME High School', 'acme@bigpond.com', '0398765432', 'Cras porttitor ipsum in ligula elementum fringilla. Sed mauris metus, consectetur sit amet tortor eget, condimentum congue erat. Suspendisse congue magna vel diam lacinia euismod.');
INSERT INTO organisation_general_information
	VAlUES ('South-Western Volunteers', 'swv@outlook.com', '0398765432', 'Cras porttitor ipsum in ligula elementum fringilla. Sed mauris metus, consectetur sit amet tortor eget, condimentum congue erat. Suspendisse congue magna vel diam lacinia euismod.');
INSERT INTO organisation_general_information
	VAlUES ('Melbourne Charity', 'mc@bigpond.com', '0398765432', 'Cras porttitor ipsum in ligula elementum fringilla. Sed mauris metus, consectetur sit amet tortor eget, condimentum congue erat. Suspendisse congue magna vel diam lacinia euismod.');
INSERT INTO organisation_general_information
	VAlUES ('Glen Waverley Private Hospital', 'gwp@outlook.com', '0398765432', 'Cras porttitor ipsum in ligula elementum fringilla. Sed mauris metus, consectetur sit amet tortor eget, condimentum congue erat. Suspendisse congue magna vel diam lacinia euismod.');

INSERT INTO organisation_profile_information
	VALUES ('Mauris a facilisis leo. Suspendisse eu quam feugiat, ullamcorper arcu eu, vestibulum lorem. In quis velit diam. Phasellus orci ipsum.', NULL);
INSERT INTO organisation_profile_information
	VALUES ('Mauris a facilisis leo. Suspendisse eu quam feugiat, ullamcorper arcu eu, vestibulum lorem. In quis velit diam. Phasellus orci ipsum.', NULL);
INSERT INTO organisation_profile_information
	VALUES ('Mauris a facilisis leo. Suspendisse eu quam feugiat, ullamcorper arcu eu, vestibulum lorem. In quis velit diam. Phasellus orci ipsum.', NULL);
INSERT INTO organisation_profile_information
	VALUES ('Mauris a facilisis leo. Suspendisse eu quam feugiat, ullamcorper arcu eu, vestibulum lorem. In quis velit diam. Phasellus orci ipsum.', NULL);	
