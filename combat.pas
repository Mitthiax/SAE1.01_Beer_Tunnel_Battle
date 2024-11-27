unit combat;

{$mode objfpc}{$H+}

interface
var
degatrecu:integer;

implementation
uses
  SysUtils, Classes,GestionPerso;
  
//fonction qui calcule les dégats infliger à l'ennemie 
function degatInfliger(degat:integer):integer;
var
degatmit:integer;
begin
  if random(15+level)>2 then // on fait un jeu de harsard pour savoir si on réussi le coup ou pas(les chances sont augmenter avec le niveau)
  begin
    degatmit:= degat+random(5+level); //on donne la possibilité de mettre plus de dégats (une sorte de coup critique)(augmenter avec le niveau)
  end
  else
  begin
  degatmit:=0;
  end;
  degatInfliger:=degatmit;
end;

function subirdegats(deffense:integer;couprecu:integer):integer;
begin
  if random(30-level)<>0 then //on laisse une chance au joueur d'esquiver le coup(c'est petit un nain aussi, ça peut se baisser)
  begin
    degatrecu:=couprecu+random(11-level);//Augmente les degats que l'ennemie inflige (bah oui pourquoi ça serais que dans 1 sens lui aussi il a le droit au coup critique)(baisse avec le niveau)
    //degatrecu:=(degatrecu-(degatrecu*(deffense/100))div 1);//calcul les degats reçu avec le bonus de protection (svp faites en sortes que la deffense depasse pas 100 sinon il risque de give des points de vie)
    if degatrecu<0 then
    begin
      degatrecu:=0;
    end;
  end
  else
  begin
    degatrecu:=0;
  end;
  subirdegats:=degatrecu;
end;


end.