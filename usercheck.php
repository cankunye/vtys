<?php
    $email = $_POST['email'];
    $password = $_POST['password'];  

    $db_conn = pg_connect("host=localhost dbname=phonenow user=postgres password=root");
    $result = pg_query($db_conn, " SELECT  *  FROM users ;");

    $login = false;
    $isAdmin = 0;

    while ($row = pg_fetch_assoc($result) ){
        if($row['email'] === $email && $row['password'] === $password){
            $login = true;
            $isAdmin = $row['isAdmin'];
        }
    }

    if($login)
    {
        
        if($isAdmin == 1)
        {
            ?>
            <div class="container">  
            <form id="contact" action="addphone.php" method="post">
                <h3>Yeni Bir telefon Eklemeniz icin Bu formu doldurun</h3>
                <fieldset>
                <input placeholder="Phone Adi" type="text"  name="phone-name" tabindex="1" required autofocus>
                </fieldset>
                <fieldset>
                <input placeholder="Company Id" type="number"  name="company-id" tabindex="2" required>
                </fieldset>
                <fieldset>
                <input placeholder="Price" type="number" name="price" tabindex="3" required>
                </fieldset>
                <fieldset>
                <input placeholder="Phone Likes" type="number"  name="likes" tabindex="5" required>
                </fieldset>
                <fieldset>
                <input placeholder="Phone Dislikes" type="number"  name="dislikes" tabindex="6" required>
                </fieldset>
                <fieldset>
                <input placeholder="Phone content" type="text"  name="content" tabindex="7" required>
                </fieldset>
                <fieldset>
                <input placeholder="Camera MP" type="number"  name="camera" tabindex="8" required>
                </fieldset>
                <fieldset>
                <input placeholder="quantity" type="number"  name="quantity" tabindex="9" required>
                </fieldset>
                <fieldset>
                <input placeholder="vendorID" type="number"  name="vendorID" tabindex="10" required>
                </fieldset>
                <button name="submit" type="submit" id="contact-submit" data-submit="...Sending">Submit</button>
                </fieldset>
              </form>
            </div>
            
            <div class="container">          
                <form id="contact" action="removephone.php" method="post">
                    <h3>Telefonu silmek icin telefon id ekleyin</h3>
                    <fieldset>
                        <input placeholder="phone-id" type="number"  name="phone-id" tabindex="1" required>
                    </fieldset>
                    <button name="submit" type="submit" id="remove-submit" data-submit="...Sending">Submit</button>
                </form>
            </div>
            
            <?php 
        }
        else
        {
            // echo "<script>
            //     alert('Login Basirli');
            //     window.location.href='index.php';
            //     </script>";
        }
   
       
    
        

   }
    else
    {    
        echo "<script>
            alert('Sifre veya kullanici adi yanlis');
            window.location.href='login.php';
            </script>";
    }
    
	
?>

<link rel="stylesheet" href="./css/usercheck.css">