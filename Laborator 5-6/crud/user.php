<?php
include 'connect.php';
if(isset($_POST['submit'])){
    $nume=$_POST['name'];
    $caracter=$_POST['caracter'];
    $viata=$_POST['viata'];
    $arme=$_POST['arme'];
    
    
    $sql="insert into `atacator` (nume,caracter,viata,arma)
    values('$nume','$caracter','$viata','$arme')";
    $result=mysqli_query($con,$sql);
    if($result){
        // echo "Datele au fost inserate cu succes";
        header('location:../crud/display.php');
    }else{
        die(mysqli_error($con));
    }
}
?>





<!doctype html> 
<html lang="en"> 
    <head> 
    <meta charset="utf-8"> 
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"> 
   
     <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"> 
     <link rel="stylesheet" href="style.css">
     <link rel="stylesheet" href="../login.css">
     <title>CRUD Operation</title> 
    </head> 
    <body> 
        <div class="containter"> 
            <form name="adaugaAntagonist" method="post" class="text-light"> 
                <div class="form-group"> 
                    <label>Nume personaj</label> 
                    <input type="text" class="form-control" placeholder="nume" name="name" autocomplete="off"> 
                </div> 
                <div class="form-group"> 
                    <label>Caracterul personajului</label> 
                    <input type="text" class="form-control" placeholder="caracter" name="caracter" autocomplete="off"> 
            </div> 
            <div class="form-group"> 
                <label>Viata personajului</label> 
                <input type="text" class="form-control" placeholder="viata" name="viata" autocomplete="off"> 
            </div> 
            <div class="form-group">
                <label>Arme</label>
                <select name="arme">
                <?php
                $res=mysqli_query($con,"select * from arme");
                while($row=mysqli_fetch_array($res))
                {
                    ?>
                    <option><?php echo $row["nume_arme"]; ?> </option>
                    <?php
                }


                ?>
                </select>
            </div>
            
            <button type="submit" class="btn btn-primary" name="submit">Submit</button> 
            <button  class="btn btn-primary" ><a href="display.php">Inapoi</a></button>
        </form> 
    </div> 


    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.2/dist/jquery.validate.min.js"></script>
    
     <script>
    $(function () {
        $("form[name='adaugaAntagonist']").validate({
            
            rules: {
                nume: "required",
                caracter: "required",
                viata: "required"
            },
            
            messages: {
                nume: {
                    required: "Va rog introduceti un nume"
            },
                caracter: {
                    required: "Va rog introduceti un tip de caracter"
                },
                viata:{
                    required: "Va rog introduceti viata antagonistului"
                }
            },
            submitHandler: function (form) {

              form.submit();
              
            }
        });
    }); 
</script>

</body> 
</html>