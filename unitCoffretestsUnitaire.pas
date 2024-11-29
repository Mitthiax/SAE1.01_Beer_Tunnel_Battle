unit testsUnitaireCoffre;

{$mode objfpc}{$H+}

interface
  
implementation
  uses
    SysUtils, Classes, testunitaire, unitCoffreLogic;
  
  procedure testInitialisation();
  var
    testEquipementValide := false;

  begin
    newTestsSeries('Tests de l''initialisation du coffre');
    newTest('Tests de l''initialisation du coffre', 'Test des équipement bloqués et débloqués');
    for i := 1 to 18 do
    begin
      
    end;
    testIsEqual()
  end;
  
end.