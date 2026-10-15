<?php
include("conexion.php");
if(isset($_GET['id_videojuego'])){
    $id = $_GET['id_videojuego'];
    $sql = "DELETE FROM tiendavideojuegos WHERE id_videojuego=$id";

    if($conexion->query($sql)){
        echo 'videojuego Eliminado';
    }else{
        echo 'Error'.$conexion->error;
    }
}else{
    echo 'Datos vacios';
}
?>