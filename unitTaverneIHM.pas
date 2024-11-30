unit unitTaverneIHM;

{$codepage utf8}
{$mode objfpc}{$H+}

interface
//Procèdure que affiche l'interface de la taverne
procedure afficherInterfaceTaverne(); 
  
  
implementation

uses
  SysUtils, Classes, GestionEcran, unitTaverne,journalihm,GestionPerso,unitBeersIhm;

//Affichague du titre et du texte pincipal de la taverne
procedure afficherTextePrincipalTaverne();
begin
  //En-tete
  dessinerCadreXY(1, 1, 199, 39, simple, LightGreen, Black);
  dessinerCadreXY(39, 1, 80, 1, double, Green, Black);
  couleurTexte(White);
  deplacerCurseurXY(46, 1); write(' La Taverne Patte de Cochon ');

  //Texte du hall
  couleurTexte(White);
  deplacerCurseurXY(7,4); write('Vous entrez dans la taverne, des que vous pousser la porte vous pouvez sentir la douce odeur d''alcool qui s''en ');
  deplacerCurseurXY(5, 5); Write('émane, vous entendez des rires et bruit de chop qui se pose sur les tables de la taverne.');
  deplacerCurseurXY(5, 8); write('Vous vous diriger vers le comptoir, vous constater que le border collie du tavernier est allongé devant la cheminer');
  deplacerCurseurXY(7, 9); Write('sur son collier on peut lire falladar.');
  couleurTexte(LightMagenta);
  deplacerCurseurXY(7, 12); write('Bonjour mon Gaillard ! Bienvenue à la Patte de Cochon, mon nom est Jimmy, ici on a de la bière pour les assoiffés');
  deplacerCurseurXY(5, 13); Write('et de la nourriture pour les affamés HaHa.');
  deplacerCurseurXY(7, 16); write('Que puis-je pour vous mon brave ?');
end;




//Procedure qui affiche le choix des actions
procedure afficherOptionsTaverne;
begin
  dessinerCadreXY(3, 25, 115, 36, double, LightGreen, Black);
  couleurTexte(White);
  deplacerCurseurXY(7, 27); Write('Que souhaitez-vous faire ?');

  deplacerCurseurXY(9, 30); Write('1/ Boire une Biere Fraiche');
  deplacerCurseurXY(9, 31); Write('2/ Casser la croute');
  deplacerCurseurXY(9, 32); Write('3/ Quittez la Taverne (Ps : Reviens vite !!)');
  dessinerCadreXY(100, 32, 110, 34, double, Red, Black);
  deplacerCurseurXY(105, 33);
end;


// Procédure qui affiche toute l'interface de la taverne
procedure afficherInterfaceTaverne();
var
  choix: Integer;
begin
  //Empêche les gens du nom d'alexian de rentrer dans la taverne(fallait pas manger tout les pancakes)
  if getnom()<>'Alexian' then
  begin
    changerTailleConsole(200,40);
    afficherTextePrincipalTaverne();
    journal();
    afficherOptionsTaverne();

    // Capture et traitement du choix de l'utilisateur
    repeat
      readln(choix);
      gererChoixTaverne(choix);
    until (choix = 3); // Quitter la taverne et revenir au hall
  end
  
  else
  begin
    couleurTexte(White);
    deplacerCurseurXY(9,35);Write('Vous êtes banni de la taverne vous ne pouvez pas y rentrer');
    readln;
    afficherInterface();
  end;
end;
end.