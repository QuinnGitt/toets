<?php

class InstructeurModel 
{
    private $db;

    public function __construct()
    {
        $this->db = new Database();
    }

    public function getInstructeurs()
    {
        $sql = "SELECT * 
                FROM instructeur 
                ORDER BY AantalSterren DESC ";

        $this->db->query($sql);
        
        return $this->db->resultSet();
    }

    public function getGegevensInstructeur($id)
    {

        $sql = "SELECT ty.typeVoertuig, vo.Type, vo.Kenteken, vo.Bouwjaar, vo.Brandstof, ty.RijbewijsCategorie
                from instructeur ins
                left join voertuiginstructeur voins
                on ins.Id = voins.Id
                left join voertuig vo
                on vo.Id = ins.Id
                left join typevoertuig ty
                on ty.Id = vo.typevoertuigId
                where ins.Id = $id
                order by ty.rijbewijscategorie desc";
        
        $this->db->query($sql);
        
        return $this->db->resultSet();
    }

    public function getLizhan(){
        $sql = "SELECT * 
        FROM instructeur
        where Id = 1";

        $this->db->query($sql);

        return $this->db->resultSet();
    }

    public function getAfgenomenExamens()
    {
        $sql = "SELECT CONCAT(tor.Voornaam, IF(LENGTH(tor.Tussenvoegsel) > 0, CONCAT(' ', tor.Tussenvoegsel), ''), ' ', tor.Achternaam) AS NaamExaminator, ex.Datum, ex.RijbewijsCategorie, ex.Rijschool, ex.Stad, ex.Uitslag,
                COUNT(CASE WHEN ex.Uitslag = 'Geslaagd' THEN 1 END) AS AantalGeslaagden
                FROM examinator AS tor
                INNER JOIN examen AS ex
                ON tor.Id = ex.Id
                GROUP BY tor.Id
                ORDER BY AantalGeslaagden DESC";
        
        $this->db->query($sql);
    
        return $this->db->resultSet();
    }
} //
