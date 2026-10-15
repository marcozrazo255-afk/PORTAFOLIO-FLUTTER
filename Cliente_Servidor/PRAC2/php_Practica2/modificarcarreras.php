


<?php
include("conexion.php");
if(isset($_GET['id_carrera']) && isset($_GET['nombre']) && isset($_GET['duracion'])){
    $id = $_GET['id'];
    $nom = $_GET['nombre'];
    $dura = $_GET['duracion'];

    $sql = "UPDATE carreras SET nombre='$nom', duracion='$dura' WHERE id_carrera=$id";

    if($conexion->query($sql)){
        echo 'Usuario Modificado';
    }else{
        echo 'Error'.$conexion->error;
    }
}else{
   echo 'Faltan datos';
}
?>