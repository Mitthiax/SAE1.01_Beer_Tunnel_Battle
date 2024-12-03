unit unitBeersIhm;

{$codepage utf8}
{$mode objfpc}{$H+}

interface
//Procèdure que affiche l'interface du hall
procedure afficherInterface(); 

implementation
  
uses
  SysUtils, Classes, GestionEcran, unitBeerslogic, unitTaverneIHM,journalihm;

//Affichague du titre et du texte pincipal du hall
procedure afficherTextePrincipal();
begin
  //En-tete
  dessinerCadreXY(1, 0, 198, 39, simple, LightGreen, Black);
  dessinerCadreXY(39, 1, 80, 1, double, Green, Black);
  couleurTexte(White);
  deplacerCurseurXY(51, 1); write(' Le hall de la moria ');

  //Texte du hall
  couleurTexte(White);
  deplacerCurseurXY(7,4); write('Vous vous retrouvez dans le Hall principale de la Moria, à votre grande surprise il n''y a pas que des nains,');
  deplacerCurseurXY(5, 5); Write('c''est probablement de ça dont se plaignait le chef de la guilde. Vous vous frayez un passage jusqu’au panneau');
  deplacerCurseurXY(5, 6); Write('d''indication, vous entendez d''ici le bruit des marteaux frappant sur les enclumes de la Forgeciel au Nord.');
  deplacerCurseurXY(7, 9); Write('Vous pouvez sentir la douce odeur de bière et les bruits des nains partageant ce doux breuvage accompagné');
  deplacerCurseurXY(5, 10); Write('des bruits du marché venant du sud des grands couloirs de la Moria.');
  deplacerCurseurXY(7, 13); Write('Vous pouvez voir au loin à l''est les grandes galeries minières menant au profondeur accompagné de leurs');
  deplacerCurseurXY(5, 14); write('courants d''air frais.');
  deplacerCurseurXY(7, 17); Write('Vous pouvez aussi voir à l''Est dans les petites coursives de la Moria parmi les logements l''emblème de la');
  deplacerCurseurXY(5, 18); Write('guilde où vous pourriez vous reposer ou prendre de nouveau contrat.');
end;





//Procedure qui affiche le choix des actions
procedure afficherOptions;
begin
  dessinerCadreXY(3, 25, 115, 36, double, LightGreen, Black);
  couleurTexte(White);
  deplacerCurseurXY(7, 27); Write('Que souhaitez-vous faire ?');
  deplacerCurseurXY(9, 30); Write('1/ Se rendre à votre chambre');
  deplacerCurseurXY(9, 31); Write('2/ Se rendre aux marchands');
  deplacerCurseurXY(9, 32); Write('3/ Se rendre à la forge');
  deplacerCurseurXY(9, 33); Write('4/ Se rendre aux mines');
  deplacerCurseurXY(9, 34); Write('5/ Se rendre à la taverne');
  deplacerCurseurXY(9, 35); write('6/ Menu Principal pour crée une nouvelle partie ou quittez');
  dessinerCadreXY(100, 32, 110, 34, double, Red, Black);
  deplacerCurseurXY(105, 33);
end;


// Procédure qui affiche toute l'interface du hall
procedure afficherInterface();
var
  choix: Integer;
begin
  afficherTextePrincipal();
  journal();
  afficherOptions();

  // Capture et traitement du choix de l'utilisateur
  repeat
    readln(choix);
    gererChoix(choix);
  until (1 <= choix) and (choix <= 6);
end;
end.
