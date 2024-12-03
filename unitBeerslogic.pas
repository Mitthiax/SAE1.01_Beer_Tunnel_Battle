unit unitBeerslogic;
{Role: Permet d'afficher le hall avec les different choix de chose possible de faire.}
{$codepage utf8}
{$mode objfpc}{$H+}

interface
//Permet de savoir quel choix est fait
procedure gererChoix(choix : Integer);
//Affichage du journal du joueur avec tout les informations sur sont personnage
procedure allerChambre();
//Permet d'aller au marchant
procedure AllerMarchand();
//Permet d'aller a la forge
procedure allerForge();
//Permet d'aller a la taverne
procedure allerTaverne();
//Permet d'aller dans la mine
procedure allerMine();
//Permet d'aller au menu principal pour crée une noivelle partie ou quittez
procedure allezMenu();
  
  
implementation
  uses
  SysUtils, Classes, unitBeersIhm, unitTaverneIHM, unitTaverne, unitMineLogic, unitCoffreLogic, unitMarchandIHM, unitForgeLogic, unitChambreIhm, unitMenuPrincipalLogic, unitInterfaceForgeIHM;

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
  afficherInterfaceChambre()
end;

procedure AllerMarchand;
begin
  // Logique spécifique aux marchands
  afficherInterfaceMarchand();
end;

procedure AllerForge;
begin
  // Procédure qui affiche toute l'interface de la forge
  afficherInterfaceForge();
end;

procedure AllerTaverne;
begin
  //Appel l'interfe de la Taverne pour allez dans la taverne
  afficherInterfaceTaverne(); 
end;

procedure AllerMine;
begin
  // Logique spécifique aux mines
  ouvrirMine();
end;

procedure allezMenu();
begin
  //Permet de crée une nouvelle partie ou de quittez le jeux
  menu();
end;

end.
