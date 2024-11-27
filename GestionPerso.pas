unit GestionPerso;

{$mode objfpc}{$H+}

interface
procedure InitialisationPersonnage();
procedure Experience(expadd:integer);
var
exp:integer;
level:integer;
Sante:integer;
Santemax:integer;
implementation
uses
  SysUtils, Classes;



procedure InitialisationPersonnage();
begin
  level:=1;
  exp:=0;
  Santemax:=200;
  Sante:=Santemax;
end;
//ammiliore la santé avec le niveau
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
  
end.