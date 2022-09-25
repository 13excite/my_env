/*show information about all PostgreSQL clusters */
pg_lsclusters;

/* check the conn_number */
SELECT count(pid) FROM pg_stat_activity;

/* Show all running queries */
SELECT
    pid, age(clock_timestamp(), query_start), usename, query 
FROM
    pg_stat_activity 
WHERE
    query != '<IDLE>' AND query NOT ILIKE '%pg_stat_activity%' 
ORDER BY query_start desc;


/* Show queries that runs more than 2 minutes */
SELECT
    now() - query_start as "runtime", usename, datname, state, query
FROM
    pg_stat_activity
WHERE
    now() - query_start > '2 minutes'::interval
ORDER BY runtime DESC;