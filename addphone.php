<?php 
        $db_conn = pg_connect("host=localhost dbname=phonenow user=postgres password=root");
        
        $name = $_POST['phone-name'];
        $compID = $_POST['company-id'];  
        $price = $_POST['price'];
        $likes = $_POST['likes'];
        $dislikes = $_POST['dislikes'];
        $content = $_POST['content'];
        $camera = $_POST['camera'];
        $quantity = $_POST['quantity'];
        $vendorID = $_POST['vendorID'];
       
        $insertPhone = pg_query($db_conn, "INSERT INTO phone(company_id , NAME, price) VALUES ($compID,'$name',$price);");
        $result = pg_query($db_conn, " SELECT  *  FROM phone ;");
        
        $maxID = 0;
        while($row = pg_fetch_assoc($result))
        {
            $maxID = $row['id'];
        }       
        
        $insertLikes= pg_query($db_conn, "INSERT INTO phone_likes(phone_id, likes,dislikes) VALUES ($maxID,$likes,$dislikes);");
        $insertDescription= pg_query($db_conn, "INSERT INTO description(phone_id, content,camera_mp) VALUES ($maxID,'$content',$camera);");
        $insertQuantity= pg_query($db_conn, "INSERT INTO quantity(phone_id, quantity,vendor_id) VALUES ($maxID,$quantity,$vendorID);");
               
        if($insertPhone)
        {
            echo "<script>
                alert('Basirli');
                window.location.href='products.php';
                </script>";
        }
        else
        {
            echo "<script>
            alert('Basirsiz');
            window.location.href='products.php';
            </script>";
        }
?>