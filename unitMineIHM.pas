unit unitMineIHM;
{Role: Permet d'accéder aux contrats ou au combat}
{$codepage utf8}
{$mode objfpc}{$H+}

interface
  uses
    unitMineLogic, unitContratsLogic;

 //Procédure qui affiche le tableau des récompences gagnées pour un contrat accompli
  procedure afficherRecompenses(contrat: TContrat);
  

{ Fonction qui permet au joueur de choisir entre combattre un ennemi ou quitter la mine
   Sortie:
     integer; Choix du joueur dans la mine }
  function choixMineIHM(): integer;
  
//IHM de la mine
  procedure mineIHM();

  
implementation
  uses
    SysUtils, Classes, GestionEcran, journalihm;

//Procédure qui affiche les ennemis
  procedure afficherEnnemis();
  const
    X = 48; Y = 4; // Coordonnées de l'affichage
    COULEUR_ACCOMPLI = Green;
    COULEUR_ACCEPTE  = LightGreen;
    COULEUR_ECHOUE   = Red;
    
  var
    listeContrats: TListeContrats; // Liste des contrats proposés
    couleur: integer; // Couleur d'affichage du contrat
    i: integer; // Variable de boucle
    
  begin
    // Initialisation des variables
    listeContrats := getListeContrats;
  
    for i := low(listeContrats) to high(listeContrats) do
    begin
      // Choix de la couleur d'affichage du contrat
      if listeContrats[i].statut = Accompli     then couleur := COULEUR_ACCOMPLI
      else if listeContrats[i].statut = Echoue  then couleur := COULEUR_ECHOUE
      else if listeContrats[i].statut = Accepte then couleur := COULEUR_ACCEPTE
      else  couleur := White;

      // On affiche le cadre
      dessinerCadreXY(X, Y +7*(i-1), X+22, Y+6 +7*(i-1), simple, couleur, Black);
      dessinerCadreXY(X+5, Y+1 +7*(i-1), X+16, Y+1 +7*(i-1), double, couleur, Black);

      deplacerCurseurXY(X-3, Y+1 +7*(i-1)); write(i);
      deplacerCurseurXY(X+11 - length(listeContrats[i].typeEnnemi.nom) div 2, Y+1 +7*(i-1)); write(listeContrats[i].typeEnnemi.nom);
      deplacerCurseurXY(X+2, Y+3 +7*(i-1)); write('Niveau : ', i); // Chaque ennemi a une difficulté différente
      deplacerCurseurXY(X+2, Y+4 +7*(i-1)); write('Statut : ', listeContrats[i].statut);
      deplacerCurseurXY(X+2, Y+5 +7*(i-1)); write('Ennemis tués : ', listeContrats[i].nbEnnemisTues, '/', listeContrats[i].nbEnnemis);

    end;
    couleurTexte(White);
  end;

//Procédure qui affiche le tableau des récompences gagnées pour un contrat accompli
  procedure afficherRecompenses(contrat: TContrat);
  begin
    effacerEcran();
    
    journal();

    dessinerCadreXY(35, 5, 109, 35, double, White, Black);

    // Entête
    dessinerCadreXY(50, 6, 94, 6, double, White, Black);
    deplacerCurseurXY(67, 6); write('Récompenses');

    // Liste des récompenses
    attendre(50); deplacerCurseurXY(54, 15); write('Cuivre :..........................', contrat.quantiteCuivre);
    attendre(50); deplacerCurseurXY(54, 18); write('Fer :.............................', contrat.quantiteFer);
    attendre(50); deplacerCurseurXY(54, 21); write('Mythril :.........................', contrat.quantiteMythril);
    attendre(50); deplacerCurseurXY(54, 24); write('Pieces d''or :.....................', contrat.quantiteOr);
    attendre(50); deplacerCurseurXY(54, 27); write('Experience :......................', contrat.quantiteXP);
    attendre(50); deplacerCurseurXY(54, 30); write('Appuyer sur Entrer pour fermer');
    readln;
  end;
  
  {
    Fonction qui permet au joueur de choisir entre combattre un ennemi ou quitter la mine
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
    until ((0 <= choix) and (choix <= 4));
    couleurTexte(White);

    // Sortie
    choixMineIHM := choix;
  end;

//IHM de la mine
  procedure mineIHM();
  begin
    effacerEcran();
    //Entête
    dessinerCadreXY(1, 0, 198, 39, simple, LightGreen, Black);
    dessinerCadreXY(39, 1, 80, 1, double, Green, Black);
    couleurTexte(White);

    //Affiche le titre
    deplacerCurseurXY(55, 1); write(' La Mine ');

    //Affiche les choix
    deplacerCurseurXY(20, 29); write('?/ Accepter un contrat');
    deplacerCurseurXY(20, 31); write('4/ Combattre');
    deplacerCurseurXY(20, 33); write('0/ Retourner dans le hall');

    afficherEnnemis();

    journal(); // Afficher le journal du joueur
  end;
end.
