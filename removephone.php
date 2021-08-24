<?php 
        $db_conn = pg_connect("host=localhost dbname=phonenow user=postgres password=root");
        $id = $_POST['phone-id'];

        $likesQuery = "DELETE FROM phone_likes WHERE phone_id = $id;";
        $descriptionQuery = "DELETE FROM description WHERE phone_id = $id;";
        $quantityQuery = "DELETE FROM quantity WHERE phone_id = $id;"; 
        $phoneQuery = "DELETE FROM phone WHERE id = $id;";
        
        $query1 = pg_query($db_conn, $likesQuery);
        $query2 = pg_query($db_conn, $descriptionQuery);
        $query3 = pg_query($db_conn, $quantityQuery);
        $query4 = pg_query($db_conn, $phoneQuery);

        $findMaxIdQuery = pg_query($db_conn, "SELECT * FROM quantity;");
        $findMaxIdDescp = pg_query($db_conn, "SELECT * FROM description;");
        $findMaxlikesQuery = pg_query($db_conn, "SELECT * FROM phone_likes;");

        $maxQuantityId;
        $maxDescriptionId;
        $maxPhoneLikesId;
        
        while($result = pg_fetch_assoc($findMaxIdQuery))
        {
                $maxQuantityId = $result['id'];
        }

        while($result = pg_fetch_assoc($findMaxIdDescp))
        {
                $maxDescriptionId = $result['id'];
        }

        while($result = pg_fetch_assoc($findMaxlikesQuery))
        {
                $maxPhoneLikesId = $result['id'];
        }

        $resetQuery1 = pg_query($db_conn, "ALTER SEQUENCE quantity_id_seq RESTART WITH $maxQuantityId;");
        $resetQuery1 = pg_query($db_conn, "ALTER SEQUENCE phone_likes_id_seq RESTART WITH $maxPhoneLikesId;");
        $resetQuery1 = pg_query($db_conn, "ALTER SEQUENCE description_id_seq RESTART WITH $maxDescriptionId;");

    
            echo "<script>
                alert('Basirli');
                window.location.href='products.php';
                </script>";
        
?>