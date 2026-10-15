

<?php
     include("conexion.php");

     $sql = "select * from carreras";
     $resultado = $conexion->query($sql);

     $dato = array();

     while($fila=$resultado->fetch_all()){
        $dato = $fila;
     }

     echo json_encode($dato);
?>