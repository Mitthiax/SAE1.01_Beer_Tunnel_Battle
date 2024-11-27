unit GestionPerso;

{$mode objfpc}{$H+}

interface
procedure InitialisationPersonnage(nomPersonnage:string; taillePersonnage:integer; genrePersonnage:string);
procedure InitialisationPersonnage();
procedure Experience(expadd:integer);
procedure mourrir();
var
exp:integer;
level:integer;
Sante:integer;
Santemax:integer;


implementation
uses
  SysUtils, Classes,combat,GestionEcran,unitMenuPrincipalLogic, unitCoffreLogic;

var
  nom:string;
  taille:integer;
  genre:string;


function gestionSante(Santemax:integer;Sante:integer;degatrecu:integer):integer; // besoin du combat fini svp
begin
  Sante-=degatrecu;
  if Sante<=0 then
  begin
    Sante:=0;
    mourrir();
  end
  else if Sante>=Santemax then
  begin
    Sante:=Santemax;
  end; 
end;

//pour les test unitaires
procedure InitialisationPersonnage();
begin
  InitialisationPersonnage('', 0, '')
end;
//initialise le stats du personnage à sa création
procedure InitialisationPersonnage(nomPersonnage:string; taillePersonnage:integer; genrePersonnage:string);
begin
  initialisationEquipement();

  nom := nomPersonnage;
  taille := taillePersonnage;
  genre := genrePersonnage;

  level:=1;
  exp:=0;
  Santemax:=200;
  Sante:=Santemax;
end;

//amiliore la santé avec le niveau
function LevelSante(level:integer;Santemax:integer):integer;
begin
  Santemax:=200+15*(level-1);
  Sante:=Santemax;
  LevelSante:=Santemax;
end;


procedure Experience(expadd:integer);//gère la monter en niveau du joueur
begin
   if level<10 then //level max est 10
   begin
     exp+=expadd;
     while exp>=(level*100) do
     begin
         exp-=(level*100) ; // on enleve l'exp de la monter de niveau mais on laisse celle en trop
         level+=1;
         Santemax:=LevelSante(level,Santemax);
     end;
    end;   
end; 
  procedure mourrir();
  begin
    dessinerCadreXY(3, 25, 115, 36, double, LightGreen, White);
    couleurTexte(Black);
    deplacerCurseurXY(5, 27); Write('Vous ressentez une vive douleur, vous voyez le monde s’assombrir, les hurlements de vos ennemis s''éloignent ');
    deplacerCurseurXY(5, 28); Write('peu à peu pour laisser place à un lourd silence sombre.');
    deplacerCurseurXY(5, 29); Write('Il est temps pour vous de rejoindre vos ancêtres au valhnanain, vous êtes mort');
    readln;
    menu();
  end;
end.