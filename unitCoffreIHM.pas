unit unitCoffreIHM;
{Role: Permet d'afficher le coffre.}
{$codepage utf8}
{$mode objfpc}{$H+}

interface
  {
    IHM du coffre
    Sortie:
      integer; Choix du joueur dans le coffre
  }
  procedure coffreIHM();

  {
    IHM du choix d'équipement dans le coffre
    Sortie:
      integer; Choix du joueur dans le coffre
  }
  function coffreChoixEquipementIHM():integer;
  



  
implementation
  uses
    GestionEcran, unitCoffreConst, unitCoffreLogic, journalihm;

  const
    COULEUR_POSSEDE     = White;
    COULEUR_EQUIPE      = LightGreen;
    COULEUR_NON_POSSEDE = Red;

  //Procedure qui affiche la liste des armes
  procedure afficherArmes();
  const
    X = 10; Y = 5; // Coordonnées de l'affichage

  var
    i: integer; // Variable de boucle

  begin
    deplacerCurseurXY(X, Y); write('--- Vos armes ---');
    for i := 1 to 6 do
    begin
      // Choix de la couleur d'affichage des équipements équipés, possédés et non possédés
      if estEquipe(i) then couleurTexte(COULEUR_EQUIPE)
      else if estDisponibleEquipement(i) then couleurTexte(COULEUR_POSSEDE)
      else couleurTexte(COULEUR_NON_POSSEDE);
      
      // Affichage du nom et des points d'attaque
      deplacerCurseurXY(X,      Y + i*2); write(i, ' -  ', listeEquipement[i].nom);
      deplacerCurseurXY(X + 27, Y + i*2); write('-> ', listeEquipement[i].points, ' attaque');
    end;
  end;

  //Procedure qui affiche la liste des pièces d'armure
  procedure afficherArmures();
  const
    X = 75; Y = 5; // Coordonnées de l'affichage

  var
    i: integer; // Variable de boucle

  begin
    couleurTexte(White);
    deplacerCurseurXY(X, Y); write('--- Vos pièces d''armure ---');

    for i := 7 to 18 do
    begin
      // Choix de la couleur d'affichage des équipements équipés, possédés et non possédés
      if estEquipe(i) then couleurTexte(COULEUR_EQUIPE)
      else if estDisponibleEquipement(i) then couleurTexte(COULEUR_POSSEDE)
      else couleurTexte(COULEUR_NON_POSSEDE);
        
      // Affichage du nom et des points d'attaque
      deplacerCurseurXY(X,      Y + i*2 - 12); write(i, ' -  ', listeEquipement[i].nom);
      deplacerCurseurXY(X + 27, Y + i*2 - 12); write('-> ', listeEquipement[i].points, ' défense');
    end;
  end;

  //Procedure qui affiche le choix des actions
  procedure afficherOptionsCoffre();
    begin
      dessinerCadreXY(3, 25, 60, 36, double, LightGreen, Black);
      couleurTexte(White);
      deplacerCurseurXY(7, 27); Write('Que souhaitez-vous faire ?');

      deplacerCurseurXY(9, 30); Write('?/ Choisir un équipement à équiper ou déséquiper');
      deplacerCurseurXY(9, 32); Write('0/ Quitter le Coffre');
    end;

  //IHM du coffre
  procedure coffreIHM();
  begin
    effacerEcran();

    // Entête
    dessinerCadreXY(1, 0, 198, 39, simple, LightGreen, Black);
    dessinerCadreXY(39, 1, 80, 1, double, Green, Black);
    couleurTexte(White);

    // Afficher le titre
    deplacerCurseurXY(53, 1); write(' Votre Coffre ');

    // Afficher la liste de armes et armures
    afficherArmes();
    afficherArmures();
    
    // Afficher les option du coffre
    afficherOptionsCoffre();

    // Affichager le journal du joueur
    journal();
  end;

  {
    Fonction qui affiche la case pour le choix du joueur et retourne sont choix
    Sortie:
      integer; Choix du joueur parmi les équipements et quitter
  }
  function coffreChoixEquipementIHM():integer;
  var
    choix: integer; // Choix du joueur parmi les équipements et quitter
  begin
    // On redemande jusqu'a ce que le choix soit valide
    repeat
      dessinerCadreXY(40, 32, 50, 34, double, Red, Black);
      deplacerCurseurXY(45, 33); readln(choix);
    until (0 <= choix) and (choix <= 18);
    couleurTexte(White);
    
    coffreChoixEquipementIHM := choix
  end;
  
end.
