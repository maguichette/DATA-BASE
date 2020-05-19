/*==============================================================*/
/* Nom de SGBD :  MySQL 5.0                                     */
/* Date de création :  18/05/2020 17:15:27                      */
/*==============================================================*/


drop table if exists AYANT;

drop table if exists CHAMBRE;

drop table if exists DEPARTEMENT_MEDICAL;

drop table if exists FEUILLEDEVOL;

drop table if exists LIT;

drop table if exists MALADE;

drop table if exists MEDECIN;

drop table if exists OCCUPE;

drop table if exists SPECIALISTE;

drop table if exists SUIVRE;

/*==============================================================*/
/* Table : AYANT                                                */
/*==============================================================*/
create table AYANT
(
   NUMMEDECIN           int not null,
   ID                   int,
   primary key (NUMMEDECIN)
);

/*==============================================================*/
/* Table : CHAMBRE                                              */
/*==============================================================*/
create table CHAMBRE
(
   NUMCHAMBRE           int not null,
   CATEGORIE            char(100),
   TYPE                 char(100),
   primary key (NUMCHAMBRE)
);

/*==============================================================*/
/* Table : DEPARTEMENT_MEDICAL                                  */
/*==============================================================*/
create table DEPARTEMENT_MEDICAL
(
   NUMDEPARTEMENT       int not null,
   NOM                  char(100),
   primary key (NUMDEPARTEMENT)
);

/*==============================================================*/
/* Table : FEUILLEDEVOL                                         */
/*==============================================================*/
create table FEUILLEDEVOL
(
   NUMFEUILLE           int not null,
   NUMMALADE            int not null,
   DATE                 date,
   primary key (NUMFEUILLE)
);

/*==============================================================*/
/* Table : LIT                                                  */
/*==============================================================*/
create table LIT
(
   NUMERO               int not null,
   NUMCHAMBRE           int not null,
   primary key (NUMERO)
);

/*==============================================================*/
/* Table : MALADE                                               */
/*==============================================================*/
create table MALADE
(
   NUMMALADE            int not null,
   NUMDEPARTEMENT       int not null,
   SUI_NUMDEPARTEMENT   int not null,
   NUMMEDECIN           int not null,
   NOM                  char(100),
   ADRESSE              char(100),
   SEXE                 char(100),
   DATENAISSANCE        date,
   LIEUNAISSANCE        char(100),
   primary key (NUMMALADE)
);

/*==============================================================*/
/* Table : MEDECIN                                              */
/*==============================================================*/
create table MEDECIN
(
   NUMMEDECIN           int not null,
   NOMMEDECIN           char(100),
   primary key (NUMMEDECIN)
);

/*==============================================================*/
/* Table : OCCUPE                                               */
/*==============================================================*/
create table OCCUPE
(
   NUMMALADE            int not null,
   NUMERO               int not null,
   primary key (NUMMALADE, NUMERO)
);

/*==============================================================*/
/* Table : SPECIALISTE                                          */
/*==============================================================*/
create table SPECIALISTE
(
   ID                   int not null,
   NOMSPEC              char(100) not null,
   primary key (ID)
);

/*==============================================================*/
/* Table : SUIVRE                                               */
/*==============================================================*/
create table SUIVRE
(
   NUMDEPARTEMENT       int not null,
   NUMMEDECIN           int not null,
   NUMMALADE            int not null,
   primary key (NUMDEPARTEMENT, NUMMEDECIN)
);

alter table AYANT add constraint FK_AYANT foreign key (NUMMEDECIN)
      references MEDECIN (NUMMEDECIN) on delete restrict on update restrict;

alter table AYANT add constraint FK_AYANT2 foreign key (ID)
      references SPECIALISTE (ID) on delete restrict on update restrict;

alter table FEUILLEDEVOL add constraint FK_AVOIR foreign key (NUMMALADE)
      references MALADE (NUMMALADE) on delete restrict on update restrict;

alter table LIT add constraint FK_CONTENIR foreign key (NUMCHAMBRE)
      references CHAMBRE (NUMCHAMBRE) on delete restrict on update restrict;

alter table MALADE add constraint FK_INTERNER foreign key (NUMDEPARTEMENT)
      references DEPARTEMENT_MEDICAL (NUMDEPARTEMENT) on delete restrict on update restrict;

alter table MALADE add constraint FK_SUIVRE5 foreign key (SUI_NUMDEPARTEMENT, NUMMEDECIN)
      references SUIVRE (NUMDEPARTEMENT, NUMMEDECIN) on delete restrict on update restrict;

alter table OCCUPE add constraint FK_OCCUPE foreign key (NUMMALADE)
      references MALADE (NUMMALADE) on delete restrict on update restrict;

alter table OCCUPE add constraint FK_OCCUPE2 foreign key (NUMERO)
      references LIT (NUMERO) on delete restrict on update restrict;

alter table SUIVRE add constraint FK_SUIVRE foreign key (NUMDEPARTEMENT)
      references DEPARTEMENT_MEDICAL (NUMDEPARTEMENT) on delete restrict on update restrict;

alter table SUIVRE add constraint FK_SUIVRE2 foreign key (NUMMEDECIN)
      references MEDECIN (NUMMEDECIN) on delete restrict on update restrict;

alter table SUIVRE add constraint FK_SUIVRE6 foreign key (NUMMALADE)
      references MALADE (NUMMALADE) on delete restrict on update restrict;

