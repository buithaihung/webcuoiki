
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
$stmt1 = $conn->prepare("SELECT COUNT(*) As total_records FROM users");
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

$stmt2 = $conn->prepare("SELECT * FROM users LIMIT $offset,$total_records_per_page");
$stmt2->execute();
$users = $stmt2->get_result();


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

    

      <h2>Users</h2>      

      <div class="table-responsive">
        <table class="table table-striped table-sm">
          <thead>
            <tr>
              <th scope="col">User ID</th>
              <th scope="col">User Name</th>
              <th scope="col">User Email</th>
            </tr>
          </thead>
          <tbody>

            <?php foreach ($users as $user) { ?>
              <tr>
                <td><?php echo $user['user_id']; ?></td>
                <td><?php echo $user['user_name']; ?></td>
                <td><?php echo $user['user_email']; ?></td>

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



  </body>
</html>
