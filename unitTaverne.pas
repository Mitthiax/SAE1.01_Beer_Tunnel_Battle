unit unitTaverne;

{$codepage utf8}
{$mode objfpc}{$H+}

interface
//Permet de savoir quel choix est fait
procedure gererChoixTaverne(choix : Integer);
//Affichage du journal du joueur avec tout les informations sur sont personnage
procedure afficherJournal(); 
//Permet d'aller boire une biere
procedure boireBiere();
//Permet d'aller manger
procedure manger();
//Permet de quittez la taverne
procedure quittez();
  
implementation
uses
  SysUtils, Classes, unitBeersIhm, unitTaverneAnecdote, unitTaverneAnecdoteIHM;


//Procedure qui gere les choix fait par le joueur a la taverne
procedure gererChoixTaverne(choix : Integer);
begin
  case choix of 
    1 : boireBiere();
    2 : manger();
    3 : quittez();
  end;
end;

procedure boireBiere();
begin
  afficherInterfaceBiere(); // Appel de l'interface de consommation biere
end;

procedure manger();
begin
  WriteLn('Vous allez manger.');
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