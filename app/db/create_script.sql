-- Step: 01
-- Goal: Create a new database mvc-p4
-- **********************************************************************************
-- Version       Date:           Author:                     Description:
-- *******       **********      ****************            ******************
-- 01            14-04-2023      Quinty de winter            New
-- **********************************************************************************/

-- Check if the database exists
DROP DATABASE IF EXISTS `mvc-p4`;

-- Create a new Database
CREATE DATABASE IF NOT EXISTS `mvc-p4`;

-- Use database mvc-p4
Use `mvc-p4`;

-- Step: 02
-- Goal: Create a new table instructeur
-- **********************************************************************************
-- Version       Date:           Author:                     Description:
-- *******       **********      ****************            ******************
-- 01            14-04-2023      Quinty de winter            New
-- **********************************************************************************/

-- Drop table instructeur
DROP TABLE IF EXISTS instructeur;

CREATE TABLE IF NOT EXISTS instructeur
(
    Id              TINYINT         UNSIGNED        NOT NULL    AUTO_INCREMENT
   ,Voornaam        VARCHAR(50)                     NOT NULL
   ,Tussenvoegsel   VARCHAR(10)                     NOT NULL
   ,Achternaam      VARCHAR(50)                     NOT NULL
   ,Mobiel          VARCHAR(12)                     NOT NULL
   ,DatumInDienst   DATE                            NOT NULL
   ,AantalSterren   VARCHAR(6)                      NOT NULL
   ,IsActief        BIT                             NOT NULL    DEFAULT 1
   ,Opmerkingen     VARCHAR(250)                        NULL    DEFAULT NULL
   ,DatumAangemaakt DateTime(6)                     NOT NULL
   ,DatumGewijzigd  DateTime(6)                     NOT NULL

   ,CONSTRAINT      PK_instructeur_Id   PRIMARY KEY CLUSTERED(Id)
) ENGINE=InnoDB;


-- Step: 03
-- Goal: Fill table instructeur with data
-- **********************************************************************************
-- Version       Date:           Author:                     Description:
-- *******       **********      ****************            ******************
-- 01            14-04-2023      Quinty de winter            New
-- **********************************************************************************/

INSERT INTO instructeur
(
     Voornaam
    ,Tussenvoegsel
    ,Achternaam
    ,Mobiel
    ,DatumInDienst
    ,AantalSterren
    ,IsActief
    ,Opmerkingen
    ,DatumAangemaakt
    ,DatumGewijzigd
)
VALUES
     ('Li', '', 'Zhan', '06-28493827', '2015-04-17', '***', 1, NULL, SYSDATE(6), SYSDATE(6))
    ,('Leroy', '', 'Boerhaven', '06-39398734', '2018-06-25', '*', 1, NULL, SYSDATE(6), SYSDATE(6))
    ,('Yoeri', 'Van', 'Veen', '06-24383291', '2010-12-05', '***', 1, NULL, SYSDATE(6), SYSDATE(6))
    ,('Bert', 'Van', 'Sali', '06-48293823', '2023-01-10', '****', 1, NULL, SYSDATE(6), SYSDATE(6))
    ,('Mohammed', 'El', 'Yassidi', '06-34291234', '2010-06-14', '*****', 1, NULL, SYSDATE(6), SYSDATE(6));


-- Step: 04
-- Goal: Create a new table typeVoertuig
-- **********************************************************************************
-- Version       Date:           Author:                     Description:
-- *******       **********      ****************            ******************
-- 01            14-04-2023      Quinty de winter            New
-- **********************************************************************************/

-- Drop table typeVoertuig
DROP TABLE IF EXISTS typeVoertuig;

CREATE TABLE IF NOT EXISTS typeVoertuig
(
    Id                  TINYINT         UNSIGNED        NOT NULL    AUTO_INCREMENT
   ,TypeVoertuig        VARCHAR(20)                     NOT NULL
   ,RijbewijsCategorie  VARCHAR(5)                     NOT NULL
   ,IsActief            BIT                             NOT NULL    DEFAULT 1
   ,Opmerkingen         VARCHAR(250)                        NULL    DEFAULT NULL
   ,DatumAangemaakt     DateTime(6)                     NOT NULL
   ,DatumGewijzigd      DateTime(6)                     NOT NULL

   ,CONSTRAINT      PK_typeVoertuig_Id   PRIMARY KEY CLUSTERED(Id)
) ENGINE=InnoDB;


-- Step: 05
-- Goal: Fill table typeVoertuig with data
-- **********************************************************************************
-- Version       Date:           Author:                     Description:
-- *******       **********      ****************            ******************
-- 01            14-04-2023      Quinty de winter            New
-- **********************************************************************************/

