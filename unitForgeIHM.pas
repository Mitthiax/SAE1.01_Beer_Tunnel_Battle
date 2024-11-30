unit unitForgeIHM;

{$mode objfpc}{$H+}

interface
  {
    IHM de la forge
  }
  procedure forgeIHM();
  function choixForgeIHM(): integer;
implementation
uses
  SysUtils, Classes, unitForgeLogic, unitCoffreConst,GestionEcran;
  

  {
    Pocedure qui affiche le message d'entrée dans la forge
  }
  procedure forgeMessage();
  begin
    effacerEcran();
    deplacerCurseurXY(0, 0); write('entrer dans forge');
    readln;
  end;

  {
    IHM de la forge
  }
  procedure forgeIHM();
  begin
    forgeMessage();

    // Seulement cette procedure et choixForgeIHM sont appelées
    // Pour l'IHM, je propose de faire comme le prof, des couleur pour savoir ce qui est achetable et deja équipé,
    // ils y donc les fonctions equipementAchetable, equipementAchete
    // Tu peux aller voir unitCoffreIHM si tu veux pour voir comment avoir les prix
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
        dessinerCadreXY(100, 32, 110, 34, double, Red, Black);
        deplacerCurseurXY(105, 33); readln(choix);
    until (0 <= choix) and (choix <= 18);
    couleurTexte(White);

    choixForgeIHM := choix;
  end;
end.