<?php
    $name = $_POST['phone-name'];
    $db_conn = pg_connect("host=localhost dbname=phonenow user=postgres password=root");
    $result = pg_query($db_conn, " SELECT  *  FROM phone;");


    while ($row = pg_fetch_assoc($result) ){
      if($row['name'] === $name)
      {
         echo $row['name'];
         echo $price = $row['price'];
   
      }
    }

?>