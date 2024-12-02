unit unitForgeIHM;

{$codepage utf8}
{$mode objfpc}{$H+}

interface
  
  //IHM de la forge
  procedure forgeIHM();

  {
    Fonction qui affiche la case pour le choix du joueur et retourne sont choix
    Sortie:
      integer; Choix du joueur parmi les équipements et quitter
  }
  function choixForgeIHM(): integer;





implementation
  uses
    SysUtils, Classes, unitForgeLogic, unitCoffreConst, journalihm, GestionEcran;

  const
    COULEUR_POSSEDE       = White;
    COULEUR_ACHETABLE     = LightGreen;
    COULEUR_NON_ACHETABLE = Red;

  {
    Procedure qui affiche la liste des armes
  }
  procedure afficherArmesForge();
  const
    X = 10; Y = 5; // Coordonnées de l'affichage

  var
    i: integer; // Variable de boucle

  begin
    deplacerCurseurXY(X, Y); write('--- Les armes ---');
    for i := 1 to 6 do
    begin
      // Si déjà possédé, on affiche le nom et 'Déjà possédé'
      if equipementPossede(i) then
      begin
        couleurTexte(COULEUR_POSSEDE);
        deplacerCurseurXY(X,      Y + i*2); write(i, ' -  ', listeEquipement[i].nom);
        deplacerCurseurXY(X + 27, Y + i*2); write('-> Déjà possédé');
      end

      // Sinon, on choisi la couleur et affiche le nom et le prix
      else
      begin
        // Choix de la couleur des équipements achetables et non achetables
        if equipementAchetable(i) then couleurTexte(COULEUR_ACHETABLE)
        else couleurTexte(COULEUR_NON_ACHETABLE);
        
        // Affichage du nom et du prix
        deplacerCurseurXY(X,      Y + i*2); write(i, ' -  ', listeEquipement[i].nom);
        deplacerCurseurXY(X + 27, Y + i*2); write('-> ', listeEquipement[i].prix, ' ', listeEquipement[i].materiau, ', ', listeEquipement[i].prixOr, ' Or');
      end;
    end;
  end;

  {
    Procedure qui affiche la liste des armures
  }
  procedure afficherArmuresForge();
  const
    X = 75; Y = 5; // Coordonnées de l'affichage

  var
    i: integer; // Variable de boucle

  begin
    couleurTexte(White);
    deplacerCurseurXY(X, Y); write('--- Les pièces d''armure ---');

    for i := 7 to 18 do
    begin
      // Si déjà possédé, on affiche en vert le nom et 'Déjà possédé'
      if equipementPossede(i) then
      begin
        couleurTexte(COULEUR_POSSEDE);
        deplacerCurseurXY(X,      Y + i*2 - 12); write(i, ' -  ', listeEquipement[i].nom);
        deplacerCurseurXY(X + 27, Y + i*2 - 12); write('-> Déjà possédé');
      end

      // Sinon, on choisi la couleur et affiche le nom et le prix
      else
      begin
        // Choix de la couleur des équipement achetable et non achetable
        if equipementAchetable(i) then couleurTexte(COULEUR_ACHETABLE)
        else couleurTexte(COULEUR_NON_ACHETABLE);
        
        // Affichage du nom et du prix
        deplacerCurseurXY(X,      Y + i*2 - 12); write(i, ' -  ', listeEquipement[i].nom);
        deplacerCurseurXY(X + 27, Y + i*2 - 12); write('-> ', listeEquipement[i].prix, ' ', listeEquipement[i].materiau, ', ', listeEquipement[i].prixOr, ' Or');
      end;
    end;
  end;

  //Procedure qui affiche le choix des actions
  procedure afficherOptionsForge();
    begin
      dessinerCadreXY(3, 25, 60, 36, double, LightGreen, Black);
      couleurTexte(White);
      deplacerCurseurXY(7, 27); Write('Que souhaitez-vous faire ?');

      deplacerCurseurXY(9, 30); Write('?/ Choisir un équipement à acheter');
      deplacerCurseurXY(9, 32); Write('0/ Quitter la forge');
    end;

  {
    IHM de la forge
  }
  procedure forgeIHM();
  begin
    effacerEcran(); 

    // Entête
    dessinerCadreXY(0, 0, 199, 39, simple, LightGreen, Black);
    dessinerCadreXY(39, 1, 80, 1, double, Green, Black);
    couleurTexte(White);

    // Affiche le titre
    deplacerCurseurXY(55, 1); write(' La Forge ');

    // Afficher la liste de armes et armures
    afficherArmesForge();
    afficherArmuresForge();
    
    // Afficher les option de la forge
    afficherOptionsForge();

    // Affichager le journal du joueur
    journal();
  end;

  {
    Fonction qui affiche la case pour le choix du joueur et retourne sont choix
    Sortie:
      integer; Choix du joueur parmi les équipements et quitter
  }
  function choixForgeIHM(): integer;
  var
    choix: integer; // Choix du joueur parmi les équipements et quitter
  begin
    // On redemande jusqu'a ce que le choix soit valide
    repeat
      dessinerCadreXY(40, 32, 50, 34, double, Red, Black);
      deplacerCurseurXY(45, 33); readln(choix);
    until (0 <= choix) and (choix <= 18);
    couleurTexte(White);

    choixForgeIHM := choix;
  end;
end.