INSERT INTO typeVoertuig
(   TypeVoertuig      
    ,RijbewijsCategorie
    ,IsActief
    ,Opmerkingen
    ,DatumAangemaakt
    ,DatumGewijzigd
)
VALUES
    ('Personenauto', 'B', 1, NULL, SYSDATE(6), SYSDATE(6))
    ,('Vrachtwagen', 'C', 1, NULL, SYSDATE(6), SYSDATE(6))
    ,('Bus', 'D', 1, NULL, SYSDATE(6), SYSDATE(6))
    ,('Bromfiets', 'AM', 1, NULL, SYSDATE(6), SYSDATE(6));



-- Step: 06
-- Goal: Create a new table voertuig
-- **********************************************************************************
-- Version       Date:           Author:                     Description:
-- *******       **********      ****************            ******************
-- 01            14-04-2023      Quinty de winter            New
-- **********************************************************************************/

-- Drop table voertuig
DROP TABLE IF EXISTS voertuig;

CREATE TABLE IF NOT EXISTS voertuig
(
    Id                  TINYINT         UNSIGNED       NOT NULL    AUTO_INCREMENT
   ,Kenteken            VARCHAR(10)                    NOT NULL
   ,Type                VARCHAR(20)                    NOT NULL
   ,Bouwjaar            DATE                           NOT NULL
   ,Brandstof           VARCHAR(12)                    NOT NULL
   ,typeVoertuigId      TINYINT         UNSIGNED       NOT NULL
   ,IsActief            BIT                            NOT NULL    DEFAULT 1
   ,Opmerkingen         VARCHAR(250)                       NULL    DEFAULT NULL
   ,DatumAangemaakt     DateTime(6)                    NOT NULL
   ,DatumGewijzigd      DateTime(6)                    NOT NULL

   ,CONSTRAINT      PK_voertuig_Id   PRIMARY KEY CLUSTERED(Id)
   ,CONSTRAINT      FK_voertuig_typeVoertuigId_typeVoertuig_Id FOREIGN KEY (typeVoertuigId) REFERENCES typeVoertuig(Id)
) ENGINE=InnoDB;


-- Step: 07
-- Goal: Fill table voertuig with data
-- **********************************************************************************
-- Version       Date:           Author:                     Description:
-- *******       **********      ****************            ******************
-- 01            14-04-2023      Quinty de winter            New
-- **********************************************************************************/

INSERT INTO voertuig
(   Kenteken      
    ,Type
    ,Bouwjaar
    ,Brandstof
    ,typeVoertuigId
    ,IsActief
    ,Opmerkingen
    ,DatumAangemaakt
    ,DatumGewijzigd
)
VALUE
     ('AU-67-IO', 'Golf',       '2017-06-12', 'Diesel'     , 1, 1, NULL, SYSDATE(6), SYSDATE(6))
    ,('TR-24-OP', 'DAF',        '2019-05-23', 'Diesel'	   , 2, 1, NULL, SYSDATE(6), SYSDATE(6))
    ,('TH-78-KL', 'Mercedes',   '2023-01-01', 'Benzine'	   , 1, 1, NULL, SYSDATE(6), SYSDATE(6))
    ,('90-KL-TR', 'Fiat 500',   '2021-09-12', 'Benzine'	   , 1, 1, NULL, SYSDATE(6), SYSDATE(6))
    ,('34-TK-LP', 'Scania',     '2015-03-13', 'Diesel'	   , 2, 1, NULL, SYSDATE(6), SYSDATE(6))
    ,('YY-OP-78', 'BMW M5',     '2022-05-13', 'Diesel'	   , 1, 1, NULL, SYSDATE(6), SYSDATE(6))
    ,('UU-HH-JK', 'M.A.N',      '2017-12-03', 'Diesel'	   , 2, 1, NULL, SYSDATE(6), SYSDATE(6))
    ,('ST-FZ-28', 'Citroën',    '2018-01-20', 'Elektrisch' , 1, 1, NULL, SYSDATE(6), SYSDATE(6))
    ,('123-FR-T', 'Piaggio ZIP','2021-02-01', 'Benzine'    , 4, 1, NULL, SYSDATE(6), SYSDATE(6))
    ,('DRS-52-P', 'Vespa',      '2022-03-21', 'Benzine'    , 4, 1, NULL, SYSDATE(6), SYSDATE(6))
    ,('STP-12-U', 'Kymco',      '2022-07-02', 'Benzine'    , 4, 1, NULL, SYSDATE(6), SYSDATE(6))
    ,('45-SD-23', 'Renault',    '2023-01-01', 'Diesel'     , 3, 1, NULL, SYSDATE(6), SYSDATE(6));	  


-- Step: 08
-- Goal: Create a new table voertuigInstructeur
-- **********************************************************************************
-- Version       Date:           Author:                     Description:
-- *******       **********      ****************            ******************
-- 01            14-04-2023      Quinty de winter            New
-- **********************************************************************************/

