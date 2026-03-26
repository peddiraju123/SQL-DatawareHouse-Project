
/*
===============================================================================
Script: Database Initialization
Project: Data Warehouse Analytics
===============================================================================

Description:
This script creates the main database used for the Data Warehouse project.
If the database already exists, it will be dropped and recreated to ensure
a clean environment for development and testing.

WARNING:
Running this script will permanently delete the existing database and all
data stored in it. Use with caution.
===============================================================================
*/


-- ---------------------------------------------------------------------------
-- Drop database if it already exists
-- ---------------------------------------------------------------------------
DROP DATABASE IF EXISTS DataWarehouse;


-- ---------------------------------------------------------------------------
-- Create Data Warehouse database
-- ---------------------------------------------------------------------------
CREATE DATABASE DataWarehouse;


-- ---------------------------------------------------------------------------
-- Switch to the newly created database
-- ---------------------------------------------------------------------------
USE DataWarehouse;