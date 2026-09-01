CREATE DATABASE IF NOT EXISTS learncfinaweek;

USE learncfinaweek;

-- administrator --
CREATE TABLE administrator  ( 
	id          	int(11) AUTO_INCREMENT NOT NULL,
	firstname   	varchar(100) NOT NULL,
	lastname    	varchar(100) NOT NULL,
	emailaddress	varchar(100) NOT NULL,
	password    	varchar(200) NOT NULL,
	salt        	varchar(200) NULL,
	PRIMARY KEY  (`id`) 
	);
INSERT INTO administrator(id, firstname, lastname, emailaddress, password, salt)
  VALUES(1, 'Your', 'Name', 'admin@mywebsite.com', 'admin', '');

-- category --
CREATE TABLE category  ( 
	id  	int(11) AUTO_INCREMENT NOT NULL,
	name	varchar(100) NOT NULL,
	PRIMARY KEY  (`id`) 
	);
INSERT INTO category(id, name)
  VALUES(1, 'ColdFusion');
INSERT INTO category(id, name)
  VALUES(2, 'Development');
INSERT INTO category(id, name)
  VALUES(3, 'HTML5');
INSERT INTO category(id, name)
  VALUES(4, 'CSS3');
INSERT INTO category(id, name)
  VALUES(5, 'JQuery');

-- portfolio --
CREATE TABLE portfolio  ( 
	id     	int(11) AUTO_INCREMENT NOT NULL,
	title  	varchar(100) NOT NULL,
	summary	text NULL,
	website	varchar(100) NULL,
	image  	varchar(45) NULL,
	PRIMARY KEY  (`id`) 
	);
