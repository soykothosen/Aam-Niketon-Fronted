var express = require('express');
var bodyParser = require('body-parser');
var mysql = require("mysql");
var localStorage = require('localStorage');
const multer  = require('multer');
//const path = require('path')




var app = express();

app.use(bodyParser.urlencoded({ extended: true}));
app.set('view engine','ejs');
app.use(express.static('public'));

//app.use(express.static(__dirname + '/public'));





var db = mysql.createConnection({
	multipleStatements: true,
    host    : 'localhost',
    user     : 'root',
    password : '',
    database : 'codefjhu_aamniketon'
  });


  db.connect(function(err){
    if(err){
        throw err;
    }
    console.log("Database is connected");
});


var Logincheck = (req, res, next ) => {

	var id = localStorage.getItem("user_id");

	if(id != null){
		req.userId = id;
		req.login_status = true;
	} else{
		req.userId = id;
		req.login_status = false;
	}

	let myPromise = new Promise(function(myResolve, myReject) {
		// "Producing Code" (May take some time)

		db.query("SELECT * FROM `products`", function(error,result){
			if(!error){
	
				req.products = result;
	
				//console.log(req.products);

				db.query("SELECT * FROM `category`", function(error1,result1){
					if(!error1){
			
						req.category = result1;
			
						//console.log(req.category)

						myResolve();


			
					} else{
						res.send(error1)
					}
				})
			


	
			} else{
				res.send(error)
			}
		})
		
		 // when successful
		  //myReject();  // when error
		});
		
		// "Consuming Code" (Must wait for a fulfilled Promise)
		myPromise.then(
		  function(value) { 
			  /* code if successful */

			  next();

			 },
		  function(error) { /* code if some error */ }
		);



	
	
}

app.use(Logincheck);


var message, login_status = false;

app.get("/",function(req,res){

    res.render("index.ejs",{login_status: req.login_status, userId: req.userId, category: req.category, products: req.products});

}) 

app.post("/add_category", function(req,res){

    var { category_name }  = req.body;

    console.log(category_name);

    db.query("INSERT INTO `category` (`id`, `category_name`) VALUES (NULL, ?);",[category_name], function(error,result){
        if(!error){
            res.send("Add Category Successfully");
        } else{
            res.send(error);
        }
    })

})


app.post("/add_product",function(req,res){


    const storage = multer.diskStorage({
        destination: function (req, file, cb) {
          cb(null, 'public/img/productImage')
        },
        filename: function (req, file, cb) {
          cb(null, file.originalname)
        }
    
      }); 

      const upload = multer({ storage: storage }).single('product_image');

      upload(req, res, function (err) {
        if (err instanceof multer.MulterError) {
          // A Multer error occurred when uploading.

          res.send(err);

        } else if (err) {
          // An unknown error occurred when uploading.

          res.send(err);

        }

  

        var { product_name, main_price, discount, short_des, category_id, sub_category_id, feature } = req.body
    

    var pic_url = "http://localhost:8081/img/productImage/"+req.file.filename


    var query = "INSERT INTO `products` (`id`, `product_name`, `product_image_url`, `main_price`, `discount`, `short_des`, `category_id`, `sub_category_id`, `feature`) VALUES (NULL, ?, ?, ?, ?, ?, ?, NULL, ?);"

    db.query(query,[product_name,pic_url,main_price,discount,short_des,category_id,feature],function(error,result){

        if(!error){

            res.send("Product Add Successfully")

        } else{
            res.send(error)
        }

    })


})// multer end


})


app.get("/login",function(req,res){

    res.render("login.ejs",{message:message,login_status: req.login_status, userId: req.userId, category: req.category, products: req.products})
	message = null;

})

app.get("/registration",function(req,res){

    res.render("registration.ejs",{message:message,login_status: req.login_status, userId: req.userId, category: req.category, products: req.products})
	message = null;

})

