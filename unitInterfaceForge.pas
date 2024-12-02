unit unitInterfaceForge;

{$codepage utf8}
{$mode objfpc}{$H+}

interface
//Permet de savoir quel choix est fait
procedure gererChoixForge(choix : Integer);
//Affichage du journal du joueur avec tout les informations sur sont personnage
procedure afficherJournal(); 
//Permet d'aller forger
procedure forger();
//Permet de quittez la forge
procedure quittez();
  
implementation
uses
  SysUtils, Classes, unitBeersIhm, unitForgeIHM, unitForgeLogic;


//Procedure qui gere les choix fait par le joueur a la forge
procedure gererChoixForge(choix : Integer);
begin
  case choix of 
    1 : forger();
    2 : quittez();
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

//Procedure qui affiche le journal du joueur avec tout les informations sur sont personnage
procedure afficherJournal();
begin
  //afficherJournalIHM();
end;
  
end.
