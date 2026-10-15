<?php
include("conexion.php");

if(isset($_GET['nombre']) && isset($_GET['descripcion']) && isset($_GET['id_animales'])){
    $nombre = $_GET['nombre'];
    $descripcion = $_GET['descripcion'];
    $id_animales = $_GET['id_animales'];
    

    $sql = "INSERT INTO clasificacion(Nombre, Descripcion, id_animales) 
            VALUES ('$nombre', '$descripcion', '$id_animales')";
    
    if($conexion->query($sql)){
        echo "Clasificación insertada correctamente";
    } else {
        echo "Error al insertar clasificación: " . $conexion->error;
    }
} else {
    echo "Faltan datos de la clasificación en la URL";
}
?>  
