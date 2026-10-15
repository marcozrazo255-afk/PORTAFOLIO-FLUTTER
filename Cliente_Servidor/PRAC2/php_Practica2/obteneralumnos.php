

<?php
     include("conexion.php");

     $sql = "select * from alumnos";
     $resultado = $conexion->query($sql);

     $dato = array();

     while($fila=$resultado->fetch_all()){
        $dato = $fila;
     }

     echo json_encode($dato);
?>