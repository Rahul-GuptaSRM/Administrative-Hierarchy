CREATE DATABASE administrativehierarchydata;


CREATE TABLE fieldname( ID INT PRIMARY KEY NOT NULL, NAME TEXT    NOT NULL);

INSERT INTO fieldname (ID,NAME) VALUES (1, 'State');
INSERT INTO fieldname (ID,NAME) VALUES (2, 'District');
INSERT INTO fieldname (ID,NAME) VALUES (3, 'Tehsil');
INSERT INTO fieldname (ID,NAME) VALUES (4, 'Mandal');
INSERT INTO fieldname (ID,NAME) VALUES (5, 'Village');
INSERT INTO fieldname (ID,NAME) VALUES (6, 'Khasra');
INSERT INTO fieldname (ID,NAME) VALUES (7, 'Khewat');
INSERT INTO fieldname (ID,NAME) VALUES (8, 'Survey No');
INSERT INTO fieldname (ID,NAME) VALUES (9, 'Khata No');
INSERT INTO fieldname (ID,NAME) VALUES (10, 'Murrabba');


CREATE TABLE Firsthierarchy( ID INT PRIMARY KEY NOT NULL, NAME TEXT    NOT NULL, fieldid INT references fieldname(ID));

INSERT INTO Firsthierarchy (ID,NAME, fieldid) VALUES (1, 'Haryana', 1);

INSERT INTO Firsthierarchy (ID,NAME, fieldid) VALUES (2, 'Maharashtra', 1);


CREATE TABLE  Secondhierarchy( ID INT PRIMARY KEY NOT NULL, NAME TEXT  NOT NULL, fieldid INT references fieldname(ID), PrevioushierarchyID INT references Firsthierarchy(ID));

INSERT INTO Secondhierarchy (ID,NAME, fieldid, PrevioushierarchyID) VALUES (1, 'BHIWANI', 2, 1);

INSERT INTO Secondhierarchy (ID,NAME, fieldid, PrevioushierarchyID) VALUES (2, 'REWARI', 2, 1);

INSERT INTO Secondhierarchy (ID,NAME, fieldid, PrevioushierarchyID) VALUES (3, 'Mumbai', 2, 2);

INSERT INTO Secondhierarchy (ID,NAME, fieldid, PrevioushierarchyID) VALUES (4, 'Pune', 2, 2);


CREATE TABLE  Thirdhierarchy( ID INT PRIMARY KEY NOT NULL, NAME TEXT  NOT NULL, fieldid INT references fieldname(ID), PrevioushierarchyID INT references Secondhierarchy(ID));


INSERT INTO Thirdhierarchy (ID,NAME, fieldid, PrevioushierarchyID) VALUES (1, 'LOHARU', 3, 1);

INSERT INTO Thirdhierarchy (ID,NAME, fieldid, PrevioushierarchyID) VALUES (2, 'Bawal', 3, 2);

INSERT INTO Thirdhierarchy (ID,NAME, fieldid, PrevioushierarchyID) VALUES (3, 'Mumbai_Mandal', 4, 3);

INSERT INTO Thirdhierarchy (ID,NAME, fieldid, PrevioushierarchyID) VALUES (4, 'Mumbai_Mandal2', 4, 3);

INSERT INTO Thirdhierarchy (ID,NAME, fieldid, PrevioushierarchyID) VALUES (5, 'Pune_Mandal1', 4, 4);

INSERT INTO Thirdhierarchy (ID,NAME, fieldid, PrevioushierarchyID) VALUES (6, 'Pune_Mandal12', 4, 4);




CREATE TABLE  Fourthhierarchy( ID INT PRIMARY KEY NOT NULL, NAME TEXT  NOT NULL, fieldid INT references fieldname(ID), PrevioushierarchyID INT references Thirdhierarchy(ID));


INSERT INTO Fourthhierarchy (ID,NAME, fieldid, PrevioushierarchyID) VALUES (1, 'LOHARU_village', 5, 1);

INSERT INTO Fourthhierarchy (ID,NAME, fieldid, PrevioushierarchyID) VALUES (2, 'Bawal_village', 5, 2);

INSERT INTO Fourthhierarchy (ID,NAME, fieldid, PrevioushierarchyID) VALUES (3, 'Mumbai_Mandal_village1', 5, 3);

INSERT INTO Fourthhierarchy (ID,NAME, fieldid, PrevioushierarchyID) VALUES (4, 'Mumbai_Mandal_village2', 5, 3);

