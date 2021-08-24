<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />

  <!-- Favicon -->
  <link rel="shortcut icon" href="./images/favicon.ico" type="image/x-icon" />

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css2?family=Archivo:wght@400;700&display=swap" rel="stylesheet" />

  <!-- Carousel -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Glide.js/3.4.1/css/glide.core.min.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Glide.js/3.4.1/css/glide.theme.min.css">
  <!-- Animate On Scroll -->
  <link rel="stylesheet" href="https://unpkg.com/aos@next/dist/aos.css" />

  <!-- Custom StyleSheet -->
  <link rel="stylesheet" href="./css/styles.css" />

  <title>PhoneNow</title>
</head>

<body>
  <header id="header" class="header">
    <div class="navigation">
      <div class="container">
        <nav class="nav">
          <div class="nav__hamburger">
            <svg>
              <use xlink:href="./images/sprite.svg#icon-menu"></use>
            </svg>
          </div>

          <div class="nav__logo">
            <a href="/" class="scroll-link">
              PHONENOW
            </a>
          </div>

          <div class="nav__menu">
            <div class="menu__top">
              <span class="nav__category">PHONE</span>
              <a href="#" class="close__toggle">
                <svg>
                  <use xlink:href="./images/sprite.svg#icon-cross"></use>
                </svg>
              </a>
            </div>
            <ul class="nav__list">
              <li class="nav__item">
                <a href="/" class="nav__link">Home</a>
              </li>
              <li class="nav__item">
                <a href="#" class="nav__link">Products</a>
              </li>
              <li class="nav__item">
                <a href="#" class="nav__link">Blog</a>
              </li>
              <li class="nav__item">
                <a href="#" class="nav__link">Contact</a>
              </li>
            </ul>
          </div>

          <div class="nav__icons">
            <a href="#" class="icon__item">
              <svg class="icon__user">
                <use xlink:href="./images/sprite.svg#icon-user"></use>
              </svg>
            </a>

            <a href="#" class="icon__item">
              <svg class="icon__search">
                <use xlink:href="./images/sprite.svg#icon-search"></use>
              </svg>
            </a>

            <a href="#" class="icon__item">
              <svg class="icon__cart">
                <use xlink:href="./images/sprite.svg#icon-shopping-basket"></use>
              </svg>
              <span id="cart__total">0</span>
            </a>
          </div>
        </nav>
      </div>
    </div>
