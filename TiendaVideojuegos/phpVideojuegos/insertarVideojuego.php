<?php

include("conexion.php");

if(isset($_GET['nombre']) && isset($_GET['precio'])&& isset($_GET['plataforma'])&& isset($_GET['categoria'])){
    $nom = $_GET['nombre'];
    $pre = $_GET['precio'];
    $plat = $_GET['plataforma'];
    $cate = $_GET['categoria'];
    $sql = "INSERT INTO carreras(nombre_categoria, precio, plataforma, id_categoria) VALUES ('$nom','$pre','$plat','$cate')";
    if($conexion->query($sql)){
        echo "Insertado";
    } else {
        echo "Error: ";
    }
} else {
    echo "Faltan datos en la URL";
}