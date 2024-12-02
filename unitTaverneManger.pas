unit unitTaverneManger;

{$mode objfpc}{$H+}

interface

//Permet de finir manger
procedure gererChoixTaverneManger(choix : Integer);


implementation

uses
  SysUtils, Classes, unitTaverneIHM,Inventaire,gestionBuff, unitTaverneMangerIhm, journalihm;

//Procedure qui permet de manger
procedure gererChoixTaverneManger(choix : Integer);
begin
case choix of 
  1 : setbuffResistanceMax();
  2 : setBuffSanteeMax();
  3 : afficherInterfaceTaverne();
end;
end;
end.