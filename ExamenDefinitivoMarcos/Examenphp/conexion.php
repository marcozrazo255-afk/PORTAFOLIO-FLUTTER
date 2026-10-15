<?php
     $conexion = new mysqli("localhost","root","1234567","mascotas");

     if($conexion->connect_error){
        die("Error");
     }
?>