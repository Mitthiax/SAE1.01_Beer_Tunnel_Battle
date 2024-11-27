unit inventaire;

{$mode objfpc}{$H+}

interface
type//tableau qui permet l'inventaire
cont_invent=(cuivre,fer,mythril,bombe,potion,monnaie);
tab_invent= array[cuivre..monnaie] of integer;

var
invent:tab_invent;
procedure InventaireInit();
implementation
uses
  SysUtils, Classes,unitCoffreLogic,unitCoffreConst;
  
var
armeequip:string;
botte:string;
casque:string;
Jambiere:string;
Plastron:string;


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
  procedure armure();
  
  begin
    botte:=getNomEquipement(getBottesEquipe());
    casque:=getNomEquipement(getCasqueEquipe());
    Jambiere:=getNomEquipement(getJambieresEquipe());
    Plastron:=getNomEquipement(getPlastronEquipe());
  end;
procedure Arme();
begin
  armeequip:=getNomEquipement(getArmeEquipe());
end;

end.