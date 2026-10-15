<?php
include("conexion.php");


if(isset($_GET['id_usuario']) && isset($_GET['nombre']) && isset($_GET['nip']) ){
    
    $id   = $_GET['id_usuario'];
    $nom  = $_GET['nombre'];
    $nip  = $_GET['nip'];
   
  
    $sql = "UPDATE categorias 
            SET  nombre='$nom'
                , nip='$nip'
            WHERE id_usuario='$id'";

    if($conexion->query($sql)){
        echo 'retiro Modificado';
    }else{
        echo 'Error: ' . $conexion->error;
    }
}else{
   echo 'Faltan datos en la URL';
}
?>