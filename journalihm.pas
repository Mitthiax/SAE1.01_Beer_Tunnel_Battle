unit journalihm;

{$codepage utf8}
{$mode objfpc}{$H+}

interface
procedure journal();

implementation
uses
  SysUtils, Classes,GestionPerso,GestionEcran,Inventaire,unitCoffreLogic,unitCoffreConst;
  
//affiche les informations du personnage du joueur pour l'ihm du journal
procedure journalperso();
begin
  deplacerCurseurXY(150,6);write('Nom : ',getnom());
  deplacerCurseurXY(150,7);write('Taille : ',gettaille() div 100, 'm ', gettaille() mod 100,'cm');
  deplacerCurseurXY(150,8);write('Genre : ',getgenre());
  deplacerCurseurXY(180,6);write('PV : ',getSante(),'/',getSantemax());
  deplacerCurseurXY(180,7);write('Niveau : ',getlevel(),'/10');//affiche le lever face au level max
  deplacerCurseurXY(180,8);write('Exp : ',getexp(),'/',getlevel()*100);//affiche l'exp par rapport à l'exp nécessaire pour monter de niveau
end;

//Affiche les informations sur l'inventaire du joueur
procedure journalivent();
begin

  
  deplacerCurseurXY(166,15);write('Inventaire');

  deplacerCurseurXY(150,17);write('Arme  : ',listeEquipement[getArmeEquipee()].nom);
  deplacerCurseurXY(150,19);write('Tête : ',listeEquipement[getCasqueEquipe()].nom);
  deplacerCurseurXY(150,20);write('Torse : ',listeEquipement[getPlastronEquipe()].nom);
  deplacerCurseurXY(150,21);write('Jambe : ',listeEquipement[getJambieresEquipees()].nom);
  deplacerCurseurXY(150,22);write('Pied  : ',listeEquipement[getBottesEquipees()].nom);
  deplacerCurseurXY(150,24);write('Bombe : ',getinvent(Bombe));
  deplacerCurseurXY(150,25);write('Pièces d''or : ',getinvent(monnaie));
  deplacerCurseurXY(180,24);write('Potion : ',getinvent(potion));
  deplacerCurseurXY(150,27);write('Cuivre : ',getinvent(cuivre));
  deplacerCurseurXY(150,28);write('Fer : ',getinvent(fer));
  deplacerCurseurXY(150,29);write('Mythril : ',getinvent(mythril));
end;

//Procedure qui affiche le journal du joueur
procedure journal();
begin
  dessinerCadreXY(145, 1, 195, 37, simple, DarkGray, Black);
  dessinerCadreXY(155, 3, 185, 3, double, DarkGray, Black);
  couleurTexte(White);
  deplacerCurseurXY(163, 3); write('Journal de Bords');
  journalperso();//appelle la fonction qui affiche les info du joueur
  journalivent();//appelle la fonction qui affiche les info de l'inventaire
end;

  
end.