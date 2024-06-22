/*
Find the number of emails received by each user under each built in email label. 
The email labels are: ‘Promotion’, ‘Social’ and ‘Shopping’. Output the user along with the number of promotion, social & shopping emails they got.
*/
use classwork;
drop table google_gmail_emails;
drop table google_gmail_labels;
create table google_gmail_emails(id int, from_user varchar(100), to_user varchar(100), days int);
create table google_gmail_labels(email_id int, label varchar(50));

INSERT INTO google_gmail_emails (id, from_user, to_user, days) VALUES (1, 'Ayush', 'Meet', 1);
INSERT INTO google_gmail_emails (id, from_user, to_user, days) VALUES (2, 'Khushi', 'Khushi Patel', 2);
INSERT INTO google_gmail_emails (id, from_user, to_user, days) VALUES (3, 'Karmant', 'Ayush', 3);
INSERT INTO google_gmail_emails (id, from_user, to_user, days) VALUES (4, 'Karmant', 'Nikunj', 4);
INSERT INTO google_gmail_emails (id, from_user, to_user, days) VALUES (5, 'Hardik', 'Nikunj', 4);
INSERT INTO google_gmail_emails (id, from_user, to_user, days) VALUES (6, 'Meet', 'Nikunj', 4);

INSERT INTO google_gmail_labels (email_id, label) VALUES (1, 'Promotion');
INSERT INTO google_gmail_labels (email_id, label) VALUES (2, 'Social');
INSERT INTO google_gmail_labels (email_id, label) VALUES (3, 'Shopping');
INSERT INTO google_gmail_labels (email_id, label) VALUES (4, 'Promotion');
INSERT INTO google_gmail_labels (email_id, label) VALUES (5, 'Promotion');
INSERT INTO google_gmail_labels (email_id, label) VALUES (6, 'Social');

select id, from_user, to_user, label
from google_gmail_emails ge 
left join google_gmail_labels gl
on ge.id = gl.email_id;

-- select to_user, label, count(label) over(partition by to_user, label)
select to_user, label, count(label)
from google_gmail_emails ge 
left join google_gmail_labels gl
on ge.id = gl.email_id
group by to_user, label
order by to_user;