unit unitBeersIhm;

{$mode objfpc}{$H+}

interface
//Procèdure que affiche l'interface du hall
procedure afficherInterface(); 

implementation
  
uses
  SysUtils, Classes, GestionEcran, unitBeerslogic;

//Affichague du titre et du texte pincipal du hall
procedure afficherTextePrincipal();
begin
  //En-tete
  dessinerCadreXY(1, 1, 199, 39, simple, LightGreen, White);
  dessinerCadreXY(39, 1, 80, 1, double, Green, White);
  deplacerCurseurXY(51, 1); write(' Le hall de la moria ');

  //Texte du hall
  couleurTexte(Black);
  deplacerCurseurXY(7,4); write('Vous vous retrouvez dans le Hall principale de la Moria, à votre grande surprise il n''y a pas que des nains,');
  deplacerCurseurXY(5, 5); Write('c''est probablement de ça dont se plaignait le chef de la guilde. Vous vous frayez un passage jusqu’au panneau');
  deplacerCurseurXY(5, 6); Write('d''indication, vous entendez d''ici le bruit des marteaux frappant sur les enclumes de la Forgeciel au Nord.');
  deplacerCurseurXY(5, 7); write('');
  deplacerCurseurXY(5, 8); write('');
  deplacerCurseurXY(7, 9); Write('Vous pouvez sentir la douce odeur de bière et les bruits des nains partageant ce doux breuvage accompagné');
  deplacerCurseurXY(5, 10); Write('des bruits du marché venant du sud des grands couloirs de la Moria.');
  deplacerCurseurXY(5, 11); write('');
  deplacerCurseurXY(5, 12); write('');
  deplacerCurseurXY(7, 13); Write('Vous pouvez voir au loin à l''est les grandes galeries minières menant au profondeur accompagné de leurs');
  deplacerCurseurXY(5, 14); write('courants d''air frais.');
  deplacerCurseurXY(5, 15); write('');
  deplacerCurseurXY(5, 16); write('');
  deplacerCurseurXY(7, 17); Write('Vous pouvez aussi voir à l''Est dans les petites coursives de la Moria parmi les logements l''emblème de la');
  deplacerCurseurXY(5, 18); Write('guilde où vous pourriez vous reposer ou prendre de nouveau contrat.');
end;

//Procedure qui affiche le journal du joueur
procedure journal();
begin
  dessinerCadreXY(120, 1, 197, 37, simple, DarkGray, white);
  dessinerCadreXY(135, 3, 185, 3, double, DarkGray, White);
  deplacerCurseurXY(152, 3); write('Journal de Bords');
end;


//Procedure qui affiche le choix des actions
procedure afficherOptions;
begin
  dessinerCadreXY(3, 25, 115, 36, double, LightGreen, White);
  couleurTexte(Black);
  deplacerCurseurXY(5, 27); Write('Que souhaitez-vous faire ?');
  deplacerCurseurXY(5, 28); write('');
  deplacerCurseurXY(5, 29); write('');
  deplacerCurseurXY(5, 30); Write('1/ Se rendre à votre chambre');
  deplacerCurseurXY(5, 31); Write('2/ Se rendre aux marchands');
  deplacerCurseurXY(5, 32); Write('3/ Se rendre à la forge');
  deplacerCurseurXY(5, 33); Write('4/ Se rendre à la taverne');
  deplacerCurseurXY(5, 34); Write('5/ Se rendre aux mines');
  dessinerCadreXY(100, 32, 110, 34, double, Red, White);
  deplacerCurseurXY(105, 33);
end;


//Procedure qui affiche tout l'ihm du hall
procedure afficherInterface();
begin
  changerTailleConsole(200,40);
  afficherTextePrincipal();
  journal();
  afficherOptions();
  readln;
end;
end.