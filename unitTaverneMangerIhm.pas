unit unitTaverneMangerIhm;

{$codepage utf8}
{$mode objfpc}{$H+}

interface
//Procèdure que affiche l'interface consommation de nourriture
procedure afficherInterfaceManger(); 
  
  
implementation

uses
  SysUtils, Classes, GestionEcran, unitTaverne, unitTaverneManger, unitBeersIhm, unitTaverneIHM, journalihm;

//Affichague du titre et du texte pincipal de la taverne
procedure afficherTextePrincipalManger();
begin
  //En-tete
  dessinerCadreXY(1, 1, 199, 39, simple, LightGreen, Black);
  dessinerCadreXY(39, 1, 80, 1, double, Green, Black);
  couleurTexte(White);
  deplacerCurseurXY(46, 1); write(' La Taverne Patte de Cochon ');

  //Texte du hall
  couleurTexte(White);
  deplacerCurseurXY(42,4); write('Aujourd''hui les plats proposer sont : ');
  couleurTexte(Yellow);
  deplacerCurseurXY(47,6); write('**************************');
  couleurTexte(white);
  deplacerCurseurXY(25,10); Write('Plats                                         Bonus        Prix : ');
  deplacerCurseurXY(25,15); write('1/Brochette de viandes de Ragondin            Résistance    18    ');
  deplacerCurseurXY(25,20); write('2/Ragôut de Cerf                              Santé         25    ');
end;


//Procedure qui affiche le choix des actions
procedure afficherOptionsManger;
begin
  dessinerCadreXY(3, 25, 115, 36, double, LightGreen, Black);
  couleurTexte(White);
  deplacerCurseurXY(7, 27); Write('Que souhaitez-vous faire ?');

  deplacerCurseurXY(9, 30); Write('?/ Commander un Plat (entrez sont numero)');
  deplacerCurseurXY(9, 31); Write('3/ En faite sa va j''ai plus très fin !!');
end;

// Procedure qui affiche le cadre de choix
procedure afficherCadreChoix();
begin
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
  repeat
    afficherCadreChoix();
    readln(choix);
  until (1 <= choix) and (choix <= 3);
  
  if (choix = 1) OR (choix = 2) then 
  begin
    gererChoixTaverneManger(choix); //Appel de la procedure manger
    afficherInterfaceTaverne();
  end
  else if (choix = 3) then afficherInterfaceTaverne(); // Retours dans la Taverne

end;
end.