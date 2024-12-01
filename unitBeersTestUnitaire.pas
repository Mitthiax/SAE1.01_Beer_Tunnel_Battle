unit unitBeersTestUnitaire;

{$codepage utf8}
{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;

procedure testbeer();

implementation
uses
unitDate,testUnitaire,unitDormir;

 
//Initialise la date (début de partie)
procedure initialisationDate();
begin
  newTestsSeries('A l''initialisation');
  newTest('A l''initialisation','Initialisation du numéro du jours');
  InitialiserDate();
  testIsEqual(GetDatejour,1);

  newTest('A l''initialisation','Initialisation du jours de la semaine');
  testIsEqual(Ord(ObtenirDateActuelle.JourSemaine), Ord(Oranor));

  newTest('A l''initialisation','Initialisation du mois');
  testIsEqual(Ord(ObtenirDateActuelle.Mois), Ord(Gwaeron));
end; 

//Lance tous les tests
procedure testbeer();
begin
     initialisationDate();


     Summary();
     readln;
end;
  
end.