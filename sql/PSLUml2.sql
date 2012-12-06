-- Creator:       MySQL Workbench 5.2.38/ExportSQLite plugin 2009.12.02
-- Author:        Chad La Guardia
-- Caption:       New Model
-- Project:       Name of the project
-- Changed:       2012-03-02 22:46
-- Created:       2012-03-02 20:47
PRAGMA foreign_keys = OFF;

-- Schema: mydb
BEGIN;
CREATE TABLE "tServer"(
  "ID" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL CHECK("ID">=0),
  "Name" VARCHAR(45) NOT NULL,
  "IPAddress" VARCHAR(45) NOT NULL,
  "Model" VARCHAR(45),
  CONSTRAINT "ID_UNIQUE"
    UNIQUE("ID")
);
CREATE TABLE "tType"(
  "ID" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL CHECK("ID">=0),
  "Name" VARCHAR(45) NOT NULL,
  CONSTRAINT "ID_UNIQUE"
    UNIQUE("ID")
);
CREATE TABLE "tLocation"(
  "ID" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL CHECK("ID">=0),
  "Address" VARCHAR(45),
  "City" VARCHAR(45),
  "State" VARCHAR(45),
  "ZIPCode" VARCHAR(45),
  "Country" VARCHAR(45),
  CONSTRAINT "ID_UNIQUE"
    UNIQUE("ID")
);
CREATE TABLE "tDatacenter"(
  "ID" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL CHECK("ID">=0),
  "Name" VARCHAR(45) NOT NULL,
  "LocationID" INTEGER NOT NULL CHECK("LocationID">=0),
  CONSTRAINT "ID_UNIQUE"
    UNIQUE("ID"),
  CONSTRAINT "LocationID"
    FOREIGN KEY()
    REFERENCES "tLocation"()
);
CREATE INDEX "tDatacenter.LocationID" ON "tDatacenter"();
CREATE TABLE "tDataLog"(
  "ServerID" INTEGER PRIMARY KEY NOT NULL CHECK("ServerID">=0),
  "Key" VARCHAR(45) NOT NULL,
  "Value" VARCHAR(45) NOT NULL,
  "Timestamp" DATETIME NOT NULL,
  CONSTRAINT "ServerID"
    FOREIGN KEY()
    REFERENCES "tServer"()
);
CREATE INDEX "tDataLog.ServerID" ON "tDataLog"();
CREATE TABLE "tCluster"(
  "ID" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL CHECK("ID">=0),
  "Name" VARCHAR(45) NOT NULL,
  "TypeID" INTEGER NOT NULL CHECK("TypeID">=0),
  CONSTRAINT "ID_UNIQUE"
    UNIQUE("ID"),
  CONSTRAINT "TypeID"
    FOREIGN KEY()
    REFERENCES "tType"()
);
CREATE INDEX "tCluster.TypeID" ON "tCluster"();
CREATE TABLE "tClusterServer"(
  "ClusterID" INTEGER NOT NULL CHECK("ClusterID">=0),
  "ServerID" INTEGER NOT NULL CHECK("ServerID">=0),
  PRIMARY KEY("ClusterID","ServerID"),
  CONSTRAINT "ClusterID"
    FOREIGN KEY()
    REFERENCES "tCluster"(),
  CONSTRAINT "ServerID"
    FOREIGN KEY()
    REFERENCES "tServer"()
);
CREATE INDEX "tClusterServer.ClusterID" ON "tClusterServer"();
CREATE INDEX "tClusterServer.ServerID" ON "tClusterServer"();
CREATE TABLE "tDatacenterCluster"(
  "DatacenterID" INTEGER NOT NULL CHECK("DatacenterID">=0),
  "ClusterID" INTEGER NOT NULL CHECK("ClusterID">=0),
  PRIMARY KEY("DatacenterID","ClusterID"),
  CONSTRAINT "DatacenterID"
    FOREIGN KEY()
    REFERENCES "tDatacenter"(),
  CONSTRAINT "ClusterID"
    FOREIGN KEY()
    REFERENCES "tCluster"()
);
CREATE INDEX "tDatacenterCluster.DatacenterID" ON "tDatacenterCluster"();
CREATE INDEX "tDatacenterCluster.ClusterID" ON "tDatacenterCluster"();
COMMIT;
