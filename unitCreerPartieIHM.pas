unit unitCreerPartieIHM;
{Role: Permet d'afficher le lancement d'une partie et de rentrer les informations demander.}
{$codepage utf8}
{$mode objfpc}{$H+}

interface
  
  // Procédure qui affiche l'interface de création d'une nouvelle partie
  procedure creerPartieIHM(var nom:string; var taille:integer; var genre:string);
  
implementation
  uses
    GestionEcran, unitCoffreLogic;

  // Procédure qui affiche l'interface de création d'une nouvelle partie
  procedure creerPartieIHM(var nom:string; var taille:integer; var genre:string);
  var
    choixGenre: integer; // Choix du genre du joueur lors de la creation de la partie

  begin
    //Entête
    dessinerCadreXY(1, 0, 198, 39, simple, White, Black);
    dessinerCadreXY(80, 0, 120, 2, simple, White, Black);
    dessinerCadreXY(90, 1, 110, 3, simple, White, Black);
    deplacerCurseurXY(93, 2); write('Nouvelle partie');

    //Introduction
    deplacerCurseurXY(47,4);  write('Vous ouvrez lentement les yeux, le cocher hurle que vous arrivez bientôt aux mines de la Moria, à bord de la');
    deplacerCurseurXY(49,5);  write('charrette vous voyez les autres voyageurs se réveiller.');
    deplacerCurseurXY(47,8);  write('Voilà plusieurs jours que votre caravane est en route pour la Moria, pour votre nouvelle vie.');                           
    deplacerCurseurXY(47,11); write('Vous venez d''un petit village où Hobbits et nains voulant vivre loin des montagnes vivaient en harmonie,');
    deplacerCurseurXY(49,12); write('mais vous vous êtes fait rejeter violemment par votre amour de jeunesse et avez fui le village.');
    deplacerCurseurXY(47,15); write('Désormais vous cherchez un sens à la vie et prenez la route vers la terre de vos ancêtres afin');
    deplacerCurseurXY(49,16); write('d''y devenir un mercenaire appâté par l''appel du gain.'); 
    deplacerCurseurXY(47,19); write('Pourtant tout cela ne risque pas d''être un travail facile, ces mines ont la fâcheuse réputation');
    deplacerCurseurXY(49,20); write('d''être mortelles pour les aventuriers non avertis, Gobelins, trolls, orc.');

    //Choix
    dessinerCadreXY(2, 25, 197, 36, double, LightGreen, Black);
    couleurTexte(White);
    deplacerCurseurXY(70, 27); write('Quel est votre nom ? : '); readln(nom);
    deplacerCurseurXY(70, 30); write('Quel est votre taille ? (en cm) : '); readln(taille);
    deplacerCurseurXY(70, 33); write('Êtes-vous ? (1) Homme, (2) Femme, (3) Autre : '); readln(choixGenre);
    
    while (choixGenre < 1) or (3 < choixGenre) do
    begin
      // Effacer la ligne pour ne pas voir la réponse précédente
      deplacerCurseurXY(70, 33); write('                                                                      ');
      deplacerCurseurXY(70, 33); readln(choixGenre);
    end;

    case choixGenre of
      1: genre := 'Homme';
      2: genre := 'Femme';
      3: genre := 'Autre';
    end;
  end;
  
end.
