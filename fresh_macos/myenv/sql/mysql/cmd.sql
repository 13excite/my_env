/* db size */

SELECT 
     table_schema as `Database`, 
     table_name AS `Table`, 
     round(((data_length + index_length) / 1024 / 1024), 2) `Size in MB` 
FROM
    information_schema.TABLES 
ORDER BY (data_length + index_length) DESC;

show status where `variable_name` = 'Threads_connected'; -- num of currently open conns