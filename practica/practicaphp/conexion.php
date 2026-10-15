<?php
     $conexion = new mysqli("localhost","root","1234567","cajero_db");

     if($conexion->connect_error){
        die("Error");
     }
?>