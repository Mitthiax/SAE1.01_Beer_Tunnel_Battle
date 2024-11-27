unit unitMenuPrincipalIHM;

{$mode objfpc}{$H+}

interface
  {
    IHM de l'écran de fermeture du jeu
  }
  procedure quitterIHM();

  {
    IHM du menu principal
    1 -> Lancer une partie
    sinon quitter
    Renvoi:
      Choix de l'utilisateur
  }
  function menuIHM():integer;
  
implementation
  uses
    GestionEcran;

  {
    Procedure qui dessine une chope de bière aux coordonnées x, y
    Parametres:
      x, y: integer; Coordonnées
  }
  procedure dessinerChope(x, y: integer);
  begin
    couleurTexte(White);
    deplacerCurseurXY(x, y);   write('|     |');
    deplacerCurseurXY(x, y+1); write('|     |\');
    deplacerCurseurXY(x, y+2); write('|     | |');
    deplacerCurseurXY(x, y+3); write('|     |/');
    deplacerCurseurXY(x, y+4); write('\_____/');

    couleurTexte(Yellow);
    deplacerCurseurXY(x+1, y);   write('_____');
    deplacerCurseurXY(x+1, y+1); write('#####');
    deplacerCurseurXY(x+1, y+2); write('#####');
    deplacerCurseurXY(x+1, y+3); write('#####');
    couleurTexte(White);
  end;

  {
    IHM de l'écran de fermeture du jeu
  }
  procedure quitterIHM();
  begin
    effacerEtColorierEcran(Black);
    dessinerCadreXY(80, 15, 120, 25, double, White, Black);
    deplacerCurseurXY(87, 18); write('##########################');
    deplacerCurseurXY(87, 19); write('#                        #');
    deplacerCurseurXY(87, 20); write('#  Beer Tunnels Battles  #');
    deplacerCurseurXY(87, 21); write('#                        #');
    deplacerCurseurXY(87, 22); write('##########################');
    dessinerChope(125, 18);
    attendre(250);
  end;

  {
    IHM du menu principal
    1 -> Lancer une partie
    sinon quitter
    Renvoi:
      Choix de l'utilisateur
  }
  function menuIHM():integer;
  begin
    effacerEtColorierEcran(Black);
    changerTailleConsole(200,40);
    dessinerCadreXY(80, 15, 120, 25, double, White, Black);
    deplacerCurseurXY(87, 18); write('##########################');
    deplacerCurseurXY(87, 19); write('#                        #');
    deplacerCurseurXY(87, 20); write('#  Beer Tunnels Battles  #');
    deplacerCurseurXY(87, 21); write('#                        #');
    deplacerCurseurXY(87, 22); write('##########################');

    dessinerChope(5, 32);

    dessinerCadreXY(97, 35, 103, 37, simple, White, Black);
    deplacerCurseurXY(90, 29); write('1 - Nouvelle partie');
    deplacerCurseurXY(90, 31); write('2 - Quitter');
    
    deplacerCurseurXY(100, 36); readln(menuIHM);
  end;

end.