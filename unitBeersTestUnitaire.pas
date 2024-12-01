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

 
//Teste unitaire de la date
procedure testdate();
var
i:integer;
begin
//test l'initialisation de la date (début de partie)
  newTestsSeries('A l''initialisation');
  newTest('A l''initialisation','Initialisation du numéro du jours');
  InitialiserDate();
  testIsEqual(GetDatejour,1);

  newTest('A l''initialisation','Initialisation du jours de la semaine');
  testIsEqual(Ord(ObtenirDateActuelle.JourSemaine), Ord(Orgilion));

  newTest('A l''initialisation','Initialisation du mois');
  testIsEqual(Ord(ObtenirDateActuelle.Mois), Ord(Narwain));

//test l'incrémentation de la date
  newTestsSeries('Incrémentation');
  newTest('Incrémentation','Jour');
  InitialiserDate();
  AvancerDate();
  testIsEqual(GetDatejour,2);
  
  newTest('Incrémentation','Semaine');
  testIsEqual(ord(ObtenirDateActuelle.JourSemaine),ord(Oranor));

  newTest('Incrémentation','Mois30');
  InitialiserDate();
  for i:=1 to 30 do
  begin
    AvancerDate();
  end;
  testIsEqual(GetDatejour,1);
  testIsEqual(Ord(ObtenirDateActuelle.Mois), Ord(Ninui));

  newTest('Incrémentation','Mois31');
  InitialiserDateTest();
  AvancerDate();
  testIsEqual(GetDatejour,31);
  testIsEqual(Ord(ObtenirDateActuelle.Mois), Ord(Cerveth));

  newTest('Incrémentation','Début d''année');
  InitialiserDateTest2();
  AvancerDate();
  testIsEqual(GetDatejour,1);
  testIsEqual(Ord(ObtenirDateActuelle.Mois), Ord(Narwain));
end; 

//Lance tous les tests
procedure testbeer();
begin
     testdate();


     Summary();
     readln;
end;
  
end.