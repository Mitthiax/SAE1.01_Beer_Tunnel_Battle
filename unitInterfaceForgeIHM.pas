unit unitInterfaceForgeIHM;
{Role: Permet d'afficher l'interface de la forge qui permet d'acceder au forgeront ou de quittez la forge.}
{$codepage utf8}
{$mode objfpc}{$H+}

interface
//Procédure que affiche l'interface de la forge
procedure afficherInterfaceForge(); 

implementation

uses
  SysUtils, Classes, GestionEcran, unitInterfaceForge,journalihm,unitForgeIhm;

//Affichague du titre et du texte pincipal de la forge
procedure afficherTextePrincipalForge();
begin
  //Entête
  dessinerCadreXY(1, 0, 198, 39, simple, LightGreen, Black);
  dessinerCadreXY(39, 1, 80, 1, double, Green, Black);
  couleurTexte(White);
  deplacerCurseurXY(55, 1); write(' La Forge ');

  //Texte du hall
  couleurTexte(White);
  deplacerCurseurXY(7,4);   write('Vous montez les marches menant à la forge, ici la chaleur et l''odeur des minerais fondus règnent, le bruit des enclumes');
  deplacerCurseurXY(5, 5);  Write('et les lourds chaudrons font tout le charme de cet endroit, c''est un des rares endroits où l''on peut voir le ciel');
  deplacerCurseurXY(5, 6);  write('depuis l''intérieur des mines de la Moria, c''est pourquoi on l''appelle Forgeciel.');
  deplacerCurseurXY(7, 9);  Write('Un nain tenant un marteau qui comparé à sa taille ferait plus office d''une masse, se retourne vers vous, sur son ');
  deplacerCurseurXY(5,10);  Write('vêtement un nom est brodé : Maceo.');
  couleurTexte(LightMagenta);
  deplacerCurseurXY(7, 13); write('Au nom des hauts fourneaux de Forgeciel, je vous souhaite la bienvenue mon ami. Vous trouverez en ces lieux');
  deplacerCurseurXY(5, 14); Write('tranchoires et protégeants de qualités, tant que vous n''êtes pas un pieçard et que vous avez les ressources');
  deplacerCurseurXY(5, 15); write('matérielles et financières nécessaires.');
  deplacerCurseurXY(7, 18); write('Enfin, que puis-je pour vous, mon cher ?');
end;


//Procédure qui affiche le choix des actions
procedure afficherOptionsForge;
begin
  dessinerCadreXY(3, 25, 115, 36, double, LightGreen, Black);
  couleurTexte(White);
  deplacerCurseurXY(7, 27); Write('Que souhaitez-vous faire ?');

  deplacerCurseurXY(9, 30); Write('1/ Demander un équipement au forgeront');
  deplacerCurseurXY(9, 31); Write('2/ Quitter la Forge');
end;

// Procédure qui affiche le cadre de choix
procedure afficherCadreChoix();
begin
  dessinerCadreXY(100, 32, 110, 34, double, Red, Black);
  deplacerCurseurXY(105, 33);
end;


// Procédure qui affiche toute l'interface de la forge
procedure afficherInterfaceForge();
var
  choix: Integer;
begin
  changerTailleConsole(200,40);
  afficherTextePrincipalForge();
  journal();
  afficherOptionsForge();

  // Capture et traitement du choix de l'utilisateur
    repeat
      afficherCadreChoix();
      readln(choix);
    until (1 <= choix) and (choix <= 3); // Quitter la forge et revenir dans le hall
    
      gererChoixForge(choix);
end;
end.
