

<?php
     $conexion = new mysqli("localhost","root","123456789","escuela");

     if($conexion->connect_error){
        die("Error");
     }
?>