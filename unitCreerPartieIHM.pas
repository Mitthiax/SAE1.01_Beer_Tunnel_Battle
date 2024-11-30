unit unitCreerPartieIHM;

{$codepage utf8}
{$mode objfpc}{$H+}

interface
  
  // Procedure qui affiche l'interface de création d'une nouvelle partie
  procedure creerPartieIHM(var nom:string; var taille:integer; var genre:string);
  
implementation
  uses
    GestionEcran, unitCoffreLogic;

  // Procedure qui affiche l'interface de création d'une nouvelle partie
  procedure creerPartieIHM(var nom:string; var taille:integer; var genre:string);
  var
    choixGenre: integer; // Choix du genre du joueur lors de la creation de la partie

  begin
    //En-tete
    dessinerCadreXY(1, 0, 198, 39, simple, White, Black);
    dessinerCadreXY(80, 0, 120, 2, simple, White, Black);
    dessinerCadreXY(90, 1, 110, 3, simple, White, Black);
    deplacerCurseurXY(93, 2); write('Nouvelle partie');

    //Introduction
    deplacerCurseurXY(47,4); write('Vous ouvrez lentement les yeux, le cocher hurle que vous arrivez bientôt au mine de la Moria, à bord de la');
    deplacerCurseurXY(49,5); write('charrette vous voyez les autres voyageurs se réveiller.');
    deplacerCurseurXY(47,8); write('Voilà plusieurs jours que votre caravane est en route pour la Moria, pour votre nouvelle vie.');                           
    deplacerCurseurXY(47,11); write('Vous venez d''un petit village où Hobbit et nain voulant vivre loin des montagnes vivaient en harmonie,');
    deplacerCurseurXY(49,12); write('mais vous vous êtes fait rejeter violemment par votre amour de jeunesse et avez fui le village.');
    deplacerCurseurXY(47,15); write('Désormais vous êtes en quête de sens à votre vie et prenez la route vers la terre de vos ancêtres afin');
    deplacerCurseurXY(49,16); write('d''y devenir un mercenaire appâter par l''appel du gain.'); 
    deplacerCurseurXY(47,19); write('Pourtant tout cela ne risque pas d''être un travail facile, ces mines ont la malheureuse réputation');
    deplacerCurseurXY(49,20); write('d''être mortelle pour les aventuriers non avertis, Gobelin, troll, orc.');

    //Choix
    dessinerCadreXY(2, 25, 197, 36, double, LightGreen, Black);
    couleurTexte(White);
    deplacerCurseurXY(70, 27); write('Quel est votre nom ? : '); readln(nom);
    deplacerCurseurXY(70, 30); write('Quel est votre taille ? (en cm) : '); readln(taille);
    deplacerCurseurXY(70, 33); write('Quel est votre Genre ? (1) Homme, (2) Femme, (3) Autre : '); readln(choixGenre);
    
    while (choixGenre < 1) or (3 < choixGenre) do
    begin
      // Effacer la ligne pour ne pas voir la réponse précédente
      deplacerCurseurXY(127, 14); write('                                                                       ');
      deplacerCurseurXY(127, 14); readln(choixGenre);
    end;

    case choixGenre of
      1: genre := 'Homme';
      2: genre := 'Femme';
      3: genre := 'Autre';
    end;
  end;
  
end.