unit unitInterfaceForge;
{Role: Permet d'afficher l'interface de la forge qui permet d'acceder au forgeront ou de quittez la forge.}
{$codepage utf8}
{$mode objfpc}{$H+}

interface
//Permet de savoir quel choix est fait
function gererChoixForge(choix : Integer):Integer;
//Permet d'aller forger
procedure forger();
//Permet de quitter la forge
procedure quitter();
  
implementation
uses
  SysUtils, Classes, unitBeersIhm, unitForgeIHM, unitForgeLogic;


//Procédure qui gere les choix fait par le joueur a la forge
Pocedure gererChoixForge(choix : Integer);
begin
  case choix of 
    1 : forger(); //Allez forger
    2 : quitter(); //Retournez au hall
  end;
end;

procedure forger();
begin
  ouvrirForge(); // Appel de l'interface de forger objet
end;


procedure quitter();
begin
  afficherInterface(); // Appel de l'interface du hall pour revenir dans le hall
end;
end.
