


<?php
include("conexion.php");
if(isset($_GET['id_alumno']) && isset($_GET['nombre']) && isset($_GET['edad'])){
    $id = $_GET['id_alumno'];
    $nom = $_GET['nombre'];
    $edad = $_GET['edad'];

    $sql = "UPDATE alumnis SET nombre='$nom', edad='$edad' WHERE id_alumnos=$id";

    if($conexion->query($sql)){
        echo 'Alumno Modificado';
    }else{
        echo 'Error'.$conexion->error;
    }
}else{
   echo 'Faltan datos';
}
?>