<?php
include("conexion.php");

if(isset($_GET['nip'])){
    $nip = $_GET['nip'];
    
   
    $sql = "select count(*) as existe, id_usuario from usuarios where nip = '$nip' group by id_usuario";
    $resultado = $conexion->query($sql);
    
    if ($resultado && $fila = $resultado->fetch_assoc()) {
        if ($fila['existe'] > 0) {
           
            echo "Acceso correcto," . $fila['id_usuario'];
        } else {
            echo "NIP incorrecto";
        }
    } else {
        echo "NIP incorrecto";
    }
} else {
    echo "Faltan datos en la URL";
}
?>