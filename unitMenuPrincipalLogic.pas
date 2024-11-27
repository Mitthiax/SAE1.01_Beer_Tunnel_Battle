unit unitMenuPrincipalLogic;

{$mode objfpc}{$H+}

interface
  // Menu principal du jeu qui permet de lancer une partie ou de quitter le jeu
  procedure menu();
  
implementation
  uses
    unitMenuPrincipalIHM,  GestionEcran;

  // Quitter le jeux
  procedure quitter();
  begin
    quitterIHM();
  end;

  // Menu principal du jeu qui permet de lancer une partie ou de quitter le jeu
  procedure menu();
  var
    choix: integer; // Choix du joueur dans le menu

  begin
    choix := menuIHM();
    //if choix = 1 then creerPartie()
    //else quitter();
  end;
end.