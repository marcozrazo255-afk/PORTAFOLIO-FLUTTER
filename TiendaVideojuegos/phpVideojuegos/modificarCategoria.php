<?php
include("conexion.php");


if(isset($_GET['id_categoria']) && isset($_GET['nombre']) ){
    
    $id   = $_GET['id_categoria'];
    $nom  = $_GET['nombre'];
   
  
    $sql = "UPDATE categorias 
            SET  nombre='$nom'
            WHERE id_videojuego=$id";

    if($conexion->query($sql)){
        echo 'categoria Modificado';
    }else{
        echo 'Error: ' . $conexion->error;
    }
}else{
   echo 'Faltan datos en la URL';
}
?>