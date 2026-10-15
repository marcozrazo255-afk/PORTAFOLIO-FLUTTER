<?php
include("conexion.php");
if(isset($_GET['id_categoria'])){
    $id = $_GET['id_categoria'];
    $sql = "DELETE FROM carreras WHERE id_categoria=$id";

    if($conexion->query($sql)){
        echo 'categoria Eliminada';
    }else{
        echo 'Error'.$conexion->error;
    }
}else{
    echo 'Datos vacios';
}
?>