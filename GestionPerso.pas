unit GestionPerso;

{$codepage utf8}
{$mode objfpc}{$H+}

interface
procedure InitialisationPersonnage(nomPersonnage:string; taillePersonnage:integer; genrePersonnage:string);
procedure InitialisationPersonnage();
procedure Experience(expadd:integer);
procedure mourrir();
procedure gestionSante(degatrecu:integer);
procedure soignerJoueur();
procedure soignerJoueur(pvrestorer:integer);

//Fonction getvar
function getexp():integer;
function getlevel():integer;
function getSante():integer;
function getSantemax():integer;
function getnom():string;
function gettaille():integer;
function getgenre():string;

//procedure de set
procedure setSantemax(Santemaxset:integer);

implementation
uses
  SysUtils, Classes,combat,GestionEcran,unitMenuPrincipalLogic, unitCoffreLogic,Inventaire,journalihm,gestionbuff,marchand,unitDate, unitContratsLogic;
//Initialisation des variables on utilisera un getvar pour les utilisé dans les autres modules
var
  exp:integer;
  level:integer;
  Sante:integer;
  Santemax:integer;
  nom:string;
  taille:integer;
  genre:string;

{
initialise le stats du personnage à sa création
Entrée : Nom du personnage
        Taille du personnage
        genre du Personnage
}
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
  resetBuffs();
  Initstockboutique();
  InitialiserDate();
  initialiserContrats();
end;

//pour les test unitaires
procedure InitialisationPersonnage();
begin
  InitialisationPersonnage('', 0, '');
end;

//amiliore la santé avec le niveau
function LevelSante(level:integer):integer;
begin
  Santemax:=200+15*(level-1);//Calcul de la santé max de base on ne réutilise pas Santemax pour éviter les bugs si jamais le joueur à un buff
  getBuffSanteeMax();//On redonne le buff au joueur
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

{
  Procedure qui redonne tous ses points de vie au joueur
}
procedure soignerJoueur();
begin
  Sante:=Santemax;
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

//Ici on délcare toute les fonctions get de l'unité

function getexp():integer;
begin
  getexp:=exp;
end;

function getlevel():integer;
begin
  getlevel:=level;
end;

function getSante():integer;
begin
  getSante:=Sante;
end;


function getSantemax():integer;
begin
  getSantemax:=Santemax;
end;

function getnom():string;
begin
  getnom:=nom;
end;

function gettaille():integer;
begin
  gettaille:=taille;
end;

function getgenre():string;
begin
  getgenre:=genre;
end;

procedure setSantemax(Santemaxset:integer);
begin
  Santemax:=Santemaxset;
end;

end. 