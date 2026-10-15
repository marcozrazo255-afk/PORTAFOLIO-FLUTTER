
<?php
     $conexion = new mysqli("localhost","root","1234567","videojuegos");

     if($conexion->connect_error){
        die("Error");
     }
?>