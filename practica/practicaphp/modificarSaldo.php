<?php
include("conexion.php");

if(isset($_GET['id_usuario']) && isset($_GET['cantidad']) && isset($_GET['accion'])){
    $id = $_GET['id_usuario'];
    $cant = $_GET['cantidad'];
    $acc = $_GET['accion']; 

 
    if($acc == 'ingresar'){
        $sql = "UPDATE movimientos SET saldo = saldo + '$cant' WHERE id_usuario = $id";
    } else {
        $sql = "UPDATE movimientos SET saldo = saldo - '$cant' WHERE id_usuario = $id";
    }

    if($conexion->query($sql)){
        echo 'Usuario Modificado'; 
    }else{
        echo 'Error'.$conexion->error;
    }
}else{
   echo 'Faltan datos';
}
?>