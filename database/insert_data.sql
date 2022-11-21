use websitenews;

insert into role(code, name) values ('ADMIN', 'Quản trị');
insert into role(code, name) values ('USER', 'Người dùng');

insert into user(username, password, fullname, status) values ('admin', '$2a$10$/RUbuT9KIqk6f8enaTQiLOXzhnUkiwEJRdtzdrMXXwU7dgnLKTCYG', 'admin', 1);
insert into user(username, password, fullname, status) values ('hai', '$2a$10$/RUbuT9KIqk6f8enaTQiLOXzhnUkiwEJRdtzdrMXXwU7dgnLKTCYG', 'Thanh Hải', 1);
insert into user(username, password, fullname, status) values ('test', '$2a$10$/RUbuT9KIqk6f8enaTQiLOXzhnUkiwEJRdtzdrMXXwU7dgnLKTCYG', 'Test', 1);

INSERT INTO user_role(userid,roleid) VALUES (1,1);
INSERT INTO user_role(userid,roleid) VALUES (2,2);
INSERT INTO user_role(userid,roleid) VALUES (3,2);