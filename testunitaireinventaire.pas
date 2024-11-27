unit testunitaireinventaire;

{$mode objfpc}{$H+}

interface
procedure testachat();

implementation
uses
  SysUtils, Classes, testunitaire, Inventaire, marchand;
  
//test unitaire sur les interactions avec l'inventaire
procedure Testunitaireinteractioninventaire();
begin
  newTestsSeries('Test incrementation de l''inventaire');
  newTest('Test incrementation de l''inventaire','Achat d''une bombe');
  InventaireInit();
  achat(1);
  testIsEqual(invent[bombe],1);//vérifie l'ajout de 1bombe
  testIsEqual(invent[monnaie],170);//vérifie le debit des 30pièces
end;

//rassemble les test unitaire sous une seule et même procedure pour cette unité
  procedure testachat();
begin
  Testunitaireinteractioninventaire();
  Summary();
  readln;
end;
end.