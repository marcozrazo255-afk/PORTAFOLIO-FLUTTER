<?php 

    include("conexion.php");
    $sql = "Select * from usuario102026";
    $resultado = $conexion->query($sql);

    $datos = array();
    while($fila = $resultado->fetch_assoc() ){
        $datos[] = $fila;
    }
    echo json_encode($datos);
?>