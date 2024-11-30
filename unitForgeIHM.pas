unit unitForgeLogic;

{$mode objfpc}{$H+}

interface
  {
    IHM de la forge
  }
  procedure forgeIHM();
  
implementation
uses
  SysUtils, Classes, unitForgeLogic, unitCoffreConst;
  

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
    // ils y donc les fonctions equipementAchetable, equipementAchete, et getPrix
    // Tu peux aller voir unitCoffreIHM si tu veux
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
    readln(choix);
  end;
end.