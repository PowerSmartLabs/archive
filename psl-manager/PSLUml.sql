-- Creator:       MySQL Workbench 5.2.38/ExportSQLite plugin 2009.12.02
-- Author:        Chad La Guardia
-- Caption:       New Model
-- Project:       Name of the project
-- Changed:       2012-03-02 22:46
-- Created:       2012-03-02 20:47
PRAGMA foreign_keys = ON;

-- Schema: mydb
BEGIN;

CREATE TABLE servers(
  id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL CHECK(id>=0),
  name VARCHAR(45) NOT NULL,
  ipaddress VARCHAR(45) NOT NULL,
  model VARCHAR(45)
);
CREATE UNIQUE INDEX server_id ON servers(id);

CREATE TABLE types(
  id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL CHECK(id>=0),
  name VARCHAR(45) NOT NULL
);
CREATE UNIQUE INDEX type_id on types(id);

CREATE TABLE locations(
  id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL CHECK(id>=0),	
  address VARCHAR(45),
  city VARCHAR(45),
  state VARCHAR(45),
  zipcode VARCHAR(45),
  country VARCHAR(45)
);
CREATE UNIQUE INDEX location_id on locations(id);

CREATE TABLE datacenters(
  id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL CHECK(id>=0),
  name VARCHAR(45) NOT NULL,
  location_id INTEGER NOT NULL CHECK(location_id>=0),
  FOREIGN KEY(location_id) REFERENCES locations(id)
);
CREATE UNIQUE INDEX datacenter_id ON datacenters(id);

CREATE TABLE datalogs(
  server_id INTEGER PRIMARY KEY NOT NULL CHECK(server_id>=0),
  Key VARCHAR(45) NOT NULL,
  Value VARCHAR(45) NOT NULL,
  Timestamp DATETIME NOT NULL,
  FOREIGN KEY(server_id) REFERENCES servers(id)
);
CREATE UNIQUE INDEX datalog_id ON servers(id);

CREATE TABLE clusters(
  id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL CHECK(id>=0),
  name VARCHAR(45) NOT NULL,
  type_id INTEGER NOT NULL CHECK(type_id>=0),
  FOREIGN KEY(type_id) REFERENCES types(id)
);
CREATE UNIQUE INDEX cluster_id ON clusters(id);

CREATE TABLE clusterservers(
  cluster_id INTEGER NOT NULL CHECK(cluster_id>=0),
  server_id INTEGER NOT NULL CHECK(server_id>=0),
  PRIMARY KEY(cluster_id,server_id),
  FOREIGN KEY(cluster_id) REFERENCES cluster(id),
  FOREIGN KEY(server_id) REFERENCES server(id)
);
CREATE UNIQUE INDEX "clusterserver_id" ON "clusterservers"(cluster_id, server_id);

CREATE TABLE datacenterclusters(
  datacenter_id INTEGER NOT NULL CHECK(datacenter_id>=0),
  cluster_id INTEGER NOT NULL CHECK(cluster_id>=0),
  PRIMARY KEY(datacenter_id,cluster_id),
  FOREIGN KEY(datacenter_id) REFERENCES datacenters(id),
  FOREIGN KEY(cluster_id) REFERENCES clusters(id)
);
CREATE UNIQUE INDEX datacentercluster_id ON datacenterclusters(datacenter_id, cluster_id);
COMMIT;
