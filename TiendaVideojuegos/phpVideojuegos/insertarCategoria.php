<?php

include("conexion.php");

if(isset($_GET['categoria']) && isset($_GET['nombre_categoria'])){
    $nom = $_GET['nombre'];
    $cate = $_GET['categoria'];
    
    $sql = "INSERT INTO carreras(id_categoria, nombre_categoria) VALUES ('$nom','$cate')";
    if($conexion->query($sql)){
        echo "Insertado";
    } else {
        echo "Error: ";
    }
} else {
    echo "Faltan datos en la URL";
}