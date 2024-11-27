unit unitCoffreConst;

{$mode objfpc}{$H+}

interface
  {
    Fonction qui donne le nom d'un équipement à partir de son numero
    Parametres:
      numero: integer; Numero de l'équipement
    Sortie:
      string; Nom de l'équipement
  }
  function getNomEquipement(numero: integer): string;
  
  const
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
    
    botCuivre = 16;
    botFer = 17;
    botMythril = 18;

implementation
  {
    Fonction qui donne le nom d'un équipement à partir de son numero
    Parametres:
      numero: integer; Numero de l'équipement
    Sortie:
      string; Nom de l'équipement
  }
  function getNomEquipement(numero: integer): string;
  var
    nom: string; // Nom de l'équipement

  begin
    case numero of
      1: nom := 'Epee en cuivre';
      2: nom := 'Epee en fer';
      3: nom := 'Epee en mythril';
      
      4: nom := 'Hache en cuivre';
      5: nom := 'Hache en fer';
      6: nom := 'Hache en mythril';
      
      7: nom := 'Casque en cuivre';
      8: nom := 'Casque en fer';
      9: nom := 'Casque en mythril';
      
      10: nom := 'Plastron en cuivre';
      11: nom := 'Plastron en fer';
      12: nom := 'Plastron en mythril';
      
      13: nom := 'Jambiere en cuivre';
      14: nom := 'Jambiere en fer';
      15: nom := 'Jambiere en mythril';
      
      16: nom := 'Bottes en cuivre';
      17: nom := 'Bottes en fer';
      18: nom := 'Bottes en mythril';
    end;
    getNomEquipement := nom;
  end;

end.