unit unitMineIHM;

{$codepage utf8}
{$mode objfpc}{$H+}

interface
  uses
    unitMineLogic, unitContratsLogic;

  {
    Procedure qui affiche le tableau des récompenes gagnés pour un contrat accompli
  }
  procedure afficherRecompenses(contrat: TContrat);
  
  {
    Fonction qui permet au joueur de choisir entre combattre un ennemie ou quitter la mine
    Sortie:
      integer; Choix du joueur dans la mine
  }
  function choixMineIHM(): integer;
  
  {
    IHM de la mine
  }
  procedure mineIHM();




  
implementation
  uses
    SysUtils, Classes, GestionEcran, journalihm;

  {
    Procedure qui affiche les ennemies
  }
  procedure afficherEnnemies();
  const
    X = 50; Y = 5; // Coordonnées de l'affichage
    
  var
    listeContrats: TListeContrats; // Liste des contrats proposés
    i: integer; // Variable de boucle
    
  begin
    // Initialisation des variables
    listeContrats := getListeContrats;
  
    for i := low(listeContrats) to high(listeContrats) do
    begin
      deplacerCurseurXY(X-3, Y+1 +7*(i-1)); write(i);
      dessinerCadreXY(X, Y +7*(i-1), X+21, Y+5 +7*(i-1), simple, White, Black);
      dessinerCadreXY(X+5, Y+1 +7*(i-1), X+16, Y+1 +7*(i-1), double, White, Black);
      deplacerCurseurXY(X+11 - length(listeContrats[i].typeEnnemie.nom) div 2, Y+1 +7*(i-1)); write(listeContrats[i].typeEnnemie.nom);
      deplacerCurseurXY(X+2, Y+3 +7*(i-1)); write('Ennemies tués : ', listeContrats[i].nbEnnemiesTues, '/', listeContrats[i].nbEnnemies);
    end;
  end;

  {
    Procedure qui affiche le tableau des récompenes gagnés pour un contrat accompli
  }
  procedure afficherRecompenses(contrat: TContrat);
  begin
    effacerEcran();
    
    journal();

    dessinerCadreXY(35, 5, 109, 35, double, White, Black);

    // Entete
    dessinerCadreXY(50, 6, 94, 6, double, White, Black);
    deplacerCurseurXY(67, 6); write('Recompenses');

    // Liste des récompenses
    attendre(50); deplacerCurseurXY(54, 15); write('Cuivre :..........................', contrat.quantiteCuivre);
    attendre(50); deplacerCurseurXY(54, 18); write('Fer :.............................', contrat.quantiteFer);
    attendre(50); deplacerCurseurXY(54, 21); write('Mythril :.........................', contrat.quantiteMythril);
    attendre(50); deplacerCurseurXY(54, 24); write('Pieces d''or :.....................', contrat.quantiteOr);
    attendre(50); deplacerCurseurXY(54, 27); write('Experience :......................', contrat.quantiteXP);
    readln;
  end;
  
  {
    Fonction qui permet au joueur de choisir entre combattre un ennemie ou quitter la mine
    Sortie:
      integer; Choix du joueur dans la mine
  }
  function choixMineIHM(): integer;
  var
    choix: integer; // Choix du joueur dans la mine
    
  begin
    repeat
      dessinerCadreXY(100, 32, 110, 34, double, Red, Black);
      deplacerCurseurXY(105, 33); readln(choix);
    until ((0 <= choix) and (choix <= 3));
    couleurTexte(White);

    // Sortie
    choixMineIHM := choix;
  end;

  {
    IHM de la mine
  }
  procedure mineIHM();
  begin
    effacerEcran();
    //En-tete
    dessinerCadreXY(1, 1, 199, 39, simple, LightGreen, Black);
    dessinerCadreXY(39, 1, 80, 1, double, Green, Black);
    couleurTexte(White);

    //Affiche le titre
    deplacerCurseurXY(55, 1); write(' La Mine ');

    //Affiche les choix
    deplacerCurseurXY(20, 29); write('?/ Combattre');
    deplacerCurseurXY(20, 32); write('0/ Retourner au hall');

    afficherEnnemies();

    journal(); // Afficher le journal du joueur
  end;
end.
