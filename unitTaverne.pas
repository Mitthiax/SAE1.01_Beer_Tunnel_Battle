unit unitTaverne;

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
//Permet de quitter la taverne
procedure quitter();
  
implementation
uses
  SysUtils, Classes, unitBeersIhm;


//Procedure qui gere les choix fait par le joueur a la taverne
procedure gererChoixTaverne(choix : Integer);
begin
  case choix of 
    1 : boireBiere();
    2 : manger();
    3 : quitter();
  end;
end;

procedure boireBiere();
begin
  WriteLn('Vous allez boire une bière.');
end;

procedure manger();
begin
  WriteLn('Vous allez manger.');
end;

procedure quitter();
begin
  afficherInterface(); // Appel de l'interface du hall pour revenir au hall
end;

//Procedure qui affiche le journal du joueur avec tout les informations sur sont personnage
procedure afficherJournal();
begin
  //afficherJournalIHM();
end;
  
end.