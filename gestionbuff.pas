unit gestionBuff;

{$codepage utf8}
{$mode objfpc}{$H+}

interface
type//tableau qui permet l'inventaire
  ListBuff=(BuffSanteeMax,ResistanceMax);
  TabBuff= array[BuffSanteeMax..ResistanceMax] of boolean;
procedure resetBuffs();
function getBuffResistanceMax():integer;
procedure getBuffSanteeMax();
implementation
uses
  SysUtils, Classes,GestionPerso;

var
buff:TabBuff;

//remet les buffs à false
procedure resetBuffs();
var
  i:ListBuff;//incrémentation du for
begin
for i:= low(buff) to high (buff) do
  begin
    buff[i]:=false;
  end;
end;

//définie la santee max en fonction du buff
procedure getBuffSanteeMax();
begin
  if buff[BuffSanteeMax]=true then
  begin
    setSantemax(getSantemax()+30);

  end
  else
  begin
    setSantemax(getSantemax());
  end;
end;

//donne la resistance en plus en fonction du buff
function getBuffResistanceMax():integer;
var
resistanceadd:integer;
begin
  if buff[ResistanceMax]=true then
  begin
    resistanceadd:=20;
  end
  else
  begin
    resistanceadd:=0;
  end;
  getBuffResistanceMax:=resistanceadd;
end;
  
end.