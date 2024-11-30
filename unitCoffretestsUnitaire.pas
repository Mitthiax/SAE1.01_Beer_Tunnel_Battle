unit unitCoffreTestsUnitaire;

{$codepage utf8}
{$mode objfpc}{$H+}

interface
  {
    Procedure qui réalises les tests unitaire d'initialisation
  }
  procedure testInitialisation();
  
implementation
  uses
    SysUtils, Classes, testunitaire, unitCoffreLogic;
  
  {
    Procedure qui réalises les tests unitaire d'initialisation
  }
  procedure testInitialisation();
  var
    i: integer; // Variable de boucle, numéro des équipements
    testEquipementBloquesValide: boolean; // True si le test est validé, sinon false

  begin
    // Initialisation des variables
    testEquipementBloquesValide := true;

    // Initialisation du test unitaire
    newTestsSeries('Tests de l''initialisation du coffre');
    newTest('Tests de l''initialisation du coffre', 'Test des équipement bloqués et débloqués');

    initialisationEquipement();

    // // Test en parcourant le tableau de valeur
    // while (i <= 18) and testEquipementBloquesValide do
    // begin
    //   // On verifie si les 6 équipements en cuivre sont bien débloqués
    //   if ((i = 1) or (i = 4) or (i = 7) or (i = 10) or (i = 13) or (i = 16)) then
    //   begin
    //     testEquipementBloquesValide := estDisponibleEquipement(i);
    //   end
    //   // On verifie si tous les autres équipements sont bien bloqués
    //   else testEquipementBloquesValide := not estDisponibleEquipement(i);
    // end;
    testIsEqual(testEquipementBloquesValide);
  end;
  
end.