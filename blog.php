<?php 
    $db_conn = pg_connect("host=localhost dbname=phonenow user=postgres password=root");
    $query = pg_query($db_conn, "SELECT * FROM posts;");

    while($result = pg_fetch_assoc($query))
    {
        echo "<h1> Post number ".$result['id']."</h1>";
        echo "<h3> ".$result['heading']."</h3>";
        echo "<p> ".$result['content']."</p>";
    }

?>