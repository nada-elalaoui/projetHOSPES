/*==============================================================*/
/* Nom de SGBD :  ORACLE Version 11g                            */
/* Date de création :  26/12/2019 23:59:36                      */
/*==============================================================*/


alter table CONTIENT
   drop constraint FK_CONTIENT_CONTIENT_RESERVAT;

alter table CONTIENT
   drop constraint FK_CONTIENT_CONTIENT2_ACTIVITE;

alter table RESERVATION
   drop constraint FK_RESERVAT_EFFECTUE_CLIENT;

alter table RESERVATION2
   drop constraint FK_RESERVAT_RESERVATI_CHAMBRE;

alter table RESERVATION2
   drop constraint FK_RESERVAT_RESERVATI_RESERVAT;

drop table ACTIVITE cascade constraints;

drop table CHAMBRE cascade constraints;

drop table CLIENT cascade constraints;

drop table CONTIENT cascade constraints;

drop table RESERVATION cascade constraints;

drop table RESERVATION2 cascade constraints;

/*==============================================================*/
/* Table : ACTIVITE                                             */
/*==============================================================*/
create table ACTIVITE 
(
   ID_ACTIVITE          INTEGER              not null,
   NOM_ACTIVITE         CHAR(30),
   TEMPS                DATE,
   IMAGE                VARCHAR2(100),
   constraint PK_ACTIVITE primary key (ID_ACTIVITE)
);

/*==============================================================*/
/* Table : CHAMBRE                                              */
/*==============================================================*/
create table CHAMBRE 
(
   ID_CHAMBRE           INTEGER              not null,
   NUM_CHAMBRE          INTEGER,
   ETAGE                NUMBER(4),
   TYPE_CHAMBRE         VARCHAR2(30),
   RESERVATION          VARCHAR2(50),
   PRIX                 NUMBER(7),
   DUREE                DATE,
   constraint PK_CHAMBRE primary key (ID_CHAMBRE)
);

/*==============================================================*/
/* Table : CLIENT                                               */
/*==============================================================*/
create table CLIENT 
(
   ID_CLIENT            INTEGER              not null,
   NOM_CLIENT             VARCHAR2(20),
   PRENOM_CLIENT        VARCHAR2(20),
   CIN_CLIENT           VARCHAR2(20),
   TEL_CLIENT           NUMBER(10),
   ADRESSE_CLIENT       VARCHAR2(30),
   EMAIL_CLIENT         VARCHAR2(30),
   constraint PK_CLIENT primary key (ID_CLIENT)
);

/*==============================================================*/
/* Table : CONTIENT                                             */
/*==============================================================*/
create table CONTIENT 
(
   ID_ACTIVITE          INTEGER              not null,
   ID_RESERVATION       INTEGER              not null,
   constraint PK_CONTIENT primary key (ID_ACTIVITE, ID_RESERVATION)
);

/*==============================================================*/
/* Table : RESERVATION                                          */
/*==============================================================*/
create table RESERVATION 
(
   ID_RESERVATION       INTEGER              not null,
   ID_CLIENT            INTEGER              not null,
   DATE_ARRIVEE         DATE,
   DATE_SORTIE          DATE,
   TEL_CLIENT           NUMBER(10),
   EMAIL_CLIENT         VARCHAR2(30),
   CIN_CLIENT           VARCHAR2(20),
   constraint PK_RESERVATION primary key (ID_RESERVATION)
);

/*==============================================================*/
/* Table : RESERVATION2                                         */
/*==============================================================*/
create table RESERVATION2 
(
   ID_RESERVATION       INTEGER              not null,
   ID_CHAMBRE           INTEGER              not null,
   constraint PK_RESERVATION2 primary key (ID_RESERVATION, ID_CHAMBRE)
);

/*==============================================================*/
/* Contraintes                                 */
/*==============================================================*/
alter table CONTIENT
   add constraint FK_CONTIENT_CONTIENT_RESERVAT foreign key (ID_RESERVATION)
      references RESERVATION (ID_RESERVATION);

alter table CONTIENT
   add constraint FK_CONTIENT_CONTIENT2_ACTIVITE foreign key (ID_ACTIVITE)
      references ACTIVITE (ID_ACTIVITE);

alter table RESERVATION
   add constraint FK_RESERVAT_EFFECTUE_CLIENT foreign key (ID_CLIENT)
      references CLIENT (ID_CLIENT);

alter table RESERVATION2
   add constraint FK_RESERVAT_RESERVATI_CHAMBRE foreign key (ID_CHAMBRE)
      references CHAMBRE (ID_CHAMBRE);

alter table RESERVATION2
   add constraint FK_RESERVAT_RESERVATI_RESERVAT foreign key (ID_RESERVATION)
      references RESERVATION (ID_RESERVATION);


/*==============================================================*/
/* Insertions                          */
/*==============================================================*/

