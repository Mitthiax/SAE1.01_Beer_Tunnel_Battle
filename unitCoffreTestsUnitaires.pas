unit unitCoffreTestsUnitaires;

{$codepage utf8}
{$mode objfpc}{$H+}

interface
  
  //Pocedure qui réalise l'ensemble des tests unitaires sur le coffre
  procedure testsCoffre();
  
implementation
  uses
    SysUtils, Classes, testunitaire, unitCoffreLogic, unitCoffreConst;
  
  //Procédure qui réalises un test unitaire sur l'initialisation du coffre
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
    newTestsSeries('Test de l''initialisation du coffre');
    newTest('Test de l''initialisation du coffre', 'Test des équipement bloqués');

    while (i <= 18) and testEquipementsBloquesValide do
    begin
      // On verrifie si l'épée et le casque en cuivre sont bien débloqués
      if (i = epeeCuivre) or (i = casqueCuivre) then testEquipementsBloquesValide := estDisponibleEquipement(i);

      // On verifie si tous les autres équipements sont bien bloqués
      testEquipementsBloquesValide := not estDisponibleEquipement(i);
      i += 1;
    end;
    testIsEqual(testEquipementsBloquesValide);
  end;

  //Procédure qui réalise un test unitaire sur l'équipement d'équipements
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
  
  //Pocedure qui réalise l'ensemble des tests unitaires sur le coffre
  procedure testsCoffre();
  begin
    testInitialisation();
    testsEquipementEquipements();

    Summary();
  end;
end.
