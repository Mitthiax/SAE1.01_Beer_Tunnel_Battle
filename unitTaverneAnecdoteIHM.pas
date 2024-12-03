unit unitTaverneAnecdoteIHM;
{Role: Permet d'afficher les anecdotes quand le joueur boit une bière.}
{$codepage utf8}
{$mode objfpc}{$H+}

interface


//Procédure que affiche l'interface de la consommation de bière
procedure afficherInterfaceBiere(); 

implementation

 uses
  SysUtils, Classes, GestionEcran, unitTaverneAnecdote, unitBeersIhm, unitTaverneIHM,journalihm; 

//Affichague du titre et du texte pincipal de la taverne
procedure afficherTextePrincipalBiere();

var 
  i : Integer; //Variable de la boucle
  anecdote : Integer; //Anecdote assigner a un chiffre 

begin
  randomize;
  //Entête
  dessinerCadreXY(1, 0, 198, 39, simple, LightGreen, Black);
  dessinerCadreXY(39, 0, 80, 0, double, Green, Black);
  couleurTexte(White);

  //Affiche le titre
  deplacerCurseurXY(46, 0); write(' La Taverne Patte de Cochon ');

  //Afficher la phrase basic 
  deplacerCurseurXY(7,5); write('Voila votre bière bien fraiche.');

  //Affiche de manière aléatoire des anecdotes
  i := random(20) + 1; //création d'un aléatoire
  if i <= 10 then
    begin
    anecdote := i;
    case anecdote of
    1 : begin
        deplacerCurseurXY(7,12); 
        write('La légende raconte que le roi des goblins vit dans ces galerie, les mercenaires qui disent l''avoir vu le nomme ');
        deplacerCurseurXY(5,13);
        write('Frank Horrigan et le décrivent comme un goblin géant, rares seraient ceux qui en réchappent, soyez prudent dans ces grottes.');
        end;
    2 : begin
        deplacerCurseurXY(7,12); 
        write('Si jamais vous avez besoin d''aide n''hésitez pas à faire appel à Grognak le Barbare, même si c''est un nordique il');
        deplacerCurseurXY(5,13);
        write('fait beaucoup de petits boulots dans ces grottes, c''est un mercenaire expérimenté.');
        end;
    3 : begin
        deplacerCurseurXY(7,12); 
        write('Moi aussi, j''étais aventurier autrefois mais je me suis pris une lance de gobelin dans le genou.');
        end;
    4 : begin
        deplacerCurseurXY(7,12);
        write('Autrefois j''étais un mineur, puis j''ai perdu ma pioche Rémi.');
        end;
    5 : begin
        deplacerCurseurXY(7,12);
        write('Un jour un nain finissait son bol de céréales à 22h et il m''a juste dit “Je suis un peu décalé".');
        end;
    6 : begin
        deplacerCurseurXY(7,12);
        write('On m''a dit qu''il y avait une bonne technique pour battre les Rhakhâs(orques), leur faire');
        deplacerCurseurXY(5,13);
        write('croire que vous êtes plus fort qu''eux et apparemment cela arrivera vraiment, comme si tout ce');
        deplacerCurseurXY(5,14);
        write('qu''ils croient se réalise.');
        end;
    7 : begin
        deplacerCurseurXY(7,12);
        write('Si vous voyez un autre nain faire ami-ami avec des Rhakhâs, prévenez immédiatement votre');
        deplacerCurseurXY(5,13);
        write('officier de la démocratie le plus proche.');
        end;
    8 : begin
        deplacerCurseurXY(7,12);
        write('La légende raconte que l''auteur du grimoire magique test unitaire a juste désactivé les');
        deplacerCurseurXY(5,13);
        write('warnings par une incantation magique interdite.');
        end;
    9 : begin
        deplacerCurseurXY(7,12);
        write('Il existerait un nain qui aurait fait un caleçon en mithryl, il y a vraiment des gens qui');
        deplacerCurseurXY(5,13);
        write('ne savent pas quoi faire.');
        end;
    end;
  end;
end;




//Procédure qui affiche le choix des actions
procedure afficherOptionsBiere;
begin
  dessinerCadreXY(3, 25, 115, 36, double, LightGreen, Black);
  couleurTexte(White);
  deplacerCurseurXY(9, 31); Write('1/ Finir sa Bière');
end;

// Procédure qui affiche le cadre de choix
procedure afficherCadreChoix();
begin
  dessinerCadreXY(100, 32, 110, 34, double, Red, Black);
  deplacerCurseurXY(105, 33);
end;



//Procédure que affiche l'interface de la consommation de bière
procedure afficherInterfaceBiere(); 
var
  choix: Integer;
begin
  afficherTextePrincipalBiere();
  journal();
  afficherOptionsBiere();

  // Capture et traitement du choix de l'utilisateur
  repeat
    afficherCadreChoix();
    readln(choix);
  until (choix = 1);

  afficherInterfaceTaverne(); // Revenir à la taverne après avoir fini la bière
  end;
  
end.
