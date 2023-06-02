<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="<?= URLROOT; ?>/css/style.css"></head>
</head>
<body>
<h2><?= $data['toets']; ?></h2>
<table>
        <thead>
            <th>Naam Examinator</th>
            <th>Datum Examen</th>
            <th>Rijbewijscategorie</th>
            <th>Rijschool</th>
            <th>Stad</th>
            <th>Uitslag Examen</th>
        </thead>
        <tbody>
            <?= $data['tableRows']; ?>
        </tbody>
    </table>

</body>
</html>