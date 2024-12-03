unit unitInterfaceForge;
{Role: Permet d'afficher l'interface de la forge qui permet de forger des objets ou de quittez la forge.}
{$codepage utf8}
{$mode objfpc}{$H+}

interface
//Permet de savoir quel choix est fait
function gererChoixForge(choix : Integer):Integer;
//Permet d'aller forger
procedure forger();
//Permet de quittez la forge
procedure quittez();
  
implementation
uses
  SysUtils, Classes, unitBeersIhm, unitForgeIHM, unitForgeLogic;


//Procedure qui gere les choix fait par le joueur a la forge
function gererChoixForge(choix : Integer):Integer;
begin
  case choix of 
    1 : forger(); //Allez forger
    2 : quittez(); //Retournez au hall
  end;
end;

procedure forger();
begin
  ouvrirForge(); // Appel de l'interface de forger objet
end;


procedure quittez();
begin
  afficherInterface(); // Appel de l'interface du hall pour revenir au hall
end; 
end.
