unit unitCoffreConst;
{Role: Constante du Coffre.}
{$codepage utf8}
{$mode objfpc}{$H+}

interface
  type
    TEquipement = record
      nom:      string;  // Nom de l'équipement
      materiau: string;  // Materiau de l'équipement
      points:   integer; // Points de défence ou d'attaque de l'équipement
      prix:     integer; // Prix en materiau de l'équipement à la forge
      prixOr:   integer; // Prix en or de l'équipement à la forge
    end;

  const
    listeEquipement: array[-1..18] of TEquipement = (
      // Arme vide
      (nom: 'Poings de nain';      materiau: '';        points: 4;  prix: 0;   prixOr: 0),
      // Armure vide
      (nom: 'Aucun';               materiau: '';        points: 0;  prix: 0;   prixOr: 0),

      // Épées
      (nom: 'Epee en cuivre';      materiau: 'Cuivre';  points: 4;  prix: 0;   prixOr: 0),
      (nom: 'Epee en fer';         materiau: 'Fer';     points: 7;  prix: 50;  prixOr: 150),
      (nom: 'Epee en mythril';     materiau: 'Mythril'; points: 14; prix: 20;  prixOr: 300),
      
      // Haches
      (nom: 'Hache en cuivre';     materiau: 'Cuivre';  points: 6;  prix: 100; prixOr: 100),
      (nom: 'Hache en fer';        materiau: 'Fer';     points: 10; prix: 75;  prixOr: 200),
      (nom: 'Hache en mythril';    materiau: 'Mythril'; points: 18; prix: 25;  prixOr: 350),
      
      // Casques
      (nom: 'Casque en cuivre';    materiau: 'Cuivre';  points: 5;  prix: 100; prixOr: 75),
      (nom: 'Casque en fer';       materiau: 'Fer';     points: 10; prix: 50;  prixOr: 130),
      (nom: 'Casque en mythril';   materiau: 'Mythril'; points: 15; prix: 20;  prixOr: 300),
      
      // Plastrons
      (nom: 'Plastron en cuivre';  materiau: 'Cuivre';  points: 10; prix: 100; prixOr: 105),
      (nom: 'Plastron en fer';     materiau: 'Fer';     points: 15; prix: 75;  prixOr: 250),
      (nom: 'Plastron en mythril'; materiau: 'Mythril'; points: 20; prix: 25;  prixOr: 500),
      
      // Jambières
      (nom: 'Jambiere en cuivre';  materiau: 'Cuivre';  points: 10; prix: 100; prixOr: 100),
      (nom: 'Jambiere en fer';     materiau: 'Fer';     points: 15; prix: 75;  prixOr: 200),
      (nom: 'Jambiere en mythril'; materiau: 'Mythril'; points: 20; prix: 25;  prixOr: 400),
      
      // Bottes
      (nom: 'Bottes en cuivre';    materiau: 'Cuivre';  points: 5;  prix: 100; prixOr: 75),
      (nom: 'Bottes en fer';       materiau: 'Fer';     points: 10; prix: 50;  prixOr: 130),
      (nom: 'Bottes en mythril';   materiau: 'Mythril'; points: 15; prix: 20;  prixOr: 300)
    );

    epeeCuivre = 1;
    epeeFer = 2;
    epeeMythril = 3;

    hacheCuivre = 4;
    hacheFer = 5;
    hacheMythril = 6;

    
    casqueCuivre = 7;
    casqueFer = 8;
    casqueMythril = 9;
    
    plastronCuivre = 10;
    plastronFer = 11;
    plastronMythril = 12;
    
    jambieresCuivre = 13;
    jambieresFer = 14;
    jambieresMythril = 15;
    
    bottesCuivre = 16;
    bottesFer = 17;
    bottesMythril = 18;
implementation
end.
