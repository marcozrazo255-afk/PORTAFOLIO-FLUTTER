<?php
include("conexion.php");

if(isset($_GET['nip'])){
    $nip = $_GET['nip'];
    $sql = "select * from usuarios where nip = '$nip'";
    $resultado = $conexion->query($sql);

    $dato = array();
    while($fila=$resultado->fetch_all(MYSQLI_ASSOC)){
        $dato = $fila;
    }
    echo json_encode($dato);
} else {
    echo "Faltan datos en la URL";
}
?>