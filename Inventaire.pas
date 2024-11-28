unit inventaire;

{$mode objfpc}{$H+}

interface
type//tableau qui permet l'inventaire
  cont_invent=(cuivre,fer,mythril,bombe,potion,monnaie);
  tab_invent= array[cuivre..monnaie] of integer;

//commme dans l'unité gestion perso ici on déclare les variable dans l'interface car elles sont réutiliser dans l'ihm ou dans d'autre unité
var
  armeequip:string;
  botte:string;
  casque:string;
  Jambiere:string;
  Plastron:string;
  invent:tab_invent;
procedure InventaireInit();

implementation
uses
  SysUtils, Classes,unitCoffreLogic,unitCoffreConst,GestionEcran;

//Initialise le tableau de l'inventaire(0 partout sauf pour l'or)
procedure InventaireInit();
var
i:cont_invent;//incrémentation du for
begin
for i:= low(invent) to high (invent) do
  begin
    invent[i]:=0;
  end;
  invent[monnaie]:=200
end;
  
end.