</header>

  <main id="main">
    <?php
          $id = $_POST['phone-id'];
          $db_conn = pg_connect("host=localhost dbname=phonenow user=postgres password=root");
          $result = pg_query($db_conn, "SELECT * FROM phone WHERE id = ".$id.";");

          $description = pg_query($db_conn, "SELECT * FROM description WHERE id = ".$id.";");
          $quantity = pg_query($db_conn, "SELECT * FROM quantity WHERE id = ".$id.";");
          $review = pg_query($db_conn, "SELECT * FROM review WHERE id = ".$id.";");
                  
          while ($row = pg_fetch_assoc($result) ){
            $compID = $row['company_id'];
            $companyQuery = pg_query($db_conn, "SELECT * FROM phone_company WHERE id = ".$compID.";");
    ?>  

    <div class="container">
      <!-- Products Details -->
      <section class="section product-details__section">
        <div class="product-detail__container">
          
              <div class="product__picture" id="product__picture">
                <div class="picture__container">
                  <img src="<?php echo $row['imgAdrs'] ?>" id="pic" />                  
                </div>
              </div>

              <div class="zoom" id="zoom">
                  <h1><?php echo $row['name'] ?></h1>
                  
                  <div class="price">
                    <span class="new__price"><?php echo $row['price']  ?></span>
                  </div>

                  <div class="rating">
                          <!-- RATING HERE        -->
                  </div>
                  
                  <div class="product__info-container">
                      <ul class="product__info">              
                      <span>Brand:</span>
                      <a href="#"><?php 
                            while($st = pg_fetch_assoc($companyQuery))
                            {
                                echo $st['name'];
                      ?>
                      </a>
                  
                  <?php } ?>
                    
                    <p><span>Availability:</span>
                    <?php 
                        while($qt = pg_fetch_assoc($quantity))
                        {
                          echo $qt['quantity'];
                        }
                      }
                    ?>

                    <span> pieces </span>
                    </p>
                        
                    <a href="#" class="in-stock"></a>
                  </li>
                  </ul>
                  <div class="product-info__btn">
                 
              
                  <a href="#" class="rating__quatity"></a>
              </div>
          </div>

            <div class="product-details__btn">
              <a class="add" href="#">
                <span>
                  <svg>
                    <use xlink:href="./images/sprite.svg#icon-cart-plus"></use>
                  </svg>
                </span>
                ADD TO CART</a>
              <a class="buy" href="#">
                <span>
                  <svg>
                    <use xlink:href="./images/sprite.svg#icon-credit-card"></use>
                  </svg>
                </span>
                BUY NOW
              </a>
            </div>
          </div>

          <div class="product-detail__right">
            <div class="product-detail__content">           
              
             

              
             </div>
              <p>
              </p>
              <!-- description -->
                </div>
              </div>
            </div>
          </div>
        </div>
        
        <?php 
            while ($row = pg_fetch_assoc($description) ){
        ?>
        <div class="product-detail__bottom">       
                <h1 class="primary__title">Description</h1>
                
                <h3><?php echo $row['content']; ?></h3>
                <h3> Camera mp:  <?php echo $row['camera_mp']; ?> </h3>

                
               <?php } ?>
          
            <div class="section__titles">
              <div class="section__title detail-btn" data-id="reviews">
              <div class="content" id="reviews">
                <h1>Customer Reviews</h1>

                <?php 
                  while ($row = pg_fetch_assoc($review) ){ 
                    echo $row['review'];
                    $user = $row['user_id'];

                    $username = pg_query($db_conn, "SELECT * FROM users WHERE id = ".$user.";");
                    
                    while($col = pg_fetch_assoc($username))
                    {                   
                       echo  "<span>  -  ".$col['username']." </span>";
                    }         
               }?>
              </div>
              </div>
            </div>            
      </section>    
    </div> 
  </main>

  <!-- Footer -->
  <footer id="footer" class="section footer">
    <div class="container">
      <div class="footer__top">
        <div class="footer-top__box">
          <h3>EXTRAS</h3>
          <a href="#">Brands</a>
          <a href="#">Gift Certificates</a>
          <a href="#">Affiliate</a>
          <a href="#">Specials</a>
          <a href="#">Site Map</a>
        </div>
        <div class="footer-top__box">
          <h3>INFORMATION</h3>
          <a href="#">About Us</a>
          <a href="#">Privacy Policy</a>
          <a href="#">Terms & Conditions</a>
          <a href="#">Contact Us</a>
          <a href="#">Site Map</a>
        </div>
        <div class="footer-top__box">
          <h3>MY ACCOUNT</h3>
          <a href="#">My Account</a>
          <a href="#">Order History</a>
          <a href="#">Wish List</a>
          <a href="#">Newsletter</a>
          <a href="#">Returns</a>
        </div>
        <div class="footer-top__box">
          <h3>CONTACT US</h3>
          <div>
            <span>
              <svg>
                <use xlink:href="./images/sprite.svg#icon-location"></use>
              </svg>
            </span>
            42 Dream House, Dreammy street, 7131 Dreamville, USA
          </div>
          <div>
            <span>
              <svg>
                <use xlink:href="./images/sprite.svg#icon-envelop"></use>
              </svg>
            </span>
            company@gmail.com
          </div>
          <div>
            <span>
              <svg>
                <use xlink:href="./images/sprite.svg#icon-phone"></use>
              </svg>
            </span>
            456-456-4512
          </div>
          <div>
            <span>
              <svg>
                <use xlink:href="./images/sprite.svg#icon-paperplane"></use>
              </svg>
            </span>
            Dream City, USA
          </div>
        </div>
      </div>
    </div>
    <div class="footer__bottom">
      <div class="footer-bottom__box">

      </div>
      <div class="footer-bottom__box">

      </div>
    </div>
    </div>
  </footer>

  <!-- End Footer -->

  <!-- Go To -->

  <a href="#header" class="goto-top scroll-link">
    <svg>
      <use xlink:href="./images/sprite.svg#icon-arrow-up"></use>
    </svg>
  </a>

  <!-- Glide Carousel Script -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/Glide.js/3.4.1/glide.min.js"></script>

  <!-- Animate On Scroll -->
  <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>

  <!-- Custom JavaScript -->
  <script src="./js/products.js"></script>
  <script src="./js/index.js"></script>
  <script src="./js/slider.js"></script>
</body>

</html>