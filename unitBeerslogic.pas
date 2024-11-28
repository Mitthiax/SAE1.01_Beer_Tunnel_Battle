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
  SysUtils, Classes, unitBeersIhm, unitTaverneIHM, unitTaverne, combat, unitCombatConst, unitCoffreLogic,unitMarchandIHM;

//Procedure qui gere les choix fait par le joueur
procedure gererChoix(choix : Integer);
begin
  case choix of 
    1 : allerChambre();
    2 : AllerMarchand();
    3 : allerForge();
    4 : allerMine();
    5 : afficherInterfaceTaverne();
  end;
end;


procedure AllerChambre;
begin
  // Logique spécifique à la chambre
  ouvrirCoffre()
end;

procedure AllerMarchand;
begin
  // Logique spécifique aux marchands
  afficherInterfaceMarchand();
end;

procedure AllerForge;
begin
  WriteLn('Vous allez à la forge.');
  // Logique spécifique à la forge
end;

procedure AllerTaverne;
begin
  afficherInterfaceTaverne(); //Appel l'interfe de la Taverne pour allez dans la taverne
end;

procedure AllerMine;
begin
  // Logique spécifique aux mines
  commencerCombat(GOBLIN);
end;
end.