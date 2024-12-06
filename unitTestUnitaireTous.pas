unit unitTestUnitaireTous;

{$mode objfpc}{$H+}

interface
  procedure testsunitaireTous();

implementation
uses
  SysUtils, Classes,testunitaire,testunitaireinventaire,unitCoffreTestsUnitaires,unitBuffTestUnitaire,unitHallTestUnitaire,Testunitairegestionperso;
  
procedure testsunitaireTous();
  begin
    testachat();
    testgestionperso();
    testsbuffs();
    testbeer();
    testsCoffre();
  end;
  
end.