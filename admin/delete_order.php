<?php 

session_start();
 
  include('../server/connection.php');

?>


<?php 
   
   if(!isset($_SESSION['admin_logged_in'])){
         header('location: login.php');
         exit();

   }


   if(isset($_GET['order_id']) && isset($_GET['order_status'])){
        $test = false;

        $order_id = $_GET['order_id'];
        $stmt = $conn->prepare("DELETE FROM orders WHERE order_id=?");
        $stmt->bind_param('i',$order_id);
        $test = true;
        $stmt->execute();

        if($_GET['order_status'] == 'not paid'){
          $stmt1 = $conn->prepare("SELECT product_id, product_quantity FROM order_items WHERE order_id=?");
          $stmt1->bind_param('i',$order_id);
          $stmt1->execute();
          $stmt1->bind_result($product_id, $product_quantity);
          $stmt1->store_result();
          $stmt1->fetch();

          $stmt4 = $conn->prepare("DELETE FROM order_items WHERE order_id=?");
          $stmt4->bind_param('i',$order_id);
          $stmt4->execute();

          $stmt2 = $conn->prepare("SELECT max_product_quantity FROM products WHERE product_id=?");
          $stmt2->bind_param('i',$product_id);
          $stmt2->execute();
          $stmt2->bind_result($max_product_quantity);
          $stmt2->store_result();
          $stmt2->fetch();

          $max_product_quantity = $max_product_quantity + $product_quantity;

          $stmt3= $conn->prepare("UPDATE products SET max_product_quantity=? WHERE product_id=?");
          $stmt3->bind_param('ii',$max_product_quantity,$product_id);
          $stmt3->execute();
        } else {
          $stmt4 = $conn->prepare("DELETE FROM order_items WHERE order_id=?");
          $stmt4->bind_param('i',$order_id);
          $stmt4->execute();
        }

        if($test){

          header('location: index.php?deleted_successfully=Order has been deleted successfully');

        }else{
            header('location: index.php?deleted_failure=Could not delete order');
        }


        
   
   }

?>
