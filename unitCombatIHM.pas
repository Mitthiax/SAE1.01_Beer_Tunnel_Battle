unit unitCombatIHM;
{Role: Permet de combattre des ennemis.}
{$codepage utf8}
{$mode objfpc}{$H+}

{$WARN 4104 OFF}
{$WARN 4105 OFF}

interface
  uses unitCombatConst;
  
  //IHM des combats
  function combatIHM(ennemie: TEnnemie): integer;

  {
    Procedure qui affiche le message d'attaque
    Parametres:
      degats: integer; Dégats infligées à l'ennemie
      nomEnnemie: integer; Nom de l'ennemie
  }
  procedure afficherAttaque(degats: integer; nomEnnemie: string);

  {
    Procedure qui affiche le message d'attaque de l'ennemie
    Parametres:
      degats: integer; Dégats subits
      nomEnnemie: integer; Nom de l'ennemie
  }
  procedure afficherAttaqueEnnemie(degats: integer; nomEnnemie: string);


  {
    Procedure qui affiche le message de lancer de bombe
    Parametres:
      degats: integer; Dégats infligées à l'ennemie
      nomEnnemie: integer; Nom de l'ennemie
  }
  procedure afficherBombe(degats: integer; nomEnnemie: string);

  //Procedure qui affiche le message quand le joueur n'as plus de bombe
  procedure afficherBombeVide();

  //Procedure qui affiche le message de boire une potion
  procedure afficherPotion();

  //Procedure qui affiche le message quand le joueur n'as plus de potion
  procedure afficherPotionVide();

  //Procedure qui affiche le message de fuite réussi
  procedure afficherFuite();

  {
    Procedure qui affiche le message de fuite ratée
    Parametres:
      nomEnnemie: integer; Nom de l'ennemie
  }
  procedure afficherFuiteRatee(nomEnnemie: string);

  {
    Procedure qui affiche le tableau des récompenes gagnéss
    Parametres:
      cuivreGagne    : integer; Cuivre gagné par le joueur
      ferGagne       : integer; Fer gagné par le joueur
      mythrilGagne   : integer; Mythril gagné par le joueur
      monnaieGagne   : integer; Monnaie gagnée par le joueur
      experienceGagne: integer; Experience gagnée par le joueur
  }
  procedure afficherRecompensesCombat(cuivreGagne, ferGagne, mythrilGagne, monnaieGagne, experienceGagne: integer);
  




implementation
  uses
    SysUtils, Classes, GestionEcran,journalihm;

  {
    Procedure qui affiche l'ennemie
    Parametres:
      ennemie: TEnnemie; Ennemie du combat
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

  //Procedure qui affiche l'action qui vient de se dérouler
  procedure afficherMessageCombat(message: string);
  begin
    // Effacer le cadre de choix et la ligne
    dessinerCadreXY(100, 32, 110, 34, double, Black, Black);
    deplacerCurseurXY(70, 32); write('                                                                        ');
    
    couleurTexte(White);
    deplacerCurseurXY(70, 32); write(message);
    readln;
  end;

  {
    Procedure qui affiche le message d'attaque
    Parametres:
      degats: integer; Dégats infligées à l'ennemie
      nomEnnemie: integer; Nom de l'ennemie
  }
  procedure afficherAttaque(degats: integer; nomEnnemie: string);
  begin
    if degats = 0 then afficherMessageCombat('Vous attaquez l''ennnemie mais il esquive votre attaque')
    else afficherMessageCombat('Vous attaquez ' + nomEnnemie + ' et lui infligez ' + intToStr(degats) + ' points de dégats.');
  end;

  {
    Procedure qui affiche le message d'attaque de l'ennemie
    Parametres:
      degats: integer; Dégats subits
      nomEnnemie: integer; Nom de l'ennemie
  }
  procedure afficherAttaqueEnnemie(degats: integer; nomEnnemie: string);
  begin
    if degats = 0 then afficherMessageCombat(nomEnnemie + ' vous attaque mais vous réussissez à éviter l''attaque')
    else
    begin
      journal();
      afficherMessageCombat(nomEnnemie + ' vous attaque et vous inflige ' + intToStr(degats) + ' points de dégats.');
    end;
  end;

  {
    Procedure qui affiche le message de lancer de bombe
    Parametres:
      degats: integer; Dégats infligées à l'ennemie
      nomEnnemie: integer; Nom de l'ennemie
  }
  procedure afficherBombe(degats: integer; nomEnnemie: string);
  begin
    afficherMessageCombat('Vous lancez une bombe sur ' + nomEnnemie + ' et lui infligez ' + intToStr(degats) + ' points de dégats.');
  end;

  //Procedure qui affiche le message quand le joueur n'as plus de bombe
  procedure afficherBombeVide();
  begin
    afficherMessageCombat('Vous voulez lancez une bombe mais vous n''en plus.');
  end;

  //Procedure qui affiche le message de boire une potion
  procedure afficherPotion();
  begin
    afficherMessageCombat('Vous buvez une potion qui vous fait regagner tous vos points de vie.');
    journal();
  end;

  //Procedure qui affiche le message quand le joueur n'as plus de potion
  procedure afficherPotionVide();
  begin
    afficherMessageCombat('Vous voulez lancez une bombe mais vous n''en plus.');
  end;

  //Procedure qui affiche le message de fuite réussi
  procedure afficherFuite();
  begin
    afficherMessageCombat('Vous parvenez à vous enfuire et rejoingnez le hall.');
  end;

  {
    Procedure qui affiche le message de fuite ratée
    Parametres:
      nomEnnemie: integer; Nom de l'ennemie
  }
  procedure afficherFuiteRatee(nomEnnemie: string);
  begin
    afficherMessageCombat('Vous tentez de fuire mais vous echouez, ' + nomEnnemie + ' vous attaque.');
  end;

  {
    Procedure qui affiche le tableau des récompenes gagnéss
    Parametres:
      cuivreGagne    : integer; Cuivre gagné par le joueur
      ferGagne       : integer; Fer gagné par le joueur
      mythrilGagne   : integer; Mythril gagné par le joueur
      monnaieGagne   : integer; Monnaie gagnée par le joueur
      experienceGagne: integer; Experience gagnée par le joueur
  }
  procedure afficherRecompensesCombat(cuivreGagne, ferGagne, mythrilGagne, monnaieGagne, experienceGagne: integer);
  begin
    effacerEcran();
    
    journal();

    dessinerCadreXY(35, 5, 109, 35, double, White, Black);

    // Entete
    dessinerCadreXY(50, 6, 94, 6, double, White, Black);
    deplacerCurseurXY(67, 6); write('Recompenses');

    // Liste des récompenses
    attendre(50); deplacerCurseurXY(54, 15); write('Cuivre :..........................', cuivreGagne);
    attendre(50); deplacerCurseurXY(54, 18); write('Fer :.............................', ferGagne);
    attendre(50); deplacerCurseurXY(54, 21); write('Mythril :.........................', mythrilGagne);
    attendre(50); deplacerCurseurXY(54, 24); write('Pieces d''or :.....................', monnaieGagne);
    attendre(50); deplacerCurseurXY(54, 27); write('Experience :......................', experienceGagne);
    readln;
  end;
  
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

  //IHM des combats
  function combatIHM(ennemie: TEnnemie): integer;
  begin
    effacerEcran();
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
