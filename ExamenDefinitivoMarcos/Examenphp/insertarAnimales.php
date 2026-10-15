<?php
include("conexion.php");

if(isset($_GET['nombre']) && isset($_GET['raza']) && isset($_GET['anio']) && isset($_GET['descripcion'])){
    $nombre = $_GET['nombre'];
    $raza = $_GET['raza'];
    $anio = $_GET['anio']; 
    $descripcion = $_GET['descripcion'];

    $sqlAnimal = "INSERT INTO Animales(raza, anio) VALUES ('$raza', '$anio')";
    
    if($conexion->query($sqlAnimal)){
      
        $id_animales = $conexion->insert_id;
        
       
        $sqlClasificacion = "INSERT INTO Clasificacion(Nombre, Descripcion, id_animales) 
                             VALUES ('$nombre', '$descripcion', '$id_animales')";
        
        if($conexion->query($sqlClasificacion)){
            echo "Mascota registrada correctamente";
        } else {
            echo "Error en Clasificacion: " . $conexion->error;
        }
    } else {
        echo "Error en Animales: " . $conexion->error;
    }
} else {
    echo "Faltan datos en la URL";
}
?>
