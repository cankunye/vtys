

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
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Glide.js/3.4.1/css/glide.theme.min.css
">
  <!-- Animate On Scroll -->
  <link rel="stylesheet" href="https://unpkg.com/aos@next/dist/aos.css" />

  <!-- Custom StyleSheet -->
  <link rel="stylesheet" href="./css/styles.css" />
  <link rel="stylesheet" href="./css/products.css" />
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">

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
              <span class="nav__category">PHONENOW</span>
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
                <a href="#" class="nav__link">Blog</a>
              </li>
              <li class="nav__item">
                <a href="#" class="nav__link">Contact Us</a>
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
  
  <div class="search-box-container">
        <div class="search-box">
          <form action="product.php" method="post">
            <input type="text" name="phone-id" class="search-input" placeholder="Search..">
            <input class="search-button" type="submit" name="submit">
          </form>
        </div>
  </div>


  <section class="category__section section" id="category">             
        <div class="tab__list">
          <div class="title__container tabs">
            <div class="section__titles category__titles ">
              <div class="section__title filter-btn active" data-id="All Products">
                <span class="dot"></span>
                <h1 class="primary__title" style="display:inline-block;">All Products</h1>
                
                <?php 
                      $db_conn = pg_connect("host=localhost dbname=phonenow user=postgres password=root");
                      $result = pg_query($db_conn, " SELECT  *  FROM phone;");
  
     
                      while ($row = pg_fetch_assoc($result) ){
                        $name = $row['name'];
                        $price = $row['price'];
                        $imgAdrs = $row['imgAdrs'];

                      ?>
                        
                      <div class="product category__products" >
                            <div class="product__header">
                            <img src= "<?php echo $imgAdrs; ?>"  alt="product">
                            </div>
                         
                            <div class="product__footer">
                              <h3><?php echo $name; ?></h3>
                                  <div class="rating">
                                    <svg>
                                      <use xlink:href="./images/sprite.svg#icon-star-full"></use>
                                    </svg>
                                    <svg>
                                      <use xlink:href="./images/sprite.svg#icon-star-full"></use>
                                    </svg>
                                    <svg>
                                      <use xlink:href="./images/sprite.svg#icon-star-full"></use>
                                    </svg>
                                    <svg>
                                      <use xlink:href="./images/sprite.svg#icon-star-full"></use>
                                    </svg>
                                    <svg>
                                      <use xlink:href="./images/sprite.svg#icon-star-empty"></use>
                                    </svg>
                                  </div>
                                  <div class="product__price">
                                    <h4><?php echo $price; ?></h4>
                                  </div>
                                  <a href="#"><button type="submit" class="product__btn">Add To Cart</button></a>
                                </div>
                              <ul>
                                  <li>
                                    <a data-tip="Quick View" data-place="left" href="#">
                                      <svg>
                                        <use xlink:href="./images/sprite.svg#icon-eye"></use>
                                      </svg>
                                    </a>
                                  </li>
                                  <li>
                                    <a data-tip="Add To Wishlist" data-place="left" href="#">
                                      <svg>
                                        <use xlink:href="./images/sprite.svg#icon-heart-o"></use>
                                      </svg>
                                    </a>
                                  </li>
                                  <li>
                                    <a data-tip="Add To Compare" data-place="left" href="#">
                                      <svg>
                                        <use xlink:href="./images/sprite.svg#icon-loop2"></use>
                                      </svg>
                                    </a>
                                  </li>
                              </ul>
                          </div>
                          <?php } ?>                     
         
              </div>
            </div>
            

          </div>
        </div>
       
    </div>
    </section>

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