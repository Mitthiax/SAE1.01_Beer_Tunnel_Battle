unit unitBeersTestUnitaire;

{$codepage utf8}
{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;

procedure test();

implementation
uses
  unitDate,testUnitaire;

 
//Initialise le numéro du jours (début de partie)
procedure initialisationDateJour_test();
begin
  newTestsSeries('Initialisation du numéro du jours');
  newTest('Initialisation du numéro du jours','A l''initialisation');
  InitialiserDate();
  testIsEqual(ObtenirDateActuelle.Jour,1);
end; 

//Initialise le numéro du jours (début de partie)
procedure initialisationDateJourSemaine_test();
begin
  newTestsSeries('Initialisation du jours de la semaine');
  newTest('Initialisation du jours de la semaine','A l''initialisation');
  InitialiserDate();
  testIsEqual(Ord(ObtenirDateActuelle.JourSemaine), Ord(Oranor));
end; 

//Initialise le numéro du jours (début de partie)
procedure initialisationDateMois_test();
begin
  newTestsSeries('Initialisation du mois');
  newTest('Initialisation du mois','A l''initialisation');
  InitialiserDate();
  testIsEqual(Ord(ObtenirDateActuelle.Mois), Ord(Gwaeron));
end; 

//Lance tous les tests
procedure test();
begin
     initialisationDateJour_test();
     initialisationDateJourSemaine_test();
     initialisationDateMois_test();

     Summary();
     readln;
end;
  
end.