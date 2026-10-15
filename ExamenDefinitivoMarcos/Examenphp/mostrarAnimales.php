<?php
include("conexion.php");


header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");


$sql = "SELECT 
            C.Nombre AS nombre, 
            A.raza, 
            A.anio, 
            C.Descripcion AS descripcion 
        FROM Clasificacion C 
        INNER JOIN Animales A ON C.id_animales = A.id_animales";

$resultado = mysqli_query($conexion, $sql);
$animales = array();

while ($fila = mysqli_fetch_assoc($resultado)) {
    $animales[] = $fila;
}

echo json_encode($animales);
?>
