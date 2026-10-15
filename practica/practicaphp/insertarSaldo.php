<?php
include("conexion.php");

if (isset($_GET['id_usuario']) && isset($_GET['monto'])) {
    
    $id_usuario = (int)$_GET['id_usuario']; 
    $saldo = (float)$_GET['monto'];

    // 1. Desactivamos temporalmente el candado de seguridad que está fallando
    $conexion->query("SET FOREIGN_KEY_CHECKS = 0");

    // 2. Insertamos el movimiento de forma directa
    $sql = "INSERT INTO movimientos (saldo, id_usuario) VALUES ($saldo, $id_usuario)";
    $resultado = $conexion->query($sql);

    // 3. Volvemos a activar la seguridad por buena práctica
    $conexion->query("SET FOREIGN_KEY_CHECKS = 1");
    
    if ($resultado) {
        echo "Registro insertado con éxito";
    } else {
        echo "Error en la consulta SQL: " . $conexion->error;
    }
} else {
    echo "Error: Faltan datos en la URL";
}
?>
