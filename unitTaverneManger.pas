unit unitTaverneManger;

{$codepage utf8}
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
  1 : if getinvent(monnaie)>= 18 then
  begin
    setbuffResistanceMax();
    setinvent(monnaie,getinvent(monnaie)-18);
  end; 
  2 : if getinvent(monnaie)>= 25 then
  begin
    setBuffSanteeMax();
    setinvent(monnaie,getinvent(monnaie)-25);
  end;
  3 : afficherInterfaceTaverne();
end;
end;
end.