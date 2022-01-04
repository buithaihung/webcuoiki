<?php include('header.php'); ?>

<div class="container-fluid">
  <div class="row"  style="min-height: 1000px">
    <?php include('sidemenu.php'); ?>


    <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
      <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
        <h1 class="h2">Dashboard</h1>
        <div class="btn-toolbar mb-2 mb-md-0">
          <div class="btn-group me-2">
          
          </div>
     
        </div>
      </div>

    

      <h2>Create Product</h2>
      <div class="table-responsive">
      


          <div class="mx-auto container">
              <form id="create-form"  enctype="multipart/form-data" method="POST" action="create_product.php">
                <p style="color: red;"><?php if(isset($_GET['error'])){ echo $_GET['error']; }?></p>
                <div class="form-group mt-2">
                    <label>Title</label>
                    <input type="text" class="form-control" id="product-name" name="name" placeholder="Title" required/>
                </div>
                  <div class="form-group mt-2">
                      <label>Description</label>
                      <input type="text" class="form-control" id="product-desc" name="description" placeholder="Description" required/>
                  </div>
                  <div class="form-group mt-2">
                    <label>Price</label>
                    <input type="text" class="form-control" id="product-price" name="price" placeholder="Price" required/>
                </div>
                  <div class="form-group mt-2">
                    <label>Quantity</label>
                    <input type="number" min="0" class="form-control" id="product-quantity" name="quantity" placeholder="Quantity" required/>
                </div>
                 <div class="form-group mt-2">
                    <label>Special Offer/Sale</label>
                    <input type="number" class="form-control" id="product-offer" name="offer" placeholder="Sale %" required/>
                </div>



                <div class="form-group mt-2">
                    <label>Category</label>
                    <select  class="form-select" required name="category">
                        <option value="bags">Bags</option>
                        <option value="shoes">Shoes</option>
                        <option value="watches">Watches</option>
                        <option value="clothes">Clothes</option>
                    </select>
                </div>


                <div class="form-group mt-2">
                      <label>Color</label>
                      <input type="text" class="form-control" id="product-color" name="color" placeholder="Color" required/>
                  </div>

                <div class="form-group mt-2">
                    <label>Image 1</label>
                    <input type="file" class="form-control" id="image1" name="image1" placeholder="Image 1" required/>
                </div>

                <div class="form-group mt-2">
                    <label>Image 2</label>
                    <input type="file" class="form-control" id="image2" name="image2" placeholder="Image 2" required/>
                </div>

                <div class="form-group mt-2">
                    <label>Image 3</label>
                    <input type="file" class="form-control" id="image3" name="image3" placeholder="Image 3" required/>
                </div>

                  <div class="form-group mt-2">
                    <label>Image 4</label>
                    <input type="file" class="form-control" id="image4" name="image4" placeholder="Image 4" required/>
                </div>
          

                <div class="form-group mt-3">
                    <input type="submit" class="btn btn-primary" name="create_product" value="Create"/>
                </div>
 
              </form>
          </div>
    




      </div>
    </main>
  </div>
</div>




  </body>
</html>
