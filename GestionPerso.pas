unit GestionPerso;

{$mode objfpc}{$H+}

interface
procedure InitialisationPersonnage(nomPersonnage:string; taillePersonnage:integer; genrePersonnage:string);
procedure InitialisationPersonnage();
procedure Experience(expadd:integer);
procedure mourrir();
procedure gestionSante(degatrecu:integer);
var
exp:integer;
level:integer;
Sante:integer;
Santemax:integer;


implementation
uses
  SysUtils, Classes,combat,GestionEcran,unitMenuPrincipalLogic, unitCoffreLogic,Inventaire,journalihm;

var
  nom:string;
  taille:integer;
  genre:string;

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
  InventaireInit();
end;

//pour les test unitaires
procedure InitialisationPersonnage();
begin
  InitialisationPersonnage('', 0, '');
end;

//amiliore la santé avec le niveau
function LevelSante(level:integer):integer;
begin
  Santemax:=200+15*(level-1);
  Sante:=Santemax;
  LevelSante:=Santemax;
end;

//gère la monter en niveau du joueur
procedure Experience(expadd:integer);
begin
   if level<10 then //level max est 10
   begin
     exp+=expadd;
     while exp>=(level*100) do
     begin
         exp-=(level*100) ; // on enleve l'exp de la monter de niveau mais on laisse celle en trop
         level+=1;
         Santemax:=LevelSante(level);
     end;
    end;   
end; 


//Fait mourrir le personnage
 procedure mourrir();
  begin
    dessinerCadreXY(3, 25, 115, 36, double, LightGreen, White);
    couleurTexte(Black);
    deplacerCurseurXY(5, 27); Write('Vous ressentez une vive douleur, vous voyez le monde s’assombrir, les hurlements de vos ennemis s''éloignent ');
    deplacerCurseurXY(5, 28); Write('peu à peu pour laisser place à un lourd silence sombre.');
    deplacerCurseurXY(5, 29); Write('Il est temps pour vous de rejoindre vos ancêtres au valhnanain, vous êtes mort');
    journal();
    readln;
    menu();
  end;

//gere la baisse de la sante du joueur a cause des degats
procedure gestionSante(degatrecu:integer); // besoin du combat fini svp
begin
  Sante-=degatrecu;
  if Sante<=0 then
  begin
    Sante:=0;
    mourrir();
  end;
end;

//Permet de soigner le joueur
procedure soignerJoueur(pvrestorer:integer);
begin
  Sante+=pvrestorer;
  if Sante>Santemax then
  begin
    Sante:=Santemax;
  end; 
end;

end. 