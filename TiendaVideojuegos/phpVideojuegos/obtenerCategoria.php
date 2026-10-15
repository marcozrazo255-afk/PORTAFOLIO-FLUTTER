<?php
     include("conexion.php");

     $sql = "select * from categorias";
     $resultado = $conexion->query($sql);

     $dato = array();

     while($fila=$resultado->fetch_all()){
        $dato = $fila;
     }

     echo json_encode($dato);
?>