unit inventaire;

{$mode objfpc}{$H+}

interface
  
uses
  SysUtils, Classes,unitCoffreLogic;
  
implementation
  procedure armure();
  begin
    botte:=getBottesEquipe();
    casque:=getCasqueEquipe();
    Jambieres:=getJambieresEquipe();
    Plastron:=getPlastronEquipe();
  end;

  
end.