app.post('/create/account',function(req,res){

	
	
		const storage = multer.diskStorage({
			destination: function (req, file, cb) {
			  cb(null, 'public/img/cusImage')
			},
			filename: function (req, file, cb) {
			  cb(null, file.originalname)
			}
		
		  }); 
	
	
		  const upload = multer({ storage: storage }).single('profile_image');
	
		  upload(req, res, function (err) {
			if (err instanceof multer.MulterError) {
			  // A Multer error occurred when uploading.
	
			  res.send(err);
	
			} else if (err) {
			  // An unknown error occurred when uploading.
	
			  res.send(err);
	
			}
	
	
	  
    var name = req.body.cus_name;
	var mobile = req.body.mobilenum;
	var password = req.body.password;
	var email_address = req.body.email_address;
	var gender = req.body.gender;
	var dateofbirth = req.body.birthday;
	var presentaddress = req.body.presentaddress;
	
		
	if( mobile.length != 11){
		message = "Mobile Number Should 11 Digits";
		res.redirect('/registration');
	
	} else {


		if(req.file == null){

			
	
	
			db.query("SELECT * FROM `customers` WHERE mobile_num = ?;",[mobile],function(error,result){
	
				if(!error){
	
					if(result.length>0){
	
						message = "Already have account with this mobile number"

						res.redirect("/registration");
	
					} else{
						db.query("INSERT INTO `customers` (`user_id`, `name`, `mobile_num`, `password`, `pic_url`, `gender`, `email_address`, `date_of_birth`, `shipping_address`) VALUES (NULL, ?, ?, ?, NULL, ?, ?, ?, ?);",[name, mobile, password,gender,email_address,dateofbirth,presentaddress],function(error1,result1){
	
							if(!error1){
	
	
								db.query("SELECT * FROM `customers` WHERE mobile_num = ?;",[mobile],function(error2,result2){
	
									if(!error2){

										var tablename1 = result2[0].user_id+"_cart";
										var tablename2 = result2[0].user_id+"_order";

										
	
										var sql1 = "CREATE TABLE `codefjhu_aamniketon`.`?` ( `id` INT NOT NULL AUTO_INCREMENT , `product_id` INT NOT NULL , PRIMARY KEY (`id`)) ENGINE = InnoDB; CREATE TABLE `codefjhu_aamniketon`.`?` ( `id` INT NOT NULL AUTO_INCREMENT , `order_details` VARCHAR(500) NOT NULL , `total_price` INT NOT NULL , `status` VARCHAR(100) NOT NULL , `note` VARCHAR(500) NOT NULL , `all_order_id` INT NOT NULL , `promo_code` VARCHAR(50) NOT NULL , `final_price` INT NOT NULL , `date` VARCHAR(50) NOT NULL , `time` VARCHAR(50) NOT NULL , PRIMARY KEY (`id`)) ENGINE = InnoDB;"
	

										db.query(sql1,[tablename1,tablename2],function(error3,result3){
											if(!error){

												res.redirect("/login");

											} else{
												res.send(error);
											}
										});


									} else{
										res.send(error2)
									}
	
								})
	
	
	
							} else{
	
								res.send(error1)
	
							}
						})
					}
	
	
	
	
				} else{
					res.send(error)
	
				}
	
	
			})
	
	
		} else{

			console.log("hello")
	
	
			var pic_url = "http://localhost:8081/img/cusImage/"+req.file.filename

			console.log(pic_url);
	
			db.query("SELECT * FROM `customers` WHERE mobile_num = ?;",[mobile],function(error,result){
	
				if(!error){
	
					if(result.length>0){
	
						message = "Already have account with this mobile number"

						res.redirect("/registration");
	
					} else{
						db.query("INSERT INTO `customers` (`user_id`, `name`, `mobile_num`, `password`, `pic_url`, `gender`, `email_address`, `date_of_birth`, `shipping_address`) VALUES (NULL, ?, ?, ?, ?, ?, ?, ?, ?);",[name, mobile, password,pic_url,gender,email_address,dateofbirth,presentaddress],function(error1,result1){
	
							if(!error1){
	
	
								db.query("SELECT * FROM `customers` WHERE mobile_num = ?;",[mobile],function(error2,result2){
	
									if(!error2){

										var tablename1 = result2[0].user_id+"_cart";
										var tablename2 = result2[0].user_id+"_order";

										
	
										var sql1 = "CREATE TABLE `codefjhu_aamniketon`.`?` ( `id` INT NOT NULL AUTO_INCREMENT , `product_id` INT NOT NULL , PRIMARY KEY (`id`)) ENGINE = InnoDB; CREATE TABLE `codefjhu_aamniketon`.`?` ( `id` INT NOT NULL AUTO_INCREMENT , `order_details` VARCHAR(500) NOT NULL , `total_price` INT NOT NULL , `status` VARCHAR(100) NOT NULL , `note` VARCHAR(500) NOT NULL , `all_order_id` INT NOT NULL , `promo_code` VARCHAR(50) NOT NULL , `final_price` INT NOT NULL , `date` VARCHAR(50) NOT NULL , `time` VARCHAR(50) NOT NULL , PRIMARY KEY (`id`)) ENGINE = InnoDB;"
	

										db.query(sql1,[tablename1,tablename2],function(error3,result3){
											if(!error){

												res.redirect("/login");

											} else{
												res.send(error);
											}
										});


									} else{
										res.send(error2)
									}
	
								})
	
	
	
							} else{
	
								res.send(error1)
	
							}
						})
					}
	
	
	
	
				} else{
					res.send(error)
	
				}
	
	
			})
	
	
	
	
		}
	

	}
	
		
	
	})

	
    



});


