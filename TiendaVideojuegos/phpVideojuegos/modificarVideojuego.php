<?php
include("conexion.php");


if(isset($_GET['id_videojuego']) && isset($_GET['nombre']) && isset($_GET['precio']) && isset($_GET['plataforma']) && isset($_GET['categoria'])){
    
    $id   = $_GET['id_videojuego'];
    $nom  = $_GET['nombre'];
    $pre  = $_GET['precio'];
    $plat = $_GET['plataforma'];
    $cate = $_GET['categoria'];

  
    $sql = "UPDATE tiendavideojuegos 
            SET nombre_categoria='$nom', precio='$pre', plataforma='$plat', id_categoria='$cate' 
            WHERE id_videojuego=$id";

    if($conexion->query($sql)){
        echo 'Videojuego Modificado';
    }else{
        echo 'Error: ' . $conexion->error;
    }
}else{
   echo 'Faltan datos en la URL';
}
?>