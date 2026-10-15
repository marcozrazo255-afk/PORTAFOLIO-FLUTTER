

<?php 
    include("conexion.php");
    if(isset($_GET['id'])){
    $id = $_GET['id'];

    $sql = "DELETE FROM usuario102026 WHERE id='$id'";
    if($conexion -> query($sql)) {
        echo 'Usuario eliminado';
    }else {
        echo 'Error'.$conexion->error;

        }
    } else{
        echo "Datos Vacios";
    }   
        
        
    

?>