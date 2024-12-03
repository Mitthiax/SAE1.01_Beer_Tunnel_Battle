unit marchand;
{Role: Permet d'acheter des bombes et des potions.}
{$codepage utf8}
{$mode objfpc}{$H+}

interface
//Initialise le stock de la boutique pour la journée
procedure Initstockboutique();
//achat d'un objet dans la boutique
procedure achat(objet:integer);
//fonction get de l'unité pour récupéré les variable piur l'ihm
function getmaxstockbombe():integer;
function getmaxstockpotion():integer;
function getstockbombe():integer;
function getstockpotion():integer;
procedure StockboutiqueArtificiel();
implementation
uses
  SysUtils, Classes,Inventaire,GestionEcran,unitMarchandIHM;

var
stockbombe:integer;
stockpotion:integer;
maxstockbombe:integer;
maxstockpotion:integer;

//Initialise le stock de la boutique pour la journée
procedure Initstockboutique();
begin
  stockbombe:=random(6);//random sur le stock du jour
  maxstockbombe:=stockbombe; //maximum du stock du jour 
  stockpotion:=random(11);//random sur le stock du jour
  maxstockpotion:=stockpotion;//maximum du stock du jour
end;

//Pour les test unitaire
procedure StockboutiqueArtificiel();
begin
  stockbombe:=5;//donne 5 bombe artificiellement au stock
  maxstockbombe:=stockbombe; //maximum du stock du jour 
  stockpotion:=10;//donne 10 potion artificiellement au stock
  maxstockpotion:=stockpotion;//maximum du stock du jour
end;

//achat d'un objet dans la boutique
procedure achat(objet:integer);

begin
  case objet of
    1:
    begin
      if (getinvent(monnaie)>= 30) and (stockbombe>0) then//regarde si le joueur à l'argent et si le marchand à le stock puis ajoute l'objet et le retire du stock en prennend l'argent
      begin
        setinvent(bombe,getinvent(bombe)+1);
        setinvent(monnaie,getinvent(monnaie)-30);
        stockbombe-=1;
      end
      else if stockbombe<=0 then//si le marchand n'a pas le stock il indique qu'il n'y a plus l'objet
      begin
        objectmanquant('bombe');
      end
      else if getinvent(monnaie)<30 then //si le joueur n'a pas l'argent il se fait traiter de pauvre et se fait expulser de la boutique
      begin
        setinvent(bombe,getinvent(bombe));
        Argentmanquant();
      end;
    end;
  
    2:
     begin
      if (getinvent(monnaie)>= 50) and (stockpotion>0) then//regarde si le joueur à l'argent et si le marchand à le stock puis ajoute l'objet et le retire du stock en prennend l'argent
      begin
        setinvent(potion,getinvent(potion)+1);
        setinvent(monnaie,getinvent(monnaie)-50);
        stockpotion-=1;
      end
       else if stockpotion<=0 then//si le marchand n'a pas le stock il indique qu'il n'y a plus l'objet
      begin
        objectmanquant('potion');
      end
      else if getinvent(monnaie)>= 50 then //si le joueur n'a pas l'argent il se fait traiter de pauvre et se fait expulser de la boutique
      begin
        setinvent(potion,getinvent(potion));
        Argentmanquant();
      end;
    end;
  end;
end;


//fonction get de l'unité pour récupéré les variable piur l'ihm
function getmaxstockbombe():integer;
begin
  getmaxstockbombe:=maxstockbombe;
end;
function getmaxstockpotion():integer;
begin
  getmaxstockpotion:=maxstockpotion;
end;
function getstockbombe():integer;
begin
  getstockbombe:=stockbombe;
end;
function getstockpotion():integer;
begin
  getstockpotion:=stockpotion;
end;
end.
