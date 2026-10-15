<?php 

    include("conexion.php");
    
if(isset($_GET['usuario']) && isset($_GET['password'])){
    $usu = $_GET['usuario'];
    $pass = $_GET['password'];
    $sql = "INSERT INTO usuario102026 (usuario, password) values ('$usu','$pass')";
    
    if($conexion->query($sql)){
        echo "INSERTADO";
     } else{
        echo "ERROR";$conexion->error;
     }

    } else{
        echo "Faltan datos de la URL";
    }

?>