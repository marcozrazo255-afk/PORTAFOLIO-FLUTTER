



<?php
include("conexion.php");
if(isset($_GET['id'])){
    $id = $_GET['id'];
    $sql = "DELETE FROM carreras WHERE id_carrera=$id";

    if($conexion->query($sql)){
        echo 'carrera Eliminado';
    }else{
        echo 'Error'.$conexion->error;
    }
}else{
    echo 'Datos vacios';
}
?>