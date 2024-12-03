unit unitDormirIhm;
{Role: Permet d'afficher la chambre et de dormir.}
{$codepage utf8}
{$mode objfpc}{$H+}

interface

//Affiche l'interface de la chambre pour dormir
procedure afficherInterfaceDormir();
  
implementation
  
uses
  SysUtils, Classes, unitDormir, unitBeersIhm, unitChambreIhm, GestionPerso, GestionEcran, unitDate,journalihm,gestionbuff;

//Affichague du titre et du texte pincipal de la taverne
procedure afficherTextePrincipalDormir();
begin
  //En-tete
  dessinerCadreXY(1, 0, 198, 39, simple, LightGreen, Black);
  dessinerCadreXY(39, 1, 80, 1, double, Green, Black);
  couleurTexte(White);

  //Affiche le titre
  deplacerCurseurXY(52, 1); write(' Votre Chambre ');

// Dessin du lit avec une personne allongée
  deplacerCurseurXY(30, 18); write('|                      ');
  deplacerCurseurXY(30, 19); write('|         ____________|');
  deplacerCurseurXY(30, 20); write('|________|____________|');
  deplacerCurseurXY(30, 21); write('|                     |');
  deplacerCurseurXY(30, 22); write('|                     |');

  // Dessin des grands Z pour le sommeil
  deplacerCurseurXY(30, 10); write('   ZZZ');
  deplacerCurseurXY(32, 11); write('  ZZZ');
  deplacerCurseurXY(34, 12); write(' ZZZ');
end;


//Procedure qui affiche le choix des actions
procedure afficherOptionsDormir();
begin
  dessinerCadreXY(3, 25, 115, 36, double, LightGreen, Black);
  couleurTexte(White);
  deplacerCurseurXY(9, 31); Write('1/ Se réveiller');
  dessinerCadreXY(100, 32, 110, 34, double, Red, Black);
  deplacerCurseurXY(105, 33);
end;

// Procedure qui affiche le cadre de choix
procedure afficherCadreChoix();
begin
  dessinerCadreXY(100, 32, 110, 34, double, Red, Black);
  deplacerCurseurXY(105, 33);
end;



//Procèdure que affiche l'interface de la chambre
procedure afficherInterfaceDormir(); 
var
  choix: Integer;
begin
  changerTailleConsole(200,40);
  afficherTextePrincipalDormir();
  journal();
  afficherOptionsDormir();

  // Capture et traitement du choix de l'utilisateur
  repeat
    afficherCadreChoix();
    readln(choix);
  until (choix = 1);
  
  gererChoixDormir(); //Procedure qui permet d'arrêter de dormir
  resetBuffs(); //Remet a zero les buffs apres avoir dormir
  afficherInterfaceChambre(); // Revenir à la chambre après avoir fini de dormir
  end;
  
  
end.
