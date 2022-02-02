DROP SCHEMA IF EXISTS transportdb;
CREATE SCHEMA IF NOT EXISTS transportdb;

USE transportdb;

DROP TABLE IF EXISTS bookings;
DROP TABLE IF EXISTS clientgroups;
DROP TABLE IF EXISTS clientusers;
DROP TABLE IF EXISTS transactions;

CREATE TABLE IF NOT EXISTS clientusers (
	username VARCHAR(45),
    last_name VARCHAR(45),
    first_name VARCHAR(45),
    password VARCHAR(45),
    gender VARCHAR(1),
    bday DATE,
    contact_no VARCHAR(12),
    address VARCHAR(100),
    EM_name VARCHAR(45),
    EM_address VARCHAR(100),
    EM_contact_no VARCHAR(12),
    nationality VARCHAR(45),
    status VARCHAR(1),
    reject_reason VARCHAR(45),
    TO_username VARCHAR(45),
    PRIMARY KEY (username)
);

CREATE TABLE IF NOT EXISTS clientgroups (
	group_ID INT(12),
    start_date DATE,
    end_date DATE,
    username_rep VARCHAR(45) NOT NULL,
    PRIMARY KEY (group_id),
    FOREIGN KEY (username_rep) REFERENCES clientusers(username)
);

CREATE TABLE IF NOT EXISTS bookings (
	booking_ID INT(12),
    date DATE,
    start_time TIME,
    end_time TIME,
    date_confirmed DATE,
    date_booked DATE,
    date_cancelled DATE,
    group_ID INT(12) NOT NULL,
    username VARCHAR(45) NOT NULL,
    PRIMARY KEY (booking_ID),
    FOREIGN KEY (group_ID) REFERENCES clientgroups(group_ID),
    FOREIGN KEY (username) REFERENCES clientusers(username)
);


CREATE TABLE IF NOT EXISTS transactions(
	trans_no INT(12),
	booking_ID INT(12),
    trans_date DATE,
    trans_type CHAR(1),
    card_no INT(12),
    amount DECIMAL(9.2)
);



INSERT INTO clientusers (username, last_name, first_name, password, gender, bday, contact_no, address, EM_name, EM_address, EM_contact_no, nationality, status, TO_username)
VALUES (
	'luigivalera',
    'Valera',
    'Luis Angelo',
    'p@ssword',
    'M',
    '1999-01-01',
    '1234567890',
    'Manila',
    'Mario',
    'Mushroom Kingdom',
    '1234567890',
    'FILIPINO',
    'A',
    'Sir Oli'
    );
    
INSERT INTO clientusers (username, last_name, first_name, password, gender, bday, contact_no, address, EM_name, EM_address, EM_contact_no, nationality, status, TO_username)
VALUES (
	'jedwigtan',
    'Tan',
    'Jedwig Siegfried',
    'p@ssword',
    'M',
    '1999-01-01',
    '1234567890',
    'Manila',
    'Crush ni Jed',
    'Puso ni Jed',
    '1234567890',
    'FILIPINO',
    'P',
    'Sir Oli'
    );
    
INSERT INTO clientusers (username, last_name, first_name, password, gender, bday, contact_no, address, EM_name, EM_address, EM_contact_no, nationality, status, TO_username)
VALUES (
	'alysilverio',
    'Silverio',
    'Gwyneth Alysson',
    'p@ssword',
    'F',
    '1999-01-01',
    '1234567890',
    'Manila',
    'Jedwig Siegfried',
    'Manila',
    '1234567890',
    'FILIPINO',
    'A',
    'Sir Oli'
    );
    
INSERT INTO clientusers (username, last_name, first_name, password, gender, bday, contact_no, address, EM_name, EM_address, EM_contact_no, nationality, status, TO_username)
VALUES (
	'victoriazeline',
    'Alviz',
    'Victoria',
    'p@ssword',
    'F',
    '1999-01-01',
    '1234567890',
    'Manila',
    'Luigi',
    'Manila',
    '1234567890',
    'FILIPINO',
    'P',
    'Sir Oli'
    );
    
