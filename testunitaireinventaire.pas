unit testunitaireinventaire;

{$codepage utf8}
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
  StockboutiqueArtificiel();
  achat(1);
  testIsEqual(getinvent(bombe),1);//vérifie l'ajout de 1bombe
  testIsEqual(getinvent(monnaie),170);//vérifie le debit des 30pièces

  newTest('Test incrementation de l''inventaire','Achat d''une potion');
  achat(2);
  testIsEqual(getinvent(potion),1);//vérifie l'ajout de 1 potion
  testIsEqual(getinvent(monnaie),120);//vérifie le debit des 50pièces(80 au total)
end;

//rassemble les test unitaire sous une seule et même procedure pour cette unité
  procedure testachat();
begin
  Testunitaireinteractioninventaire();
  Summary();
  readln;
end;
end.