unit inventaire;
{Role: Permet la gestion de l'inventaire.}
{$codepage utf8}
{$mode objfpc}{$H+}

interface
type//tableau qui permet l'inventaire
  cont_invent=(cuivre,fer,mythril,bombe,potion,monnaie);
  tab_invent= array[cuivre..monnaie] of integer;


function getinvent(get_cont:cont_invent):integer;
procedure setinvent(cont_set:cont_invent;nombreset:integer);
procedure InventaireInit();

implementation

uses
  SysUtils, Classes,unitCoffreLogic,unitCoffreConst,GestionEcran;

var
  invent:tab_invent;

//Initialise le tableau de l'inventaire (0 partout sauf pour l'or)
procedure InventaireInit();
var
i:cont_invent;// Variable de boucle
begin
for i:= low(invent) to high (invent) do
  begin
    invent[i]:=0;
  end;
  invent[monnaie]:=200
end;
  function getinvent(get_cont:cont_invent):integer;
  begin
    getinvent:=invent[get_cont];
  end;
  procedure setinvent(cont_set:cont_invent;nombreset:integer);
  begin
    invent[cont_set]:=nombreset;
  end;
end.
