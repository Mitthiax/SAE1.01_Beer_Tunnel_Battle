unit unitMarchandIHM;
{Role: Permet d'afficher l'interface du marchand, qui permet d'acheter des bombes et potions avec un stock différent chaque jour.}
{$codepage utf8}
{$mode objfpc}{$H+}

interface
//Permet d'affiche l'interface du marchand
procedure afficherInterfaceMarchand(); 
//Expulse le joueur de la boutique si il tente d'acheter sans avoir suffisament d'argent
procedure Argentmanquant();
//Affiche qu'il n'y a plus de cet objet dans le stock de la boutique et laisse le joueur faire un autre choix
procedure objectmanquant(nom:string);

implementation

uses
  SysUtils, Classes, GestionEcran, marchand, unitHallIhm,journalihm;

//Affichague du titre et du texte pincipal de la taverne
procedure afficherTextePrincipalMarchand();
begin
  //Entête
  dessinerCadreXY(1, 0, 198, 39, simple, LightGreen, Black);
  dessinerCadreXY(39, 1, 80, 1, double, Green, Black);
  couleurTexte(White);
  deplacerCurseurXY(54, 1); write(' Le Marchand ');

  //Texte du hall
  couleurTexte(White);
  deplacerCurseurXY(7,4);   write('Vous poussez la porte du marchand, une odeur de plante et d''arôme s''échappe.');
  deplacerCurseurXY(5, 5);  write('Sur les étagères sont disposés toutes sortes d''objet, arme exotique, potion ou des objets plus intrigants que d''autres.');
  deplacerCurseurXY(5,6);   write('Les deux marchands se retournent :');
  couleurTexte(Magenta);
  deplacerCurseurXY(7, 9);  write('Edla " Bonjour Bonjour "');
  couleurTexte(LightMagenta);
  deplacerCurseurXY(7, 12); Write('Thalnir "Oui ! Bonjour ! Que cherchez-vous ? " ');
  couleurTexte(Magenta);
  deplacerCurseurXY(7, 15); write('Edla "Ne réfléchissez plus, nous l''avons déjà !  "');
  couleurTexte(LightMagenta);
  deplacerCurseurXY(7, 18); Write('Thalnir " Vous trouverez tout ce qu''il vous faut pour vos contrats ici, aventurier ! "');
end;




//Procédure qui affiche le choix des actions
procedure afficherOptionsMarchand;
begin
  dessinerCadreXY(3, 25, 115, 36, double, LightGreen, Black);
  couleurTexte(White);
  deplacerCurseurXY(7, 27); Write('Que souhaitez-vous faire ?');

  deplacerCurseurXY(9, 30); Write('1/ Acheter une Bombe --> 30 pièces d''OR               stock : ',getstockbombe(),'/',getmaxstockbombe());
  deplacerCurseurXY(9, 31); Write('2/ Acheter une potion de soin --> 50 pièces d''OR      stock : ',getstockpotion(),'/',getmaxstockpotion());
  deplacerCurseurXY(9, 32); Write('3/ Quitter la Boutique');
end;

// Procédure qui affiche le cadre de choix
procedure afficherCadreChoix();
begin
  dessinerCadreXY(100, 32, 110, 34, double, Red, Black);
  deplacerCurseurXY(105, 33);
end;


// Procédure qui affiche toute l'interface du marchand
procedure afficherInterfaceMarchand();
var
  choix: Integer;
begin
  changerTailleConsole(200,40);
  afficherTextePrincipalMarchand();
  journal();
  afficherOptionsMarchand();

  // Capture et traitement du choix de l'utilisateur
  repeat
    afficherCadreChoix();
    readln(choix);
  until (1 <= choix) and (choix <= 3);

  if (choix = 1) OR (choix = 2) then 
  begin
    achat(choix); //Appel de la procedure d'achat
    afficherInterfaceMarchand(); //Permet d'afficher l'interface de la boutique afin de pouvoir acheter autre chose
  end
  else if (choix = 3) then afficherInterface(); // Retour dans le hall

end;

//procédure qui expulse le joueur de la boutique s'il tente d'acheter sans avoir suffisament d'argent
procedure Argentmanquant();
begin
  couleurTexte(White);
  deplacerCurseurXY(9, 34); Write('Sors de ma boutique sale piéçard !');
  readln;
  afficherInterface();
end;

//Affiche qu'il n'y a plus de cet objet dans le stock de la boutique et laisse le joueur faire un autre choix
procedure objectmanquant(nom:string);
begin
  couleurTexte(White);
  deplacerCurseurXY(9, 34); Write('Désolé mais nous n''avons plus de ',nom,' en stock');
  readln;
  afficherInterfaceMarchand();
end;
end.
