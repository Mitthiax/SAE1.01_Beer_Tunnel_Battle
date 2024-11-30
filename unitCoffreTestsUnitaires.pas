unit unitCoffreTestsUnitaires;

{$codepage utf8}
{$mode objfpc}{$H+}

interface
  {
    Pocedure qui réalise l'ensemble des tests unitaires sur le coffre
  }
  procedure testsCoffre();
  
implementation
  uses
    SysUtils, Classes, testunitaire, unitCoffreLogic, unitCoffreConst;
  
  {
    Procedure qui réalises un test unitaire sur l'initialisation du coffre
  }
  procedure testInitialisation();
  var
    i: integer; // Variable de boucle, numéro des équipements
    testEquipementsBloquesValide: boolean; // True si le test est validé, sinon false

  begin
    // Initialisation des variables
    i := 1;
    testEquipementsBloquesValide := true;

    initialisationEquipement();

    // Initialisation du test unitaire
    newTestsSeries('Tests de l''initialisation du coffre');
    newTest('Tests de l''initialisation du coffre', 'Test des équipement bloqués et débloqués');

    // Test en parcourant le tableau de valeur
    while (i <= 18) and testEquipementsBloquesValide do
    begin
      // On verifie si les 6 équipements en cuivre sont bien débloqués
      if ((i = 1) or (i = 4) or (i = 7) or (i = 10) or (i = 13) or (i = 16)) then
      begin
        testEquipementsBloquesValide := estDisponibleEquipement(i);
      end
      // On verifie si tous les autres équipements sont bien bloqués
      else testEquipementsBloquesValide := not estDisponibleEquipement(i);

      i += 1;
    end;
    testIsEqual(testEquipementsBloquesValide);
  end;

  {
    Procedure qui réalise un test unitaire sur l'équipement d'équipements
  }
  procedure testsEquipementEquipements();
  begin
    initialisationEquipement();

    newTestsSeries('Tests équipement d''équipements');
    

    // Test sur équipement débloqué
    newTest('Tests équipement d''équipements', 'Test sur équipement débloqué');
    equiper(epeeCuivre);
    testIsEqual(getArmeEquipee(), epeeCuivre);


    // Test sur équipement bloqué
    newTest('Tests équipement d''équipements', 'Test sur équipement bloqué');
    equiper(epeeFer);
    testIsEqual(getArmeEquipee(), epeeCuivre);


    // Test de changement d'équipement
    newTest('Tests équipement d''équipements', 'Test de changement d''équipement');
    equiper(hacheCuivre);
    testIsEqual(getArmeEquipee(), hacheCuivre);
  end;
  
  {
    Pocedure qui réalise l'ensemble des tests unitaires sur le coffre
  }
  procedure testsCoffre();
  begin
    testInitialisation();
    testsEquipementEquipements();

    Summary();
  end;
end.