-- Drop table voertuigInstructeur
DROP TABLE IF EXISTS voertuigInstructeur;

CREATE TABLE IF NOT EXISTS voertuigInstructeur
(
    Id                         TINYINT      UNSIGNED       NOT NULL   AUTO_INCREMENT
    ,VoertuigId                TINYINT      UNSIGNED       NOT NULL   
    ,InstructeurId             TINYINT      UNSIGNED       NOT NULL   
    ,DatumToekening            Date 
    ,IsActief                  BIT                         NOT NULL   DEFAULT 1
    ,Opmerkingen               VARCHAR(250)                    NULL   DEFAULT NULL
    ,DatumAangemaakt           DateTime(6)                 NOT NULL
    ,DatumGewijzigd            DateTime(6)                 NOT NULL


,CONSTRAINT PK_Voertuig_Id PRIMARY KEY CLUSTERED(Id)

,CONSTRAINT FK_voertuigInstructeur_voertuigId_voertuig_Id FOREIGN KEY (VoertuigId) REFERENCES voertuig(Id)
,CONSTRAINT FK_voertuigInstructeur_instructeurId_instructeur_Id FOREIGN KEY (InstructeurId) REFERENCES instructeur(Id)
) ENGINE=InnoDB;


-- Step: 09
-- Goal: Fill table voertuigInstructeur with data
-- **********************************************************************************
-- Version       Date:           Author:                     Description:
-- *******       **********      ****************            ******************
-- 01            14-04-2023      Quinty de winter            New
-- **********************************************************************************/

INSERT INTO voertuigInstructeur
(    VoertuigId
    ,InstructeurId
    ,DatumToekening
    ,IsActief
    ,Opmerkingen
    ,DatumAangemaakt
    ,DatumGewijzigd
    ) 
VALUE
    (1, 5, '2017-06-18', 1, NULL, SYSDATE(6), SYSDATE(6)),
    (3, 1, '2021-09-26', 1, NULL, SYSDATE(6), SYSDATE(6)),
    (9, 1, '2021-09-27', 1, NULL, SYSDATE(6), SYSDATE(6)),
    (3, 4, '2022-08-01', 1, NULL, SYSDATE(6), SYSDATE(6)),
    (5, 1, '2019-08-30', 1, NULL, SYSDATE(6), SYSDATE(6)),
    (10, 5, '2020-02-02', 1, NULL, SYSDATE(6), SYSDATE(6));


-- Step: 10
-- Goal: Create a new table examen
-- **********************************************************************************
-- Version       Date:           Author:                     Description:
-- *******       **********      ****************            ******************
-- 01            14-04-2023      Quinty de winter            New
-- **********************************************************************************/

-- Drop table examen
DROP TABLE IF EXISTS examen;

CREATE TABLE IF NOT EXISTS examen
(
    Id                         SMALLINT      UNSIGNED       NOT NULL   AUTO_INCREMENT
    ,StudentId                 INT           UNSIGNED       NOT NULL   
    ,Rijschool                 VARCHAR(100)                 NOT NULL   
    ,Stad                      VARCHAR(50)                  NOT NULL
    ,RijbewijsCategorie        VARCHAR(10)                  NOT NULL   
    ,Datum                     Date                         NULL       
    ,Uitslag                   VARCHAR(20)                  NULL       
    ,DatumAangemaakt           DateTime(6)                  NOT NULL
    ,DatumGewijzigd            DateTime(6)                  NOT NULL


,CONSTRAINT PK_Id PRIMARY KEY CLUSTERED(Id)

) ENGINE=InnoDB;


-- Step: 11
-- Goal: Fill table examen with data
-- **********************************************************************************
-- Version       Date:           Author:                     Description:
-- *******       **********      ****************            ******************
-- 01            14-04-2023      Quinty de winter            New
-- **********************************************************************************/

INSERT INTO examen
(   Id                  
,StudentId          
,Rijschool          
,Stad               
,RijbewijsCategorie 
,Datum              
,Uitslag            
,DatumAangemaakt    
,DatumGewijzigd     
) 
VALUE
    (1, 100234, 'VolGasVooruit',         'Rotterdam',  'B',  '2023-04-03', 'Geslaagd', SYSDATE(6), SYSDATE(6)),
    (2, 123432, 'InZijnVierDoorDeBocht', 'Sliedrecht', 'C',  '2023-03-01', 'Geslaagd', SYSDATE(6), SYSDATE(6)),
    (3, 103234, 'LinksomRechtsom',       'Dordrecht',  'D',  '2023-05-15', 'Geslaagd', SYSDATE(6), SYSDATE(6)),
    (4, 106452, 'OpDeVluchtStrook',      'Zwijdrecht', 'AM', '2023-05-08', 'Gezakt',   SYSDATE(6), SYSDATE(6)),
    (5, 104546, 'RechtDoorEnGaan',       'Rotterdam',  'B',  '2023-04-17', 'Gezakt',   SYSDATE(6), SYSDATE(6)),
    (6, 100333, 'AltijdGeslaagd',        'Dordrecht',  'B',  '2023-05-12', 'Geslaagd', SYSDATE(6), SYSDATE(6)),
    (7, 124444, 'RijlesVoorJou',         'Rotterdam',  'B',  '2023-04-12', 'Geslaagd', SYSDATE(6), SYSDATE(6));

