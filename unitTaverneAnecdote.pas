unit unitTaverneAnecdote;

{$codepage utf8}
{$mode objfpc}{$H+}

interface

//Permet de finir sa biere
procedure gererChoixTaverneBiere(choix : Integer);
//Affichage du journal du joueur avec tout les informations sur sont personnage
procedure afficherJournal(); 

  
implementation

uses
  SysUtils, Classes, unitTaverneIHM;

//Procedure qui permet de finir sa biere
procedure gererChoixTaverneBiere(choix : Integer);
begin
  if (choix = 1 ) then
    afficherInterfaceTaverne();
end;
 
//Procedure qui affiche le journal du joueur avec tout les informations sur sont personnage
procedure afficherJournal();
begin
  //afficherJournalIHM();
end;

  
end.