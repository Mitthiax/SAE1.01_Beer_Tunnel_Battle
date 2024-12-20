unit unitChambre;
{Role: Chambre avec la possibiliter de dormir ou de regarder sont coffre.}
{$codepage utf8}
{$mode objfpc}{$H+}

interface
//Permet de savoir quel choix est fait
procedure gererChoixChambre(choix : Integer);
//Permet d'aller dormir et donc de ce reposer et refaire le plein de santé
procedure dormir();
//Permet d'aller regarder ce que contient le coffre
procedure regarderCoffre();
//Permet de quitter la chambre
procedure quitter();
  
implementation
uses
  SysUtils, Classes, unitHallIhm, unitCoffreLogic, unitDormirIhm;


//Procédure qui gere les choix fait par le joueur dans la chambre
procedure gererChoixChambre(choix : Integer);
begin
  case choix of 
    1 : dormir();
    2 : regarderCoffre();
    3 : quitter();
  end;
end;

procedure dormir();
begin
  afficherInterfaceDormir(); // Appel de l'interface utiliser pour le sommeil
end;

procedure regarderCoffre();
begin
  ouvrirCoffre(); //Permet de regarder sont coffre
end;

procedure quitter();
begin
  afficherInterface(); // Appel de l'interface du hall pour revenir dans le hall
end;
end.
