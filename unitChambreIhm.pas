unit unitChambreIhm;

{$codepage utf8}
{$mode objfpc}{$H+}

interface

//Procédure que affiche l'interface de la chambre
procedure afficherInterfaceChambre();

implementation
uses
  SysUtils, Classes, unitChambre, GestionEcran, unitDormirIhm, unitCoffreLogic, unitBeersIhm,journalihm;
  

//Affichague du titre et du texte pincipal de la Chambre
procedure afficherTextePrincipalChambre();
begin
  //Entête
  dessinerCadreXY(1, 0, 198, 39, simple, LightGreen, Black);
  dessinerCadreXY(39, 1, 80, 1, double, Green, Black);
  couleurTexte(White);
  deplacerCurseurXY(53, 1); write(' Votre Chambre ');

  //Texte du hall
  couleurTexte(White);
  deplacerCurseurXY(7,4); write('Vous êtes dans votre chambre, la numéro 13, vous vous sentez agréablement à l''aise avec une douce chaleur');
  deplacerCurseurXY(5, 5); Write('et une légère odeur de mythril fondu venant de la forge située plus bas.');
  deplacerCurseurXY(7, 8); write('Vous pouvez vous reposer dans votre lit confortable.');
  deplacerCurseurXY(7, 11); Write('De l''autre côté de la pièce se trouve une armoire avec un miroir et à côté votre coffre contenant');
  deplacerCurseurXY(5, 12); write('vos armes et armure.');
end;

// Procédure qui affiche le choix des actions
procedure afficherOptionsChambre;
begin
  dessinerCadreXY(3, 25, 115, 36, double, LightGreen, Black);
  couleurTexte(White);
  deplacerCurseurXY(7, 27); Write('Que souhaitez-vous faire ?');

  deplacerCurseurXY(9, 30); Write('1/ aller Dormir z z z');
  deplacerCurseurXY(9, 31); Write('2/ Regarder votre coffre');
  deplacerCurseurXY(9, 32); Write('3/ Quitter votre chambre');
end;

// Procédure qui affiche le cadre de choix
procedure afficherCadreChoix();
begin
  dessinerCadreXY(100, 32, 110, 34, double, Red, Black);
  deplacerCurseurXY(105, 33);
end;


// Procédure qui affiche toute l'interface de la chambre
procedure afficherInterfaceChambre();
var
  choix: Integer;
begin
  changerTailleConsole(200,40);
  afficherTextePrincipalChambre();
  journal();
  afficherOptionsChambre();

  // Capture et traitement du choix de l'utilisateur
  repeat
    afficherCadreChoix();
    readln(choix);
  until (1 <= choix) and (choix <= 3);

  if (choix = 1) then afficherInterfaceDormir() // aller dormir
  else if (choix = 2) then ouvrirCoffre()// aller voir le coffre
  else if (choix = 3) then afficherInterface(); // Retour dans le hall
end;
end.
