<?php 

    $conexion = new mysqli("localhost","root","1234567","clienteservidorp1");

    if($conexion->connect_error){
        die("Error, Falló la conexión con el servidor");
    }

?>