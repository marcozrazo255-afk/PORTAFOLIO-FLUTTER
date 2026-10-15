

<?php
include("conexion.php");
if(isset($_GET['id'])){
    $id = $_GET['id'];
    $sql = "DELETE FROM alumnos WHERE id_alumno=$id";

    if($conexion->query($sql)){
        echo 'alumno Eliminado';
    }else{
        echo 'Error'.$conexion->error;
    }
}else{
    echo 'Datos vacios';
}
?>