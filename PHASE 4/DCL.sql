use sql_capestone_project ;

-- 1. CREATE USER
create USER 'employee'@'localhost' identified by 'password123';

show grants for 'employee'@'localhost';
-- grant permissions 
grant select,insert on Tribes to 'employee'@'localhost';
-- verifying

show grants for 'employee'@'localhost';

-- 2. CREATE MANAGER

create USER 'employee2'@'localhost' identified by 'password12345';
create role 'manager_role';


grant insert,update,delete,select on sql_capestone_project.* to 'manager_role';
grant 'manager_role' to 'employee2'@'localhost';

show grants for 'employee2'@'localhost';

-- 3. DROP USER
drop user 'employee'@'localhost';
SELECT user, host FROM mysql.user;
