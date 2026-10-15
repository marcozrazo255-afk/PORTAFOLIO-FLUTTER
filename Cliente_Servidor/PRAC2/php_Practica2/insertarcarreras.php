

<?php

include("conexion.php");

if(isset($_GET['nombre']) && isset($_GET['duracion'])){
    $nom = $_GET['nombre'];
    $dura = $_GET['duracion'];
    $sql = "INSERT INTO carreras(nombre,duracion) VALUES ('$nom','$dura')";
    if($conexion->query($sql)){
        echo "Insertado";
    } else {
        echo "Error: ";
    }
} else {
    echo "Faltan datos en la URL";
}