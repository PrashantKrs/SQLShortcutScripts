
--Turn OFF the constraints for loading data into tables with constraints
EXEC sp_msforeachtable 'ALTER TABLE ? NOCHECK CONSTRAINT all'

--Turn ON the constraints for loading data into tables with constraints
EXEC sp_msforeachtable 'ALTER TABLE ? NOCHECK CONSTRAINT all'