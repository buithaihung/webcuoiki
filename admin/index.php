
<?php include('header.php'); ?>

<?php 

if(!isset($_SESSION['admin_logged_in'])){
  header('location: login.php');
  exit();
}

?>


<?php 

 //1. determine page no
 if(isset($_GET['page_no']) && $_GET['page_no'] != ""){
  //if user has already entered page then page number is the one that they selected
   $page_no = $_GET['page_no'];
}else{
  //if user just entered the page then default page is 1
  $page_no = 1;
}



//2. return number of products
$stmt1 = $conn->prepare("SELECT COUNT(*) As total_records FROM orders");
$stmt1->execute();
$stmt1->bind_result($total_records);
$stmt1->store_result();
$stmt1->fetch();


//3. products per page
$total_records_per_page = 10;

$offset = ($page_no-1) * $total_records_per_page;

$previous_page = $page_no - 1;
$next_page = $page_no + 1;

$adjacents = "2";

$total_no_of_pages = ceil($total_records/$total_records_per_page);



//4. get all products

$stmt2 = $conn->prepare("SELECT * FROM orders LIMIT $offset,$total_records_per_page");
$stmt2->execute();
$orders = $stmt2->get_result();


?>

<div class="container-fluid">
  <div class="row" style="min-height: 1000px">
  
    <?php include('sidemenu.php'); ?>

    <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
      <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
        <h1 class="h2">Dashboard</h1>
        <div class="btn-toolbar mb-2 mb-md-0">
          <div class="btn-group me-2">
          
          </div>
     
        </div>
      </div>

    

      <h2>Orders</h2>

      <?php if (isset($_GET['order_updated'])) { ?>
        <p class="text-center" style="color: green;"><?php echo $_GET['order_updated']; ?></p>
      <?php } ?>

      <?php if (isset($_GET['order_failed'])) { ?>
        <p class="text-center" style="color: red;"><?php echo $_GET['order_failed']; ?></p>
      <?php } ?>

      <?php if (isset($_GET['deleted_successfully'])) { ?>
        <p class="text-center" style="color: green;"><?php echo $_GET['deleted_successfully']; ?></p>
      <?php } ?>

      <?php if (isset($_GET['deleted_failure'])) { ?>
        <p class="text-center" style="color: red;"><?php echo $_GET['deleted_failure']; ?></p>
      <?php } ?>

      

      <div class="table-responsive">
        <table class="table table-striped table-sm">
          <thead>
            <tr>
              <th scope="col">Order ID</th>
              <th scope="col">Order Status</th>
              <th scope="col">User ID</th>
              <th scope="col">Order Date</th>
              <th scope="col">User Phone</th>
              <th scope="col">User Address</th>
              <th scope="col">Edit</th>
              <th scope="col">Delete</th>
            </tr>
          </thead>
          <tbody>

            <?php foreach ($orders as $order) { ?>
              <tr>
                <td><?php echo $order['order_id']; ?></td>
                <td><?php echo $order['order_status']; ?></td>
                <td><?php echo $order['user_id']; ?></td>
                <td><?php echo $order['order_date']; ?></td>
                <td><?php echo $order['user_phone']; ?></td>
                <td><?php echo $order['user_address']; ?></td>

                <td><a class="btn btn-primary" href="edit_order.php?order_id=<?php echo $order['order_id']; ?>">Edit</a></td>
                <td><a class="btn btn-danger" href="delete_order.php?order_id=<?php echo $order['order_id'];?>">Delete</a></td>

              </tr>

            <?php } ?>
          </tbody>
        </table>
        <nav aria-label="Page navigation example" class="mx-auto">
            <ul class="pagination mt-5 mx-auto">

                <li class="page-item <?php if($page_no<=1){echo 'disabled';}?> ">
                    <a class="page-link"
                        href="<?php if($page_no <= 1){echo '#';}else{ echo "?page_no=".($page_no-1);} ?>">Previous</a>
                </li>


                <li class="page-item"><a class="page-link" href="?page_no=1">1</a></li>
                <li class="page-item"><a class="page-link" href="?page_no=2">2</a></li>

                <?php if( $page_no >=3) {?>
                <li class="page-item"><a class="page-link" href="#">...</a></li>
                <li class="page-item"><a class="page-link"
                        href="<?php echo "?page_no=".$page_no;?>"><?php echo $page_no;?></a></li>
                <?php } ?>



                <li class="page-item <?php if($page_no >=  $total_no_of_pages){echo 'disabled';}?>">
                    <a class="page-link"
                        href="<?php if($page_no >= $total_no_of_pages ){echo '#';} else{ echo "?page_no=".($page_no+1);}?>">Next</a>
                </li>
            </ul>
        </nav>
      </div>
    </main>
  </div>
</div>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>

      <script src="https://cdn.jsdelivr.net/npm/feather-icons@4.28.0/dist/feather.min.js" integrity="sha384-uO3SXW5IuS1ZpFPKugNNWqTZRRglnUJK6UAZ/gxOX80nxEkN9NcGZTftn6RzhGWE" crossorigin="anonymous"></script><script src="https://cdn.jsdelivr.net/npm/chart.js@2.9.4/dist/Chart.min.js" integrity="sha384-zNy6FEbO50N+Cg5wap8IKA4M/ZnLJgzc6w2NqACZaK0u0FXfOWRRJOnQtpZun8ha" crossorigin="anonymous"></script>
      <script src="dashboard.js"></script>
  </body>
</html>
