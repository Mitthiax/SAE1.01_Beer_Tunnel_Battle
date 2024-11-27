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

  {
    Fonction qui donne les points d'attaque d'une arme
    Parametres:
      numero: integer; Numero de l'équipement
    Sortie:
      integer; Points d'attaque de l'arme
  }
  function getAttaqueArme(numero: integer): integer;

  {
    Fonction qui donne les points de defence d'une armure
    Parametres:
      numero: integer; Numero de l'équipement
    Sortie:
      integer; Points de defence de l'armure
  }
  function getDefenceArmure(numero: integer): integer;
  
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
    
    bottesCuivre = 16;
    bottesFer = 17;
    bottesMythril = 18;

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
    nom := 'Aucun';
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

  {
    Fonction qui donne les points d'attaque d'une arme
    Parametres:
      numero: integer; Numero de l'équipement
    Sortie:
      integer; Points d'attaque de l'arme
  }
  function getAttaqueArme(numero: integer): integer;
  var
    attaque: integer; // Points d'attaque de l'arme

  begin
    attaque := 2;
    case numero of
      1: attaque := 4;
      2: attaque := 7;
      3: attaque := 14;
      
      4: attaque := 6;
      5: attaque := 10;
      6: attaque := 18;
    end;
    getAttaqueArme := attaque;
  end;

  {
    Fonction qui donne les points de defence d'une armure
    Parametres:
      numero: integer; Numero de l'équipement
    Sortie:
      integer; Points de defence de l'armure
  }
  function getDefenceArmure(numero: integer): integer;
  var
    defence: integer; // Points de defence de l'armure

  begin
    defence := 0;
    case numero of
      7: defence := 5;
      8: defence := 10;
      9: defence := 15;
      
      10: defence := 10;
      11: defence := 15;
      12: defence := 20;
      
      13: defence := 10;
      14: defence := 15;
      15: defence := 20;
      
      16: defence := 5;
      17: defence := 10;
      18: defence := 15;
    end;
    getDefenceArmure := defence;
  end;

end.