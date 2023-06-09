<?php

class Instructeur extends BaseController 
{
    private $instructeurModel;
    public function __construct()
    {
        $this->instructeurModel = $this->model('InstructeurModel');
    }
    public function index() 
    {
        /**
         * Haal alle instructeurs op uit de database (model)
         */
        $instructeurs = $this->instructeurModel->getInstructeurs();

        // var_dump($instructeurs);
        $aantalInstructeurs = sizeof($instructeurs);

        /**
         * Maak de rows voor de tbody in de view
         */
        $tableRows = '';

        foreach ($instructeurs as $instructeur) {
            $datum = date_create($instructeur->DatumInDienst);
            $datum = date_format($datum, 'd-m-Y'); 
            $tableRows .=  "<tr>
                                <td>$instructeur->Voornaam</td>
                                <td>$instructeur->Tussenvoegsel</td>
                                <td>$instructeur->Achternaam</td>
                                <td>$instructeur->Mobiel</td>
                                <td>$datum</td>
                                <td>$instructeur->AantalSterren</td>
                                <td>
                                    <a href='". URLROOT . "/Instructeur/gebruikteVoertuigen/?id=$instructeur->Id'>
                                    <i class='bi bi-car-front'></i>
                                </td>
                            </tr>";
        }
        
        /**
         * Het $data-array geeft alle belangrijke info door aan de view
         */
        $data = [
            'title' => 'Instructeurs in dienst', 
            'aantalInstructeurs' => $aantalInstructeurs,
            'tableRows' => $tableRows,
            'toets' => 'Overzicht afgenomen Examens Examinatoren'
        ];

        $this->view('Instructeur/index', $data);
    }

    public function gebruikteVoertuigen()
    {
        /**
         * Haal de info van de instructeur op uit de database (model)
         */

         if(isset($_GET['id'])) {
            $id = $_GET['id'];
            $infoInstructeur = $this->instructeurModel->getGegevensInstructeur($id);
         }
        

        // var_dump($infoInstructeur);
        // $aantalSterren = sizeof($);

        /**
         * Maak de rows voor de tbody in de view
         */
        $tableRows = '';

        foreach ($infoInstructeur as $info) {
            $datum = date_create($info->Bouwjaar);
            $datum = date_format($datum, 'd-m-Y'); 
            $tableRows .=  "<tr>
                                <td>$info->typeVoertuig</td>
                                <td>$info->Type</td>
                                <td>$info->Kenteken</td>
                                <td>$datum</td>
                                <td>$info->Brandstof</td>
                                <td>$info->RijbewijsCategorie</td>
                            </tr>";
        }

        $naamDatumSterren = $this->instructeurModel->getLizhan();

        $nds = '';

        foreach ($naamDatumSterren as $naam) {
            $datum = date_create($naam->DatumInDienst);
            $datum = date_format($datum, 'd-m-Y'); 
            $aantalSterren =    $naam->AantalSterren;
            $voor =             $naam->Voornaam;
            $tussen =           $naam->Tussenvoegsel;
            $achter =           $naam->Achternaam;
        }

        $data = [
            'title'         => 'Door instructeur gebruikte voertuigen',
            'tableRows'     => $tableRows,
            'datum'         => $datum,
            'aantalSterren' => $aantalSterren,
            'voor'          => $voor,
            'tussen'        => $tussen, 
            'achter'        => $achter
        ];
        $this->view('Instructeur/gebruikteVoertuigen', $data);
    }

    public function examen() 
    {
        /**
         * Haal alle instructeurs op uit de database (model)
         */
        $examens = $this->instructeurModel->getAfgenomenExamens();

        // $examen = sizeof($examens);
        // var_dump($examen);

        /**
         * Maak de rows voor de tbody in de view
         */
        $tableRows = '';

        foreach ($examens as $ex) {
            // $voornaam = $ex->Voornaam;
            // $tussenvoegsel = $ex->Tussenvoegsel;
            // $achternaam = $ex->Achternaam;
            // $naam = $voornaam . ' ' . $tussenvoegsel . ' ' . $achternaam;
            $tableRows .=  "<tr>
                                <td>$ex->NaamExaminator</td>
                                <td>$ex->Datum</td>
                                <td>$ex->RijbewijsCategorie</td>
                                <td>$ex->Rijschool</td>
                                <td>$ex->Stad</td>
                                <td>$ex->Uitslag</td>
                            </tr>";
        }
                
        /**
         * Het $data-array geeft alle belangrijke info door aan de view
         */
        $data = [
            'tableRows' => $tableRows,
            'toets' => 'Overzicht afgenomen Examens Examinatoren'
        ];

        $this->view('Instructeur/examen', $data);
    }
}