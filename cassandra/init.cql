-- bin/cassandra
-- bin/nodetool status
-- bin/cqlsh

SELECT * FROM system.local;

CREATE KEYSPACE my_keyspace WITH replication = {'class': 'SimpleStrategy', 'replication_factor': 1};

USE my_keyspace;

CREATE TABLE apache_logs (
    remote_host text,
    remote_logname text,
    remote_user text,
    request_time timestamp,
    request_line text,
    final_status int,
    bytes_sent int,
    user_agent text,
    device_family text,
    device_brand text,
    device_model text,
    browser_family text,
    browser_version text,
    is_mobile boolean,
    is_tablet boolean,
    is_pc boolean,
    is_bot boolean,
    PRIMARY KEY (remote_host, request_time)
);

COPY apache_logs(remote_host, remote_logname, remote_user, request_time, request_line, final_status, bytes_sent, user_agent, device_family, device_brand, device_model, browser_family, browser_version, is_mobile, is_tablet, is_pc, is_bot) FROM '/mnt/nvme/Projects/DataEngineer/apache_logs_analysis/data/result.csv' WITH DELIMITER=',' AND HEADER=TRUE;