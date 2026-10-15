<?php

include("conexion.php");

if(isset($_GET['saldo']) && isset($_GET['cantidad_saldo'])){
    $sal = $_GET['saldo'];
    
    
    $sql = "INSERT INTO movimiento(id_saldo, id_usuario) VALUES ('$sal')";
    if($conexion->query($sql)){
        echo "Insertado";
    } else {
        echo "Error: ";
    }
} else {
    echo "Faltan datos en la URL";
}