<!DOCTYPE html>
<head>
    <meta charset="utf-8">
    <title>Paper Stack</title>
    <link rel="stylesheet" type="text/css" href="./css/login.css" />
</head>

<body>
<div class="container">
	<section id="content">
		<form action="usercheck.php" method="post" >
			<h1>Login</h1>
			<div>
				<input type="email" placeholder="Kullanici" name="email" id="username" required/>
			</div>
			<div>
				<input type="password" placeholder="Sifre" name="password" id="password" required/>
			</div>
			<div>
				<input type="submit" value="Log in" />
			</div>
		</form><!-- form -->
		
	</section><!-- content -->
</div><!-- container -->
</body>
</html>