app.post('/login/check',function(req,res){

	let mobileNumber = req.body.mobilenum;
	let password = req.body.password;

	console.log("Mobile Number: "+ mobileNumber);
	console.log("Password: " + password);

	console.log(mobileNumber.length);

	if(mobileNumber.length == 11){



		db.query('SELECT * FROM `customers` WHERE mobile_num = ?;',[mobileNumber], function(error,result){

			if(!error){

				if(result.length>0){

					if(result[0].password == password){


						localStorage.setItem('user_id', result[0].user_id );

						var id = localStorage.getItem('user_id');

						console.log("User Id is "+id);
						login_status = true;

						res.redirect('/profile');

					} else{

					message = "Password Incorrect";
		            res.redirect('/login');

					}

				} else{

					message = "No User with this mobile number";
		            res.redirect('/login');

				}

			} else{
				res.send(error);
			}

		});

	} else{


		message = "Mobile Number Should 11 Digits";
		res.redirect('/login');
		
	}


});


app.get('/forgetpass',function(req,res){

	res.render('forgetpass.ejs',{message: message,login_status: req.login_status, userId: req.userId, category: req.category, products: req.products});

	message = null;

});


app.post('/updatepass',function(req,res){

	var mobile = req.body.mobilenum;
	var password  = req.body.password;

	console.log(mobile);
	console.log(password);

	if(mobile.length != 11){
		message = "Mobile Number Should be 11 digits";
		res.redirect('/forgetpass');
	} else{

		db.query('SELECT * FROM `customers` WHERE mobile_num = ?;',[mobile],function(error,result){

			if(!error){

				if(result.length == 0){

					message = "No Account with this mobile number";
		            res.redirect('/forgetpass');

				} else{
					db.query('UPDATE `customers` SET `password` = ? WHERE `customers`.`mobile_num` = ?;',[password,mobile],function(error1,result1){

						if(!error1){
							message = null;
							res.redirect('/login');
						} else{
							res.send(error1);
						}

					});
				}

			} else{
				res.send(error);
			}

		});

	}

});


app.get("/profile",function(req,res){
	res.send("profile page");
})


app.get("/category",function(req,res){

	res.render("category.ejs",{login_status: req.login_status, userId: req.userId, category: req.category, products: req.products})

})


app.get("/cart",function(req,res){

	var id = localStorage.getItem("user_id");

	var tablename1 = id+'_cart'

	db.query("SELECT * FROM `category`", function(error1,result1){
		if(!error1){

			db.query("SELECT * FROM `products` INNER JOIN `?` ON products.id = `?`.product_id;",[tablename1,tablename1], function(error2,result2){
				if(!error2){

					console.log(result2);

					res.render("cart.ejs",{login_status: req.login_status, userId: req.userId, category: req.category, products: req.products, cart_product: result2})


				} else{
					res.send(error2)
				}
			})

			
			

		} else{
			res.send(error1)
		}
	})

	

	
})


app.post("/addtocart",function(req,res){

	var id = localStorage.getItem("user_id");

	if(id != null){
	
	var { product_id } = req.body;

	var tablename1 = id+"_cart";

	db.query("INSERT INTO `?` (`id`, `product_id`) VALUES (NULL, ?);",[tablename1,product_id],function(error,result){
		if(!error){

			res.send("add to cart");

		} else{
			res.send(error)
		}
	})

} else{
	res.redirect("/login")
}

})

app.get("/category/:id", function(req,res){

	var category_id = req.params.id;

	db. query("SELECT * FROM `products` WHERE category_id = ?; SELECT category_name FROM `category` WHERE id = ?;",[category_id, category_id] ,function(error, result){

		if(!error){

			console.log(result)

			res.render("single-category.ejs",{login_status: req.login_status, userId: req.userId, category: req.category, products: req.products, thiscategory_product: result[0], category_name:result[1] })

		} else{
			res.send(error);
		}

	})


	//localStorage.setItem("category_id");

	//res.redirect("/single-category")

})

app.get("/product/:id", function(req,res){

	var product_id  = req.params.id;

	db.query("SELECT * FROM `products` WHERE id = ?;",[product_id] ,function(error,result){
		if(!error){

			
			res.render("product.ejs",{login_status: req.login_status, userId: req.userId, category: req.category, product: result })


		} else{
			res.send(error)
		}
	})

})




app.listen('8081', function(err){
	if(err){
		throw err;
	} else{
	console.log("Server run on port http://localhost:8081");
    }
});