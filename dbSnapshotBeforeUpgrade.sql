CREATE DATABASE t1_snapshot ON
( NAME = t1, FILENAME = 'E:\Temp\DB-Snapshot\t1\snapshot.bak')
AS SNAPSHOT of t1

-- RESTORE DATABASE t1 from DATABASE_SNAPSHOT = 't1_snapshot'

-- DROP DATABASE t1_snapshot
