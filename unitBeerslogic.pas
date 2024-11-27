unit unitBeerslogic;

{$mode objfpc}{$H+}

interface
//Permet de savoir quel choix est fait
procedure gererChoix(choix : Integer);
//Affichage du journal du joueur avec tout les informations sur sont personnage
procedure afficherJournal();
//Permet d'aller a la chambre
procedure allerChambre();
//Permet d'aller au marchant
procedure AllerMarchand();
//Permet d'aller a la forge
procedure allerForge();
//Permet d'aller a la taverne
procedure allerTaverne();
//Permet d'aller dans la mine
procedure allerMine();
  
  
implementation
  uses
  SysUtils, Classes,unitBeersIhm;

//Procedure qui gere les choix fait par le joueur
procedure gererChoix(choix : Integer);
begin
  case choix of 
    1 : allerChambre();
    2 : AllerMarchand();
    3 : allerForge();
    4 : allerMine();
    5 : allerTaverne();
  end;
end;


procedure AllerChambre;
begin
  WriteLn('Vous allez à votre chambre.');
  // Logique spécifique à la chambre
end;

procedure AllerMarchand;
begin
  WriteLn('Vous allez aux marchands.');
  // Logique spécifique aux marchands
end;

procedure AllerForge;
begin
  WriteLn('Vous allez à la forge.');
  // Logique spécifique à la forge
end;

procedure AllerTaverne;
begin
  WriteLn('Vous allez à la taverne.');
  // Logique spécifique à la taverne
end;

procedure AllerMine;
begin
  WriteLn('Vous allez aux mines.');
  // Logique spécifique aux mines
end;


//Procedure qui affiche le journal du joueur avec tout les informations sur sont personnage
procedure afficherJournal();
begin
  //afficherJournalIHM();
end;
end.