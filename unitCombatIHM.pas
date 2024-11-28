unit unitCombatIHM;

{$mode objfpc}{$H+}

interface
  uses unitCombatConst;
  {
    IHM des combats
  }
  function combatIHM(ennemie: TEnnemie): integer;
  


implementation
  uses
    SysUtils, Classes, GestionEcran,journalihm,;
  
  {
    Fonction qui demande au joueur de choisir entre les options lors d'un tour de combat
    Sortie:
      integer; Choix du joueur lors du tour de combat
  }
  function choixCombatIHM(): integer;
  var
    choix: integer; // Choix du joueur lors du tour de combat
    
  begin
    repeat
      dessinerCadreXY(100, 32, 110, 34, double, Red, Black);
      deplacerCurseurXY(105, 33); readln(choix);
    until ((1 <= choix) and (choix <= 4));
    couleurTexte(White);
    choixCombatIHM := choix;
  end;

  {
    Procedure qui affiche l'ennemie
  }
  procedure afficherEnnemie(var ennemie: TEnnemie);
  const
    X = 50; Y = 5; // Coordonnées de l'affichage
  begin
    dessinerCadreXY(X, Y, X+21, Y+5, simple, White, Black);
    dessinerCadreXY(X+5, Y+1, X+16, Y+1, double, White, Black);
    deplacerCurseurXY(X+11 - length(ennemie.nom) div 2, Y+1); write(ennemie.nom);
    deplacerCurseurXY(X+2, Y+3); write('PV : ', ennemie.PV);

  end;

  {
    Procedure qui affiche l'action qui vient de se dérouler
  }
  procedure afficherMessageCombat(message: string);
  begin
    deplacerCurseurXY(0, 0); write(message);
    readln;
  end;

  {
    Procedure qui affiche le message d'attaque
    Parametres:
      degats: integer; Dégats infligées à l'ennemie
  }
  procedure afficherAttaque(degats: integer);
  begin
    afficherMessageCombat('Vous attaquer l''ennnemie et lui infliger ', degats, ' points de dégats.');
  end;

  {
    Procedure qui affiche le message d'attaque ratée
  }
  procedure afficherAttaqueRatee();
  begin
    afficherMessageCombat('Vous attaquer l''ennemie mais vous ratez votre attaque.');
  end;

  {
    Procedure qui affiche le message de lancer de bombe
    Parametres:
      degats: integer; Dégats infligées à l'ennemie
  }
  procedure afficherBombe(degats:integer);
  begin
    afficherMessageCombat('Vous lancer une bombe sur l''ennemie et lui infliger ', degats, ' points de dégats.')
  end;

  {
    Procedure qui affiche le message de fuite réussi
  }

  {
    Procedure qui affiche le message de fuite ratée
  }
  procedure afficherFuiteRatee();
  begin
    afficherMessageCombat('Vous tenter de fuire mais vous echouez.')
  end;

  {
    IHM des combats
  }
  function combatIHM(ennemie: TEnnemie): integer;
  begin
    dessinerCadreXY(1, 0, 198, 39, simple, White, Black);
    deplacerCurseurXY(20, 29); write('1 - Attaquer');
    deplacerCurseurXY(20, 30); write('2 - Lancer une bombe');
    deplacerCurseurXY(20, 31); write('3 - Boire une potion');
    deplacerCurseurXY(20, 32); write('4 - Fuire');

    afficherEnnemie(ennemie);
    journal();

    combatIHM := choixCombatIHM();
  end;
  
end.