<?php

include('connection.php');


$stmt = $conn->prepare("SELECT * FROM products WHERE product_category='chair' LIMIT 4");

$stmt->execute();


$chair = $stmt->get_result();//[]





?>