-- Step: 12
-- Goal: Create a new table examinator
-- **********************************************************************************
-- Version       Date:           Author:                     Description:
-- *******       **********      ****************            ******************
-- 01            14-04-2023      Quinty de winter            New
-- **********************************************************************************/

-- Drop table examinator
DROP TABLE IF EXISTS examinator;

CREATE TABLE IF NOT EXISTS examinator
(
    Id                  SMALLINT      UNSIGNED    NOT NULL   AUTO_INCREMENT
    ,Voornaam           VARCHAR(50)               NOT NULL   
    ,Tussenvoegsel      VARCHAR(10)               NULL   
    ,Achternaam         VARCHAR(50)               NOT NULL
    ,Mobiel             SMALLINT                  NOT NULL   
    ,DatumAangemaakt    DateTime(6)               NOT NULL
    ,DatumGewijzigd     DateTime(6)               NOT NULL


,CONSTRAINT PK_Id PRIMARY KEY CLUSTERED(Id)

) ENGINE=InnoDB;


-- Step: 13
-- Goal: Fill table examinator with data
-- **********************************************************************************
-- Version       Date:           Author:                     Description:
-- *******       **********      ****************            ******************
-- 01            14-04-2023      Quinty de winter            New
-- **********************************************************************************/

INSERT INTO examinator
(   Id                  
,Voornaam          
,Tussenvoegsel          
,Achternaam               
,Mobiel 
,DatumAangemaakt    
,DatumGewijzigd     
) 
VALUE
    (1, 'Manuel', 'Van',    'Meekeren', 06-28493823, SYSDATE(6), SYSDATE(6)),
    (2, 'Lisette', 'Den',   'Dongen',   06-24383299, SYSDATE(6), SYSDATE(6)),
    (3, 'Jurswailly', Null, 'Luciano',  06-48293846, SYSDATE(6), SYSDATE(6)),
    (4, 'Nashwa', NULL,     'Salawi',   06-34291219, SYSDATE(6), SYSDATE(6));

-- Step: 14
-- Goal: Create a new table examenPerExaminator
-- **********************************************************************************
-- Version       Date:           Author:                     Description:
-- *******       **********      ****************            ******************
-- 01            14-04-2023      Quinty de winter            New
-- **********************************************************************************/

-- Drop table examenPerExaminator
DROP TABLE IF EXISTS examenPerExaminator;

CREATE TABLE IF NOT EXISTS examenPerExaminator
(
    Id                         SMALLINT      UNSIGNED       NOT NULL   AUTO_INCREMENT
    ,ExamenId                  SMALLINT      UNSIGNED       NOT NULL   
    ,ExaminatorId              SMALLINT      UNSIGNED       NOT NULL   
    ,DatumAangemaakt           DateTime(6)                  NOT NULL
    ,DatumGewijzigd            DateTime(6)                  NOT NULL


,CONSTRAINT PK_Id PRIMARY KEY CLUSTERED(Id)
,CONSTRAINT FK_examenPerExaminator_ExamenId_examen_Id FOREIGN KEY (ExamenId) REFERENCES examen(Id)
,CONSTRAINT FK_examenPerExaminator_ExaminatorId_examinator_Id FOREIGN KEY (ExaminatorId) REFERENCES Examinator(Id)
) ENGINE=InnoDB;

-- Step: 15
-- Goal: Fill table examenPerExaminator with data
-- **********************************************************************************
-- Version       Date:           Author:                     Description:
-- *******       **********      ****************            ******************
-- 01            14-04-2023      Quinty de winter            New
-- **********************************************************************************/

INSERT INTO examenPerExaminator
(   Id                  
,ExamenId          
,ExaminatorId          
,DatumAangemaakt    
,DatumGewijzigd     
) 
VALUE
    (1, 1, 3, SYSDATE(6), SYSDATE(6)),
    (2, 3, 3, SYSDATE(6), SYSDATE(6)),
    (3, 2, 2, SYSDATE(6), SYSDATE(6)),
    (4, 4, 1, SYSDATE(6), SYSDATE(6)),
    (5, 7, 3, SYSDATE(6), SYSDATE(6)),
    (6, 6, 2, SYSDATE(6), SYSDATE(6)),
    (7, 5, 4, SYSDATE(6), SYSDATE(6));