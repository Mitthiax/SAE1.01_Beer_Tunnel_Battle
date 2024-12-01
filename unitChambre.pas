unit unitChambre;

{$mode objfpc}{$H+}

interface
//Permet de savoir quel choix est fait
procedure gererChoixChambre(choix : Integer);
//Affichage du journal du joueur avec tout les informations sur sont personnage
procedure afficherJournal(); 
//Permet d'aller dormir et donc de ce reposer et refaire le plein de santé
procedure dormir();
//Permet d'aller regarder ce que contient le coffre
procedure regarderCoffre();
//Permet de quittez la chambre
procedure quittez();
  
implementation
uses
  SysUtils, Classes, unitBeersIhm, unitCoffreIHM, unitDormirIhm;


//Procedure qui gere les choix fait par le joueur dans la chambre
procedure gererChoixChambre(choix : Integer);
begin
  case choix of 
    1 : dormir();
    2 : regarderCoffre();
    3 : quittez();
  end;
end;

procedure dormir();
begin
  afficherInterfaceDormir(); // Appel de l'interface utiliser pour le sommeil
end;

procedure regarderCoffre();
begin
  coffreIHM();
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