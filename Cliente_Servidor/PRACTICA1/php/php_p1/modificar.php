
<?php 
    include("conexion.php");
    if(isset($_GET['id']) && isset($_GET['usuario']) && isset($_GET['password'])) {
        $id = $_GET['id'];
        $usuario = $_GET['usuario'];
        $password = $_GET['password'];

        $sql = "UPDATE usuario102026 SET usuario = '$usuario', password='$password' WHERE id=$id";

        if($conexion -> query($sql)) {
            echo 'Usuario modificado'; 
        }else {
            echo 'Error'.$conexion->error;
    }

    } else{
        echo "Faltan datos";
    }
?> 