CREATE or replace PACKAGE p_client AS 
Procedure add_Client(ID_CLIENT number,NOM_CLIENT varchar2,PRENOM_CLIENT varchar2,CIN_CLIENT varchar2,TEL_CLIENT number,ADRESSE_CLIENT varchar2, EMAIL_CLIENT varchar2);
Procedure remove_client(ID_CLIENT number);
PROCEDURE modify_client(ID_CLIENT number,NOM_CLIENT varchar2,PRENOM_CLIENT varchar2,CIN_CLIENT varchar2,TEL_CLIENT number,ADRESSE_CLIENT varchar2, EMAIL_CLIENT varchar2);
END p_client;
 ------------------------------------------------------
;
/
CREATE or replace PACKAGE body p_client AS 
Procedure add_client(ID_CLIENT number,NOM_CLIENT varchar2,PRENOM_CLIENT varchar2,CIN_CLIENT varchar2,TEL_CLIENT number,ADRESSE_CLIENT varchar2, EMAIL_CLIENT varchar2) is

BEGIN
insert into Client values(1,'NOM','Prenom','F705065',0564789604,'OUJDA','client@gmail.com');
END;

Procedure remove_client(ID_CLIENT NUMBER) is
tot_clients number;
BEGIN
DELETE FROM Client
      WHERE client.ID_CLIENT = remove_cleint.ID_CLIENT; 
      tot_clients  := tot_clients - 1; 
      SELECT COUNT(*) INTO tot_clients FROM client; 
END;

PROCEDURE modify_client(ID_CLIENT number,NOM_CLIENT varchar2,PRENOM_CLIENT varchar2,CIN_CLIENT varchar2,TEL_CLIENT number,ADRESSE_CLIENT varchar2, EMAIL_CLIENT varchar2) is
BEGIN
update  ID_CLIENT
set ID_CLIENT=20;
END;

END ;


                                            
