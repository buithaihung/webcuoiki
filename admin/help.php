<?php include('header.php'); ?>

<?php 
   
    if(!isset($_SESSION['admin_logged_in'])){
          header('location: login.php');
          exit();

    }

?>
          

<div class="container-fluid">
  <div class="row" style="min-height: 1000px">
   


     <?php include('sidemenu.php'); ?>





    <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
      <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
        <h1 class="h2">Help</h1>
        <div class="btn-toolbar mb-2 mb-md-0">
          <div class="btn-group me-2">
          
          </div>
     
        </div>
      </div>
       

      <div class="container mt-3">
        <p>Please contact truongln2k@gmail.com</p>
        <p>Please call 0348 471 459</p>
      </div>
   

      </div>
    </main>
  </div>




</div>



  </body>
</html>