INSERT INTO portfolio(id, title, summary, website, image)
  VALUES(1, 'Project Title 1', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam nisi erat, ornare vehicula convallis at, viverra quis sapien. Ut gravida risus in eros semper quis eleifend erat aliquet. Duis tincidunt urna sed quam tempus imperdiet. Aenean in cursus odio. Fusce ornare, elit vel malesuada commodo.', 'http://www.project1.com', 'portfolio1.png');
INSERT INTO portfolio(id, title, summary, website, image)
  VALUES(2, 'Project Title 2', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam nisi erat, ornare vehicula convallis at, viverra quis sapien. Ut gravida risus in eros semper quis eleifend erat aliquet. Duis tincidunt urna sed quam tempus imperdiet. Aenean in cursus odio. Fusce ornare, elit vel malesuada commodo.', 'http://www.project2.com', 'portfolio2.png');
INSERT INTO portfolio(id, title, summary, website, image)
  VALUES(3, 'Project Title 3', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam nisi erat, ornare vehicula convallis at, viverra quis sapien. Ut gravida risus in eros semper quis eleifend erat aliquet. Duis tincidunt urna sed quam tempus imperdiet. Aenean in cursus odio. Fusce ornare, elit vel malesuada commodo.', 'http://www.project3.com', 'portfolio3.png');
INSERT INTO portfolio(id, title, summary, website, image)
  VALUES(4, 'Project Title 4', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam nisi erat, ornare vehicula convallis at, viverra quis sapien. Ut gravida risus in eros semper quis eleifend erat aliquet. Duis tincidunt urna sed quam tempus imperdiet. Aenean in cursus odio. Fusce ornare, elit vel malesuada commodo.', 'http://www.project4.com', 'portfolio4.png');

-- post --
CREATE TABLE post  ( 
	id              	int(11) AUTO_INCREMENT NOT NULL,
	title           	varchar(200) NOT NULL,
	summary         	text NULL,
	body            	text NULL,
	dateposted      	date NULL,
	createddatetime 	datetime NULL,
	modifieddatetime	datetime NULL,
	deleted         	varchar(100) NULL,
	PRIMARY KEY  (`id`) 
	);
INSERT INTO post(id, title, summary, body, dateposted, createddatetime, modifieddatetime, deleted)
  VALUES(1, 'WebSocket example with keyword highlighting', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce pulvinar erat eu metus egestas ut aliquet ante adipiscing. Maecenas eget laoreet dolor. Pellentesque sagittis nisl ac nulla semper facilisis pulvinar elit scelerisque. Nulla mollis fermentum eros a pulvinar. Mauris faucibus fringilla dolor, ut consectetur orci euismod eget. Phasellus ut dui ut tellus aliquam feugiat id at elit. Nulla facilisi. Suspendisse.', '<p>
								Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris id dignissim nunc. Mauris a massa sit amet dui sagittis ullamcorper sed at purus. Cras enim massa, laoreet vitae egestas ac, viverra eget lacus. Nam ac turpis id libero fringilla tempus. Sed sem dolor, vestibulum vitae iaculis id, dapibus quis dui. Praesent vel felis nisl, eget accumsan mauris. Vivamus neque eros, accumsan elementum dapibus sit amet, placerat a felis. Aliquam eget eros magna. Morbi quis iaculis tortor. Fusce vitae elit vel nunc suscipit pellentesque. In hac habitasse platea dictumst. Mauris pharetra lacinia mauris eu auctor. Morbi vitae est euismod elit pretium fringilla a vitae sem. Nam lectus ante, rhoncus vitae malesuada quis, pellentesque vitae nibh. Etiam congue metus sed libero cursus vitae rhoncus felis pellentesque. Maecenas tincidunt commodo est, eget imperdiet nibh commodo vel.
							</p>
							<p>
								Sed augue arcu, bibendum sit amet viverra et, facilisis sed ipsum. Nullam orci quam, tincidunt a imperdiet at, lacinia vel risus. Aliquam quis scelerisque purus. Curabitur dui ligula, lobortis vitae viverra sit amet, eleifend id metus. Vivamus varius mi non quam interdum eu tincidunt arcu ullamcorper. In magna nisl, semper vitae ornare ac, bibendum vel lectus. Vivamus pulvinar urna vel libero scelerisque nec malesuada augue auctor. Morbi faucibus justo a odio sollicitudin scelerisque eu et diam. Nulla vel nisi quis augue egestas sollicitudin. Duis auctor libero eu massa volutpat dignissim. Phasellus commodo, arcu ac congue pretium, libero enim lobortis orci, id tempus libero nulla interdum lorem. Proin varius ipsum sit amet urna fermentum in laoreet leo faucibus. Mauris cursus, tellus eget auctor euismod, nunc dui rutrum urna, at auctor nunc mauris vel nisi. Etiam suscipit elit id nulla blandit ut faucibus felis interdum.
							</p>
							<p>	
								Integer auctor urna non nibh euismod elementum. Nullam velit nisi, bibendum in pulvinar sed, aliquet tempus tortor. Phasellus eleifend metus mauris. Phasellus at mi et ligula tincidunt malesuada eget ac est. Ut elementum, massa ac pulvinar tempor, est nisl lacinia nisl, sed ornare diam nibh vitae ipsum. Donec molestie consectetur nisi eget pretium. Quisque tincidunt eleifend vulputate. Vivamus eu ante vitae eros eleifend suscipit. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nunc suscipit dolor egestas erat ornare sollicitudin. Nulla facilisi.
							</p>
							<p>
								Quisque id mi sapien, in tincidunt est. Proin metus metus, dignissim ultricies commodo at, scelerisque vel lectus. Vivamus nec auctor sapien. Nulla lobortis, neque vel pretium aliquet, diam metus congue dolor, eu aliquam ante ligula eget velit. Mauris vulputate, massa at ultricies tincidunt, est urna vehicula erat, eget consequat metus erat ut nisi. Vivamus dapibus mauris nec massa eleifend vitae adipiscing arcu cursus. Duis ac libero ante. Integer nec augue dolor. Suspendisse ligula urna, imperdiet et congue vitae, aliquet non nulla. Nunc dignissim justo vel leo sodales varius. Quisque malesuada ornare nisl, et eleifend lectus molestie ut. Vestibulum a risus eu felis elementum bibendum. Curabitur ac justo eu risus laoreet sagittis.
							</p>
							<p>
								Suspendisse ac felis lacus. Nulla facilisi. Curabitur porttitor sapien vel est sollicitudin commodo. Donec consectetur, orci in venenatis malesuada, purus orci gravida leo, ac sollicitudin nulla arcu eu nisi. Ut rutrum, nisl at condimentum varius, risus turpis aliquet risus, quis venenatis tellus velit eu orci. Maecenas aliquam nunc et purus tincidunt dictum. Donec tempus sodales turpis ac consectetur. Sed nibh turpis, ornare egestas rhoncus sed, rhoncus vel arcu. Cras sit amet accumsan justo. Mauris in nisl non lacus pellentesque scelerisque ut sed neque. Nulla et sollicitudin enim. Nam at nisi ante, ac sagittis purus.
							</p>', '2012-09-18', '2012-09-17 13:37:40.0', '2012-09-17 13:37:40.0', '0');
INSERT INTO post(id, title, summary, body, dateposted, createddatetime, modifieddatetime, deleted)
  VALUES(2, 'ColdFusion scheduled tasks', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce pulvinar erat eu metus egestas ut aliquet ante adipiscing. Maecenas eget laoreet dolor. Pellentesque sagittis nisl ac nulla semper facilisis pulvinar elit scelerisque. Nulla mollis fermentum eros a pulvinar. Mauris faucibus fringilla dolor, ut consectetur orci euismod eget. Phasellus ut dui ut tellus aliquam feugiat id at elit. Nulla facilisi. Suspendisse.', '<p>
								Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris id dignissim nunc. Mauris a massa sit amet dui sagittis ullamcorper sed at purus. Cras enim massa, laoreet vitae egestas ac, viverra eget lacus. Nam ac turpis id libero fringilla tempus. Sed sem dolor, vestibulum vitae iaculis id, dapibus quis dui. Praesent vel felis nisl, eget accumsan mauris. Vivamus neque eros, accumsan elementum dapibus sit amet, placerat a felis. Aliquam eget eros magna. Morbi quis iaculis tortor. Fusce vitae elit vel nunc suscipit pellentesque. In hac habitasse platea dictumst. Mauris pharetra lacinia mauris eu auctor. Morbi vitae est euismod elit pretium fringilla a vitae sem. Nam lectus ante, rhoncus vitae malesuada quis, pellentesque vitae nibh. Etiam congue metus sed libero cursus vitae rhoncus felis pellentesque. Maecenas tincidunt commodo est, eget imperdiet nibh commodo vel.
							</p>
							<p>
								Sed augue arcu, bibendum sit amet viverra et, facilisis sed ipsum. Nullam orci quam, tincidunt a imperdiet at, lacinia vel risus. Aliquam quis scelerisque purus. Curabitur dui ligula, lobortis vitae viverra sit amet, eleifend id metus. Vivamus varius mi non quam interdum eu tincidunt arcu ullamcorper. In magna nisl, semper vitae ornare ac, bibendum vel lectus. Vivamus pulvinar urna vel libero scelerisque nec malesuada augue auctor. Morbi faucibus justo a odio sollicitudin scelerisque eu et diam. Nulla vel nisi quis augue egestas sollicitudin. Duis auctor libero eu massa volutpat dignissim. Phasellus commodo, arcu ac congue pretium, libero enim lobortis orci, id tempus libero nulla interdum lorem. Proin varius ipsum sit amet urna fermentum in laoreet leo faucibus. Mauris cursus, tellus eget auctor euismod, nunc dui rutrum urna, at auctor nunc mauris vel nisi. Etiam suscipit elit id nulla blandit ut faucibus felis interdum.
							</p>
							<p>	
								Integer auctor urna non nibh euismod elementum. Nullam velit nisi, bibendum in pulvinar sed, aliquet tempus tortor. Phasellus eleifend metus mauris. Phasellus at mi et ligula tincidunt malesuada eget ac est. Ut elementum, massa ac pulvinar tempor, est nisl lacinia nisl, sed ornare diam nibh vitae ipsum. Donec molestie consectetur nisi eget pretium. Quisque tincidunt eleifend vulputate. Vivamus eu ante vitae eros eleifend suscipit. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nunc suscipit dolor egestas erat ornare sollicitudin. Nulla facilisi.
							</p>
							<p>
								Quisque id mi sapien, in tincidunt est. Proin metus metus, dignissim ultricies commodo at, scelerisque vel lectus. Vivamus nec auctor sapien. Nulla lobortis, neque vel pretium aliquet, diam metus congue dolor, eu aliquam ante ligula eget velit. Mauris vulputate, massa at ultricies tincidunt, est urna vehicula erat, eget consequat metus erat ut nisi. Vivamus dapibus mauris nec massa eleifend vitae adipiscing arcu cursus. Duis ac libero ante. Integer nec augue dolor. Suspendisse ligula urna, imperdiet et congue vitae, aliquet non nulla. Nunc dignissim justo vel leo sodales varius. Quisque malesuada ornare nisl, et eleifend lectus molestie ut. Vestibulum a risus eu felis elementum bibendum. Curabitur ac justo eu risus laoreet sagittis.
							</p>
							<p>
								Suspendisse ac felis lacus. Nulla facilisi. Curabitur porttitor sapien vel est sollicitudin commodo. Donec consectetur, orci in venenatis malesuada, purus orci gravida leo, ac sollicitudin nulla arcu eu nisi. Ut rutrum, nisl at condimentum varius, risus turpis aliquet risus, quis venenatis tellus velit eu orci. Maecenas aliquam nunc et purus tincidunt dictum. Donec tempus sodales turpis ac consectetur. Sed nibh turpis, ornare egestas rhoncus sed, rhoncus vel arcu. Cras sit amet accumsan justo. Mauris in nisl non lacus pellentesque scelerisque ut sed neque. Nulla et sollicitudin enim. Nam at nisi ante, ac sagittis purus.
							</p>', '2012-09-01', '2012-09-01 10:37:40.0', '2012-09-01 13:40:50.0', '0');
INSERT INTO post(id, title, summary, body, dateposted, createddatetime, modifieddatetime, deleted)
  VALUES(3, 'ColdFusion Developer Week Recordings', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce pulvinar erat eu metus egestas ut aliquet ante adipiscing. Maecenas eget laoreet dolor. Pellentesque sagittis nisl ac nulla semper facilisis pulvinar elit scelerisque. Nulla mollis fermentum eros a pulvinar. Mauris faucibus fringilla dolor, ut consectetur orci euismod eget. Phasellus ut dui ut tellus aliquam feugiat id at elit. Nulla facilisi. Suspendisse.', '<p>
								Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris id dignissim nunc. Mauris a massa sit amet dui sagittis ullamcorper sed at purus. Cras enim massa, laoreet vitae egestas ac, viverra eget lacus. Nam ac turpis id libero fringilla tempus. Sed sem dolor, vestibulum vitae iaculis id, dapibus quis dui. Praesent vel felis nisl, eget accumsan mauris. Vivamus neque eros, accumsan elementum dapibus sit amet, placerat a felis. Aliquam eget eros magna. Morbi quis iaculis tortor. Fusce vitae elit vel nunc suscipit pellentesque. In hac habitasse platea dictumst. Mauris pharetra lacinia mauris eu auctor. Morbi vitae est euismod elit pretium fringilla a vitae sem. Nam lectus ante, rhoncus vitae malesuada quis, pellentesque vitae nibh. Etiam congue metus sed libero cursus vitae rhoncus felis pellentesque. Maecenas tincidunt commodo est, eget imperdiet nibh commodo vel.
							</p>
							<p>
								Sed augue arcu, bibendum sit amet viverra et, facilisis sed ipsum. Nullam orci quam, tincidunt a imperdiet at, lacinia vel risus. Aliquam quis scelerisque purus. Curabitur dui ligula, lobortis vitae viverra sit amet, eleifend id metus. Vivamus varius mi non quam interdum eu tincidunt arcu ullamcorper. In magna nisl, semper vitae ornare ac, bibendum vel lectus. Vivamus pulvinar urna vel libero scelerisque nec malesuada augue auctor. Morbi faucibus justo a odio sollicitudin scelerisque eu et diam. Nulla vel nisi quis augue egestas sollicitudin. Duis auctor libero eu massa volutpat dignissim. Phasellus commodo, arcu ac congue pretium, libero enim lobortis orci, id tempus libero nulla interdum lorem. Proin varius ipsum sit amet urna fermentum in laoreet leo faucibus. Mauris cursus, tellus eget auctor euismod, nunc dui rutrum urna, at auctor nunc mauris vel nisi. Etiam suscipit elit id nulla blandit ut faucibus felis interdum.
							</p>
							<p>	
								Integer auctor urna non nibh euismod elementum. Nullam velit nisi, bibendum in pulvinar sed, aliquet tempus tortor. Phasellus eleifend metus mauris. Phasellus at mi et ligula tincidunt malesuada eget ac est. Ut elementum, massa ac pulvinar tempor, est nisl lacinia nisl, sed ornare diam nibh vitae ipsum. Donec molestie consectetur nisi eget pretium. Quisque tincidunt eleifend vulputate. Vivamus eu ante vitae eros eleifend suscipit. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nunc suscipit dolor egestas erat ornare sollicitudin. Nulla facilisi.
							</p>
							<p>
								Quisque id mi sapien, in tincidunt est. Proin metus metus, dignissim ultricies commodo at, scelerisque vel lectus. Vivamus nec auctor sapien. Nulla lobortis, neque vel pretium aliquet, diam metus congue dolor, eu aliquam ante ligula eget velit. Mauris vulputate, massa at ultricies tincidunt, est urna vehicula erat, eget consequat metus erat ut nisi. Vivamus dapibus mauris nec massa eleifend vitae adipiscing arcu cursus. Duis ac libero ante. Integer nec augue dolor. Suspendisse ligula urna, imperdiet et congue vitae, aliquet non nulla. Nunc dignissim justo vel leo sodales varius. Quisque malesuada ornare nisl, et eleifend lectus molestie ut. Vestibulum a risus eu felis elementum bibendum. Curabitur ac justo eu risus laoreet sagittis.
							</p>
							<p>
								Suspendisse ac felis lacus. Nulla facilisi. Curabitur porttitor sapien vel est sollicitudin commodo. Donec consectetur, orci in venenatis malesuada, purus orci gravida leo, ac sollicitudin nulla arcu eu nisi. Ut rutrum, nisl at condimentum varius, risus turpis aliquet risus, quis venenatis tellus velit eu orci. Maecenas aliquam nunc et purus tincidunt dictum. Donec tempus sodales turpis ac consectetur. Sed nibh turpis, ornare egestas rhoncus sed, rhoncus vel arcu. Cras sit amet accumsan justo. Mauris in nisl non lacus pellentesque scelerisque ut sed neque. Nulla et sollicitudin enim. Nam at nisi ante, ac sagittis purus.
							</p>', '2012-08-23', '2012-08-03 08:02:00.0', '2012-08-19 22:54:12.0', '0');

-- postcategoryjn --
CREATE TABLE postcategoryjn  ( 
	postid    	int(11) NOT NULL,
	categoryid	int(11) NOT NULL
	);
INSERT INTO postcategoryjn(postid, categoryid)
  VALUES(1, 1);
INSERT INTO postcategoryjn(postid, categoryid)
  VALUES(1, 2);
INSERT INTO postcategoryjn(postid, categoryid)
  VALUES(2, 2);
INSERT INTO postcategoryjn(postid, categoryid)
  VALUES(3, 1);
INSERT INTO postcategoryjn(postid, categoryid)
  VALUES(3, 3);

-- resume --
CREATE TABLE resume  ( 
	id       	int(11) AUTO_INCREMENT NOT NULL,
	title    	varchar(100) NULL,
	startDate	date NOT NULL,
	endDate  	date NULL,
	details  	text NOT NULL,
	type     	varchar(45) NOT NULL,
	PRIMARY KEY  (`id`) 
	);
INSERT INTO resume(id, title, startDate, endDate, details, type)
  VALUES(1, 'Junior Developer - Funkey Monkey Solutions', '2004-07-18', '2006-09-12', 'Lorem ipsum dolor sit amet, habitasse pretium dolor sociis. Nulla et facilisis interdum elit amet erat, consectetuer condimentum eaque, ante maecenas Suspendisse libero diam.', 'Work Experience');
INSERT INTO resume(id, title, startDate, endDate, details, type)
  VALUES(2, 'Senior Developer - Hooligan Development', '2006-10-18', NULL, 'Lorem ipsum dolor sit amet, habitasse pretium dolor sociis. Nulla et facilisis interdum elit amet erat, consectetuer condimentum eaque, ante maecenas.', 'Work Experience');
INSERT INTO resume(id, title, startDate, endDate, details, type)
  VALUES(3, 'NC State - Computer Science', '2000-09-07', '2004-04-05', 'Lorem ipsum dolor sit amet, adipiscing elit. egestas.Vivamus sit amet ligula non lectus cursus egestas amet ligula non lectus cursus egestas.', 'Education');

-- skillset --
CREATE TABLE skillset  ( 
	id  	int(11) AUTO_INCREMENT NOT NULL,
	name	varchar(45) NOT NULL,
	PRIMARY KEY  (`id`) 
	);
INSERT INTO skillset(id, name)
  VALUES(1, 'ColdFusion');
INSERT INTO skillset(id, name)
  VALUES(2, 'HTML5');
INSERT INTO skillset(id, name)
  VALUES(3, 'CSS3');
INSERT INTO skillset(id, name)
  VALUES(4, 'MySQL');
INSERT INTO skillset(id, name)
  VALUES(5, 'JQuery');

