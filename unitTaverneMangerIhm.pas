unit unitTaverneMangerIhm;
{Role: Permet d'afficher la nourriture de la Taverne, le joueur peut ainsi manger deux plat qui lui accorde differents buffs.}
{$codepage utf8}
{$mode objfpc}{$H+}

interface
//Procédure qui affiche l'interface de consommation de nourriture
procedure afficherInterfaceManger(); 
  
  
implementation

uses
  SysUtils, Classes, GestionEcran, unitTaverne, unitTaverneManger, unitBeersIhm, unitTaverneIHM, journalihm;

//Affichage du titre et du texte principal de la nourriture de la taverne
procedure afficherTextePrincipalManger();
begin
  //Entête
  dessinerCadreXY(1, 0, 198, 39, simple, LightGreen, Black);
  dessinerCadreXY(39, 1, 80, 1, double, Green, Black);
  couleurTexte(White);
  deplacerCurseurXY(46, 1); write(' La Taverne Patte de Cochon ');

  //Texte des plats proposés
  couleurTexte(White);
  deplacerCurseurXY(42,4); write('Aujourd''hui les plats proposés sont :');
  couleurTexte(Yellow);
  deplacerCurseurXY(47,6); write('**************************');
  couleurTexte(white);
  deplacerCurseurXY(25,10); Write('Plats                                         Bonus         Prix : ');
  deplacerCurseurXY(25,15); write('1/Brochette de viande de Ragondin             Résistance    18 Pièces d''Or');
  deplacerCurseurXY(25,20); write('2/Ragôut de Cerf                              Santé         25 Pièces d''Or');
end;


//Procédure qui affiche le choix des actions
procedure afficherOptionsManger;
begin
  dessinerCadreXY(3, 25, 115, 36, double, LightGreen, Black);
  couleurTexte(White);
  deplacerCurseurXY(7, 27); Write('Que souhaitez-vous faire ?');

  deplacerCurseurXY(9, 30); Write('?/ Commander un Plat (entrer son numéro)');
  deplacerCurseurXY(9, 31); Write('3/ En fait ça va je n''ai plus très faim !!');

  //Encadrement pour répondre
  dessinerCadreXY(100, 32, 110, 34, double, Red, Black);
  deplacerCurseurXY(105, 33);
end;


// Procédure qui affiche toute l'interface de la consommation de nourriture
procedure afficherInterfaceManger();
var
  choix: Integer;
begin
  afficherTextePrincipalManger();
  journal();
  afficherOptionsManger();

  // Capture et traitement du choix de l'utilisateur
readln(choix);
  if (choix = 1) OR (choix = 2) then //Appel de la procedure manger
  begin
  gererChoixTaverneManger(choix); 
  afficherInterfaceTaverne();
  end
  else if (choix = 3) then afficherInterfaceTaverne(); // Retour dans la Taverne

end;
end.
