unit gestionBuff;

{$codepage utf8}
{$mode objfpc}{$H+}

interface
type//tableau qui permet l'inventaire
  ListBuff=(BuffSanteeMax,ResistanceMax);
  TabBuff= array[BuffSanteeMax..ResistanceMax] of boolean;
procedure resetBuffs();
function getBuffResistanceMax():integer;
function getBuffSanteeMax():integer;
procedure setbuffResistanceMax();
procedure setBuffSanteeMax();
function indicationBuffResistanceMax():boolean;
function indicationBuffSanteeMax():boolean;
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
function getBuffSanteeMax():integer;
var
calcSantemax:integer;
begin
  if buff[BuffSanteeMax]=true then
  begin
    calcSantemax:=(getSantemax()+30);
  end
  else
  begin
    calcSantemax:=(200+15*(getlevel-1));
  end;
  getBuffSanteeMax:=calcSantemax
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
  procedure setbuffResistanceMax();
  begin
    buff[ResistanceMax]:=true;
  end;

  procedure setBuffSanteeMax();
  begin
    buff[BuffSanteeMax]:=true; 
  end;
function indicationBuffSanteeMax():boolean;
var
indication:boolean;
begin
    if buff[BuffSanteeMax]=true then
  begin
    indication:=true
  end
  else
  begin
    indication:=false
  end;
  indicationBuffSanteeMax:=indication;
end;

function indicationBuffResistanceMax():boolean;
var
indication:boolean;
begin
    if buff[ResistanceMax]=true then
  begin
    indication:=true
  end
  else
  begin
    indication:=false
  end;
  indicationBuffResistanceMax:=indication;
end;
end.