INSERT INTO clientusers (username, last_name, first_name, password, gender, bday, contact_no, address, EM_name, EM_address, EM_contact_no, nationality, status, TO_username)
VALUES (
	'johndoe',
    'Doe',
    'John',
    'p@ssword',
    'M',
    '1999-01-01',
    '1234567890',
    'New York',
    'Jane',
    'Chicago',
    '1234567890',
    'AMERICAN',
    'A',
    'Sir Oli'
    );
    
    INSERT INTO clientusers (username, last_name, first_name, password, gender, bday, contact_no, address, EM_name, EM_address, EM_contact_no, nationality, status, TO_username)
VALUES (
	'janedoe',
    'Doe',
    'Jane',
    'p@ssword',
    'F',
    '1999-01-01',
    '1234567890',
    'Chicago',
    'John',
    'New York',
    '1234567890',
    'AMERICAN',
    'A',
    'Sir Oli'
    );
    
INSERT INTO clientusers (username, last_name, first_name, password, gender, bday, contact_no, address, EM_name, EM_address, EM_contact_no, nationality, status, TO_username)
VALUES (
	'sherlockholmes',
    'Holmes',
    'Sherlock',
    'p@ssword',
    'M',
    '1999-01-01',
    '1234567890',
    'London',
    'Moriarty',
    'London',
    '1234567890',
    'BRITISH',
    'A',
    'Sir Oli'
    );
    
INSERT INTO clientusers (username, last_name, first_name, password, gender, bday, contact_no, address, EM_name, EM_address, EM_contact_no, nationality, status, TO_username)
VALUES (
	'brucewayne',
    'Wayne',
    'Bruce',
    'p@ssword',
    'M',
    '1999-01-01',
    '1234567890',
    'Gotham City',
    'Alfred',
    'Gotham City',
    '1234567890',
    'AMERICAN',
    'P',
    'Sir Oli'
    );
    
    INSERT INTO clientusers (username, last_name, first_name, password, gender, bday, contact_no, address, EM_name, EM_address, EM_contact_no, nationality, status, TO_username)
VALUES (
	'martymcfly',
    'McFly',
    'Marty',
    'p@ssword',
    'M',
    '1999-01-01',
    '1234567890',
    'Hill Valley',
    'Emmett',
    'Hill Valley',
    '1234567890',
    'AMERICAN',
    'A',
    'Sir Oli'
    );
    
INSERT INTO clientusers (username, last_name, first_name, password, gender, bday, contact_no, address, EM_name, EM_address, EM_contact_no, nationality, status, TO_username)
VALUES (
	'ikarishinji',
    'Ikari',
    'Shinji',
    'p@ssword',
    'M',
    '1999-01-01',
    '1234567890',
    'Tokyo 2',
    'Rei',
    'Geofront',
    '1234567890',
    'JAPANESE',
    'A',
    'Sir Oli'
    );
    
INSERT INTO clientusers (username, last_name, first_name, password, gender, bday, contact_no, address, EM_name, EM_address, EM_contact_no, nationality, status, TO_username)
VALUES (
	'mario',
    '',
    'Mario',
    'p@ssword',
    'M',
    '1999-01-01',
    '1234567890',
    'Mushroom Kingdom',
    'Princess Peach',
    'Mushroom Kingdom',
    '1234567890',
    'ITALIAN',
    'A',
    'Sir Oli'
    );
    
INSERT INTO clientusers (username, last_name, first_name, password, gender, bday, contact_no, address, EM_name, EM_address, EM_contact_no, nationality, status, TO_username)
VALUES (
	'link',
    '',
    'Link',
    'p@ssword',
    'M',
    '1999-01-01',
    '1234567890',
    'Hyrule Castle',
    'Zelda',
    'Hyrule Castle',
    '1234567890',
    'HYRULEAN',
    'A',
    'Sir Oli'
    );
    
