


<?php

include("conexion.php");

if(isset($_GET['nombre']) && isset($_GET['edad'])&& isset($_GET['id_carreras'])){
    $nom = $_GET['nombre'];
    $edad = $_GET['edad'];
    $id_carreras= $_GET['id_carreras'];
    $sql = "INSERT INTO alumnos(nombre,edad,id_carreras) VALUES ('$nom','$edad','$id_carreras')";
    if($conexion->query($sql)){
        echo "Insertado";
    } else {
        echo "Error: ";
    }
} else {
    echo "Faltan datos en la URL";
}