INSERT INTO Fourthhierarchy (ID,NAME, fieldid, PrevioushierarchyID) VALUES (5, 'Mumbai_Mandal2_village1', 6, 4);

INSERT INTO Fourthhierarchy (ID,NAME, fieldid, PrevioushierarchyID) VALUES (6, 'Mumbai_Mandal2_village2', 6, 4);


CREATE TABLE  Fifthhierarchy( ID INT PRIMARY KEY NOT NULL, NAME TEXT  NOT NULL, fieldid INT references fieldname(ID), PrevioushierarchyID INT references Fourthhierarchy(ID));


INSERT INTO Fifthhierarchy (ID,NAME, fieldid, PrevioushierarchyID) VALUES (1, 'LOHARU_village_khewat', 7, 1);

INSERT INTO Fifthhierarchy (ID,NAME, fieldid, PrevioushierarchyID) VALUES (2, 'Bawal_village_khewat', 7, 2);

INSERT INTO Fifthhierarchy (ID,NAME, fieldid, PrevioushierarchyID) VALUES (3, 'Mumbai_Mandal_village_Survey No', 8, 3);

INSERT INTO Fifthhierarchy (ID,NAME, fieldid, PrevioushierarchyID) VALUES (4, 'Mumbai_Mandal_village_Survey No1', 8, 3);

INSERT INTO Fifthhierarchy (ID,NAME, fieldid, PrevioushierarchyID) VALUES (5, 'Mumbai_Mandal2_village_Survey No', 8, 5);

INSERT INTO Fifthhierarchy (ID,NAME, fieldid, PrevioushierarchyID) VALUES (6, 'Mumbai_Mandal2_village_Survey No2', 8, 5);




CREATE TABLE  Sixthhierarchy( ID INT PRIMARY KEY NOT NULL, NAME TEXT  NOT NULL, fieldid INT references fieldname(ID), PrevioushierarchyID INT references Fifthhierarchy(ID));


INSERT INTO Sixthhierarchy (ID,NAME, fieldid, PrevioushierarchyID) VALUES (1, 'LOHARU_village_khewat_Murrabba', 10, 1);

INSERT INTO Sixthhierarchy (ID,NAME, fieldid, PrevioushierarchyID) VALUES (2, 'Bawal_village_khewat_Murrabba', 10, 2);

INSERT INTO Sixthhierarchy (ID,NAME, fieldid, PrevioushierarchyID) VALUES (3, 'Mumbai_Mandal_village_Survey No_Murrabba', 10, 3);

INSERT INTO Sixthhierarchy (ID,NAME, fieldid, PrevioushierarchyID) VALUES (4, 'Mumbai_Mandal_village_Survey No1_Murrabba', 10, 4);

INSERT INTO Sixthhierarchy (ID,NAME, fieldid, PrevioushierarchyID) VALUES (5, 'Mumbai_Mandal2_village_Survey No_Murrabba', 10, 5);

INSERT INTO Sixthhierarchy (ID,NAME, fieldid, PrevioushierarchyID) VALUES (6, 'Mumbai_Mandal2_village_Survey No2_Murrabba', 10, 6);



CREATE TABLE  Sevenhierarchy( ID INT PRIMARY KEY NOT NULL, NAME TEXT  NOT NULL, fieldid INT references fieldname(ID), PrevioushierarchyID INT references Sixthhierarchy(ID));


INSERT INTO Sevenhierarchy (ID,NAME, fieldid, PrevioushierarchyID) VALUES (1, 'LOHARU_village_khewat_Murrabba_Khasra', 6, 1);

INSERT INTO Sevenhierarchy (ID,NAME, fieldid, PrevioushierarchyID) VALUES (2, 'Bawal_village_khewat_Murrabba_Khasra', 6, 2);

INSERT INTO Sevenhierarchy (ID,NAME, fieldid, PrevioushierarchyID) VALUES (3, 'Mumbai_Mandal_village_Survey No_Murrabba_Khasra', 6, 3);

INSERT INTO Sevenhierarchy (ID,NAME, fieldid, PrevioushierarchyID) VALUES (4, 'Mumbai_Mandal_village_Survey No1_Murrabba_Khasra', 6, 4);

INSERT INTO Sevenhierarchy (ID,NAME, fieldid, PrevioushierarchyID) VALUES (5, 'Mumbai_Mandal2_village_Survey No_Murrabba_Khasra', 6, 5);

INSERT INTO Sevenhierarchy (ID,NAME, fieldid, PrevioushierarchyID) VALUES (6, 'Mumbai_Mandal2_village_Survey No2_Murrabba_Khasra', 6, 6);