INSERT INTO clientusers (username, last_name, first_name, password, gender, bday, contact_no, address, EM_name, EM_address, EM_contact_no, nationality, status, TO_username)
VALUES (
	'zelda',
    '',
    'Zelda',
    'p@ssword',
    'F',
    '1999-01-01',
    '1234567890',
    'Hyrule Castle',
    'Link',
    'Hyrule Castle',
    '1234567890',
    'HYRULEAN',
    'A',
    'Sir Oli'
    );
    
    INSERT INTO clientgroups (group_ID, username_rep, start_date)
    VALUES (
		'101',
        'luigivalera',
        '2019-01-01'
        );
        
	INSERT INTO clientgroups (group_ID, username_rep, start_date)
    VALUES (
		'102',
        'luigivalera',
        '2019-01-01'
        );
	
    INSERT INTO clientgroups (group_ID, username_rep, start_date)
    VALUES (
		'103',
        'jedwigtan',
        '2019-01-01'
        );
        
	INSERT INTO clientgroups (group_ID, username_rep, start_date)
    VALUES (
		'104',
        'jedwigtan',
        '2019-01-01'
        );
        
	INSERT INTO clientgroups (group_ID, username_rep, start_date)
    VALUES (
		'105',
        'alysilverio',
        '2019-01-01'
        );
        
	INSERT INTO clientgroups (group_ID, username_rep, start_date)
    VALUES (
		'106',
        'alysilverio',
        '2019-01-01'
        );
        
	INSERT INTO clientgroups (group_ID, username_rep, start_date)
    VALUES (
		'107',
        'victoriazeline',
        '2019-01-01'
        );
	
    INSERT INTO clientgroups (group_ID, username_rep, start_date)
    VALUES (
		'108',
        'victoriazeline',
        '2019-01-01'
        );
        
	INSERT INTO clientgroups (group_ID, username_rep, start_date)
    VALUES (
		'109',
        'mario',
        '2019-01-01'
        );
        
	INSERT INTO clientgroups (group_ID, username_rep, start_date)
    VALUES (
		'110',
        'mario',
        '2019-01-01'
        );
        
	INSERT INTO bookings (booking_id, date, start_time, end_time, group_id, username)
    VALUES (
		'101',
        '2019-01-01',
        '08:00',
        '16:00',
        '101',
        'luigivalera'
		);
        
	INSERT INTO bookings (booking_id, date, start_time, end_time, group_id, username)
    VALUES (
		'102',
        '2019-01-01',
        '08:00',
        '16:00',
        '102',
        'luigivalera'
		);
        
	INSERT INTO bookings (booking_id, date, start_time, end_time, group_id, username)
    VALUES (
		'103',
        '2019-01-01',
        '08:00',
        '16:00',
        '103',
        'jedwigtan'
		);
        
	INSERT INTO bookings (booking_id, date, start_time, end_time, group_id, username)
    VALUES (
		'104',
        '2019-01-01',
        '08:00',
        '16:00',
        '104',
        'jedwigtan'
		);
        
	INSERT INTO bookings (booking_id, date, start_time, end_time, group_id, username)
    VALUES (
		'105',
        '2019-01-01',
        '08:00',
        '16:00',
        '105',
        'alysilverio'
		);
        
	INSERT INTO bookings (booking_id, date, start_time, end_time, group_id, username)
    VALUES (
		'106',
        '2019-01-01',
        '08:00',
        '16:00',
        '106',
        'alysilverio'
		);
        
	INSERT INTO bookings (booking_id, date, start_time, end_time, group_id, username)
    VALUES (
		'107',
        '2019-01-01',
        '08:00',
        '16:00',
        '107',
        'victoriazeline'
		);
        
	INSERT INTO bookings (booking_id, date, start_time, end_time, group_id, username)
    VALUES (
		'108',
        '2019-01-01',
        '08:00',
        '16:00',
        '108',
        'victoriazeline'
		);
        
	INSERT INTO bookings (booking_id, date, start_time, end_time, group_id, username)
    VALUES (
		'109',
        '2019-01-01',
        '08:00',
        '16:00',
        '109',
        'mario'
		);
        
	INSERT INTO bookings (booking_id, date, start_time, end_time, group_id, username)
    VALUES (
		'110',
        '2019-01-01',
        '08:00',
        '16:00',
        '110',
        'mario'
		);
        
	INSERT INTO bookings (booking_id, date, start_time, end_time, group_id, username)
    VALUES (
		'111',
        '2019-01-01',
        '08:00',
        '16:00',
        '101',
        'johndoe'
		);
        
	INSERT INTO bookings (booking_id, date, start_time, end_time, group_id, username)
    VALUES (
		'112',
        '2019-01-01',
        '08:00',
        '16:00',
        '102',
        'janedoe'
		);
        
	INSERT INTO bookings (booking_id, date, start_time, end_time, group_id, username)
    VALUES (
		'113',
        '2019-01-01',
        '08:00',
        '16:00',
        '103',
        'brucewayne'
		);
        
	INSERT INTO bookings (booking_id, date, start_time, end_time, group_id, username)
    VALUES (
		'114',
        '2019-01-01',
        '08:00',
        '16:00',
        '104',
        'martymcfly'
		);
        
	INSERT INTO bookings (booking_id, date, start_time, end_time, group_id, username)
    VALUES (
		'115',
        '2019-01-01',
        '08:00',
        '16:00',
        '105',
        'ikarishinji'
		);
        
	INSERT INTO bookings (booking_id, date, start_time, end_time, group_id, username)
    VALUES (
		'116',
        '2019-01-01',
        '08:00',
        '16:00',
        '106',
        'link'
		);
        
	INSERT INTO bookings (booking_id, date, start_time, end_time, group_id, username)
    VALUES (
		'117',
        '2019-01-01',
        '08:00',
        '16:00',
        '107',
        'sherlockholmes'
		);
        
	INSERT INTO transactions (trans_no, booking_ID, trans_date, trans_type, card_no, amount )
    VALUES (
		'203',
        '101',
        '2019-01-01',
        'C',
        '3222',
        '800'
		);
        
	INSERT INTO transactions (trans_no, booking_ID, trans_date, trans_type, card_no,amount )
    VALUES (
		'204',
        '102',
        '2019-01-01',
        'D',
        '3322',
        '8800'
		);
	
    
	INSERT INTO transactions (trans_no, booking_ID, trans_date, trans_type, card_no,amount )
    VALUES (
		'205',
        '103',
        '2019-01-01',
        'C',
        '3522',
        '800'
		);
	
    
	INSERT INTO transactions (trans_no, booking_ID, trans_date, trans_type, card_no,amount )
    VALUES (
		'206',
        '104',
        '2019-01-01',
        'D',
        '3252',
        '802'
		);
	
    
	INSERT INTO transactions (trans_no, booking_ID, trans_date, trans_type, card_no,amount )
    VALUES (
		'207',
        '105',
        '2019-01-01',
        'C',
        '3222',
        '800'
		);
	
	
	INSERT INTO transactions (trans_no, booking_ID, trans_date, trans_type, card_no,amount )
    VALUES (
		'208',
        '106',
        '2019-01-01',
        'C',
        '3242',
        '800'
		);
        
	INSERT INTO transactions (trans_no, booking_ID, trans_date, trans_type, card_no,amount )
    VALUES (
		'209',
        '107',
        '2019-01-01',
        'C',
        '3222',
        '800'
		);
	INSERT INTO transactions (trans_no, booking_ID, trans_date, trans_type, card_no,amount )
    VALUES (
		'210',
        '108',
        '2019-01-01',
        'C',
        '3222',
        '800'
		);
	INSERT INTO transactions (trans_no, booking_ID, trans_date, trans_type, card_no,amount )
    VALUES (
		'211',
        '109',
        '2019-01-01',
        'C',
        '3222',
        '800'
		);
	INSERT INTO transactions (trans_no, booking_ID, trans_date, trans_type, card_no,amount )
    VALUES (
		'212',
        '110',
        '2019-01-01',
        'C',
        '3222',
        '800'
		);
	