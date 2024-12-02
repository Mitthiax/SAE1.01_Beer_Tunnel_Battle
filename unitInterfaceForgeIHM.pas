unit unitInterfaceForgeIHM;

{$mode objfpc}{$H+}

interface
//Procèdure que affiche l'interface de la forge
procedure afficherInterfaceForge(); 

implementation

uses
  SysUtils, Classes, GestionEcran, unitInterfaceForge,journalihm,unitForgeIhm;

//Affichague du titre et du texte pincipal de la forge
procedure afficherTextePrincipalForge();
begin
  //En-tete
  dessinerCadreXY(1, 1, 199, 39, simple, LightGreen, Black);
  dessinerCadreXY(39, 1, 80, 1, double, Green, Black);
  couleurTexte(White);
  deplacerCurseurXY(55, 1); write(' La Forge ');

  //Texte du hall
  couleurTexte(White);
  deplacerCurseurXY(7,4); write('Vous monter les marche menant à la forge, ici la chaleur et l''odeur des minerais fondu règne, le bruit des enclumes');
  deplacerCurseurXY(5, 5); Write('et les lourds chaudron font tout le charme de cet endroit, c''est un des rares endroit où l''on peut voir le ciel');
  deplacerCurseurXY(5, 6); write('depuis l''intérieur des mines de la Moria c''est pourquoi on l''appelle Forgeciel.');
  deplacerCurseurXY(7, 9); Write('Un nain tenant un marteaux qui comparer à sa taille ferais plus office d''une masse se retourne vers vous, sur son ');
  deplacerCurseurXY(5,10); Write('habit un nom est brodé : Maceo.');
  couleurTexte(LightMagenta);
  deplacerCurseurXY(7, 13); write('Au nom des hauts fourneaux de Forgeciel, je vous souhaite la bienvenue mon ami. Vous trouverez en ces lieux');
  deplacerCurseurXY(5, 14); Write('tranchoires et protégeant de qualités, tant que vous n''êtes pas un pieçard et que vous avez les ressources');
  deplacerCurseurXY(5, 15); write('matérielles et financières nécessaires.');
  deplacerCurseurXY(7, 18); write('Enfin, que puis-je pour vous mon cher ?');
end;


//Procedure qui affiche le choix des actions
procedure afficherOptionsForge;
begin
  dessinerCadreXY(3, 25, 115, 36, double, LightGreen, Black);
  couleurTexte(White);
  deplacerCurseurXY(7, 27); Write('Que souhaitez-vous faire ?');

  deplacerCurseurXY(9, 30); Write('1/ Demander un équipement au forgeront');
  deplacerCurseurXY(9, 31); Write('2/ Quittez la Forge');
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
      readln(choix);
      gererChoixForge(choix);
    until (choix = 3); // Quitter la forge et revenir au hall
end;
end.
