var express = require('express');
var bodyParser = require('body-parser');
var mysql = require("mysql");
var localStorage = require('localStorage');
const multer  = require('multer');
const { NULL } = require('mysql/lib/protocol/constants/types');
const session = require("express-session");
const res = require('express/lib/response');
const MySQLStore = require("express-mysql-session")(session);
const PDFDocument = require('pdfkit');
const fs = require('fs');



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


var sessionStore = new MySQLStore({
    expiration: 10800000,
    createDatabaseTable: true,
    schema:{
        tableName: 'sessiontbl',
        columnNames:{
            session_id: 'sesssion_id',
            expires: 'expires',
            data: 'data'
        }
    }
},db)

app.use( session({
    key: 'keyin',
    secret: 'my secret',
    store: sessionStore,
    resave: false,
    saveUninitialized: true
}))


var Logincheck = (req, res, next ) => {

	//var id = localStorage.getItem("user_id");
	var id = req.session.user_id

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

				db.query("SELECT * FROM `category`; SELECT * FROM `precessing`", function(error1,result1){
					if(!error1){
			
						req.category = result1[0];
						req.process = result1[1];
			
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

var AdminLogincheck = (req, res, next ) => {

	//var admin_id = localStorage.getItem("admin_id")

	var admin_id = req.session.admin_id

	if(admin_id == null ){
		req.admin_login_status = false;
	} else{

		req.admin_login_status = true;

	}

	next();

}

app.use(AdminLogincheck);


var message, login_status = false;

app.get("/",function(req,res){

    res.render("index.ejs",{login_status: req.login_status, userId: req.userId, category: req.category, products: req.products});

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

										
	
										var sql1 = "CREATE TABLE `codefjhu_aamniketon`.`?` ( `id` INT NOT NULL AUTO_INCREMENT , `product_id` INT NOT NULL , PRIMARY KEY (`id`)) ENGINE = InnoDB; CREATE TABLE `codefjhu_aamniketon`.`?` ( `id` INT NOT NULL AUTO_INCREMENT , `order_details` VARCHAR(500) NOT NULL , `total_price` INT NOT NULL , `status` VARCHAR(100) NOT NULL , `note` VARCHAR(500) NOT NULL , `all_order_id` INT NOT NULL , `date` VARCHAR(50) NOT NULL, PRIMARY KEY (`id`)) ENGINE = InnoDB;"
	

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


						//localStorage.setItem('user_id', result[0].user_id );
						req.session.user_id = result[0].user_id;

						

						//var id = localStorage.getItem('user_id');
						var id = req.session.user_id

						console.log("User Id is "+id);
						login_status = true;

						res.redirect('/');

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


app.get("/profile/:id",function(req,res){

	var { id } = req.params;

	db.query("SELECT * FROM `customers` WHERE user_id = ?;",[id],function(error,result){
		if(!error){

			db.query("SELECT * FROM `all_order` WHERE cus_id = ? ORDER BY order_id DESC;",[id],function(error1, result1){

				if(!error1){

					res.render("profile.ejs",{login_status: req.login_status, userId: req.userId, category: req.category, products: req.products, user_info: result, order_info: result1});


				} else{
					res.send(error1)
				}

			})

		} else{
			res.send(error);
		}
	})

	
})


app.get("/category",function(req,res){

	res.render("category.ejs",{login_status: req.login_status, userId: req.userId, category: req.category, products: req.products})

})


app.get("/cart",function(req,res){

	//var id = localStorage.getItem("user_id");

	var id = req.session.user_id

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

	//var id = localStorage.getItem("user_id");

	var id = req.session.user_id

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


app.get("/delete_from_cart/:cart_id", function(req,res){

	var { cart_id } = req.params;

	//var user_id = localStorage.getItem('user_id')

	var user_id = req.session.user_id;

	var tablename1 = user_id+'_cart';

	db.query("DELETE FROM `?` WHERE id = ?;",[tablename1,cart_id],function(error, result){
		if(!error){

			res.redirect("/cart");

		} else{
			res.send(error)
		}
	})

})


app.post("/create_order", function(req,res){

	var { order_details, total_price, date , order_status } = req.body

	console.log(order_details);

	//var cus_id = localStorage.getItem('user_id')

	var cus_id = req.session.user_id;



	console.log(cus_id)

db.query("INSERT INTO `all_order` (`order_id`, `order_details`, `total_price`, `status`, `note`, `cus_id`, `date`, `payment_number`, `pay_money`) VALUES (NULL, ?, ?, ?, NULL, ?, ?, NULL, NULL);",[order_details, total_price, order_status, cus_id, date],function(error,result){
	if(!error){


		res.send("Order create successfully")


	} else{
		res.send(error)
	}
})

})

app.get("/checkout",function(req,res){

	//var cus_id = localStorage.getItem('user_id')

	var cus_id = req.session.user_id

	var tablename1 = cus_id+"_cart";

	db.query("SELECT * FROM `all_order` WHERE cus_id = ? AND status = 'create order';",[cus_id],function(error,result){
		if(!error){

			
			


			
		db.query("DELETE FROM `?`",[tablename1],function(error1,result1){
			if(!error1){

				console.log(result);
				res.render("checkout.ejs",{login_status: req.login_status, userId: req.userId, category: req.category, products: req.products, order_details: result});


				
			} else{
				res.send(error1)
			}
		})

			

		} else{

		}
	})

	
})


app.get("/order_details/:order_id", function(req,res){

	var { order_id } = req.params

	db.query("SELECT * FROM `all_order` WHERE order_id = ?;",[order_id] ,function(error,result){
		if(!error){

			
			res.render("order_details.ejs",{login_status: req.login_status, userId: req.userId, category: req.category, products: req.products, order_details: result});


		} else{
			res.send(error)
		}
	})



})


app.get("/track_orders",function(req,res){

    res.render("track_order.ejs",{login_status: req.login_status, userId: req.userId, category: req.category, products: req.products, order_details: "empty"});

}) 


app.post("/track_order/", function(req,res){

	var { orderid } = req.body

	var order_id = parseInt(orderid) - 1112

	console.log(order_id);

	db.query("SELECT * FROM `all_order` WHERE order_id = ?;",[order_id] ,function(error,result){
		if(!error){

			 console.log(result);

			
			res.render("track_order.ejs",{login_status: req.login_status, userId: req.userId, category: req.category, products: req.products, order_details: result});


		} else{
			res.send(error)
		}
	})



})


app.get("/logout", function(req,res){

	//localStorage.removeItem("user_id");

	req.session.destroy(function(err){
		if(!err){

			login_status = false;

			res.redirect("/");

		} else{

			res.send(err);

		}
	})





})


app.get("/admin_home", function(req,res){

	if(req.admin_login_status == true){


	db.query("SELECT * FROM `all_order` INNER JOIN customers ON all_order.cus_id = customers.user_id WHERE all_order.status = 'create order' ORDER BY all_order.order_id DESC;SELECT * FROM `precessing`", function(error, result){

		if(!error){

			console.log(result)

			res.render("admin-home.ejs",{ order_details: result[0], process: req.process, process_name: "New Order"})


		} else{
			res.send(error)
		}

	})

} else {

	res.redirect("/aam-niketon/adminpanel")

}



})

app.post("/update_order_status/:order_id", function(req,res){

		var { note , process} = req.body
		var { order_id } = req.params

		console.log( order_id )
		console.log (  note + process )

		db.query("UPDATE `all_order` SET `status` = ?,  `note` = ? WHERE `all_order`.`order_id` = ?;",[process,note,order_id], function(error, result){

			if(!error){

				res.redirect("/admin_home");

			} else{

			}

		})
	})




app.get("/process/:name",function(req,res){

	if(req.admin_login_status == true){
	
	var { name } = req.params
	console.log(req.params.name)

	db.query("SELECT * FROM `all_order` INNER JOIN customers ON all_order.cus_id = customers.user_id WHERE all_order.status = ? ORDER BY all_order.order_id DESC;SELECT * FROM `precessing`", [name],function(error, result){

		if(!error){

			//console.log(result)

			res.render("admin-home.ejs",{ order_details: result[0], process: req.process, process_name: name})


		} else{
			res.send(error)
		}

	})

} else {

	res.redirect("/aam-niketon/adminpanel")

}

})


app.get("/category_list", function(req,res){

	if(req.admin_login_status == true){

	db.query("SELECT * FROM `category`",function(error,result){

		

		if(!error){

			res.render("add-category.ejs",{categoy_list: result, process: req.process})

		} else{
			res.send(error);
		}
	})

} else {

	res.redirect("/aam-niketon/adminpanel")

}


})


app.post("/add_category", function(req,res){

    var { category_name }  = req.body;

    console.log(category_name);

    db.query("INSERT INTO `category` (`id`, `category_name`) VALUES (NULL, ?);",[category_name], function(error,result){
        if(!error){
           res.redirect("/category_list")
        } else{
            res.send(error);
        }
    })

})

app.get("/edit_category/:cat_id/:category_name", function(req,res){

	if(req.admin_login_status == true){

  var { cat_id, category_name } = req.params

  res.render("edit_category.ejs",{cat_id: cat_id, category_name: category_name, process: req.process})

} else {

	res.redirect("/aam-niketon/adminpanel")

}


})

app.post("/edit_categoy/:cat_id",function(req,res){

	var { cat_id } = req.params

	 var { category_name } = req.body

	 db.query("UPDATE `category` SET `category_name` = ? WHERE `category`.`id` = ?;",[category_name, cat_id], function(error,result){
		 if(!error){

			res.redirect("/category_list")

		 } else{
			 res.send(result)
		 }
	 })


})

app.get("/delete_category/:cat_id", function(req,res){

	if(req.admin_login_status == true){

	var { cat_id } = req.params

	db.query("DELETE FROM `category` WHERE `category`.`id` = ?; DELETE FROM `products` WHERE `products`.`category_id` = ?;", [cat_id, cat_id],function(error,result){

		if(!error){

			res.redirect("/category_list")

		} else{
			res.send(error)
		}
	})

} else {

	res.redirect("/aam-niketon/adminpanel")

}


})


app.get("/add_product",function(req,res){

	if(req.admin_login_status == true){

	res.render("add-product.ejs",{message: message,category: req.category, process: req.process})
	message = null;

} else {

	res.redirect("/aam-niketon/adminpanel")

}

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

            message = "Product Add Successfully";
			res.redirect("/add_product")

        } else{
            res.send(error)
        }

    })


})// multer end


})


app.get("/all_products",function(req,res){

	if(req.admin_login_status == true){

	db.query("SELECT products.id , products.product_name, products.main_price, products.discount, category.category_name FROM `products` INNER JOIN category ON products.category_id = category.id;",function(error,result){
		if(!error){
			res.render("all_product_list.ejs",{product_list: result, process: req.process, category: req.category,})
		} else{
			res.send(error)
		}
	})

} else {

	res.redirect("/aam-niketon/adminpanel")

}


})


app.get("/all_products/:cat_id",function(req,res){

	if(req.admin_login_status == true){

	var { cat_id } = req.params

	db.query("SELECT products.id , products.product_name, products.main_price, products.discount, category.category_name FROM `products` INNER JOIN category ON products.category_id = category.id WHERE category_id = ?;",[cat_id],function(error,result){
		if(!error){
			res.render("all_product_list.ejs",{product_list: result, process: req.process, category: req.category,})
		} else{
			res.send(error)
		}
	})

} else {

	res.redirect("/aam-niketon/adminpanel")

}


})


app.get("/delete_product/:pro_id",function(req,res){

	if(req.admin_login_status == true){
	
	var { pro_id } = req.params

	db.query("DELETE FROM `products` WHERE `products`.`id` = ?;", [pro_id] ,function(error,result){
		if(!error){

			res.redirect("/all_products")

		} else{
			res.send(error)
		}
	})

} else {

	res.redirect("/aam-niketon/adminpanel")

}

})

app.get("/edit_product/:pro_id",function(req,res){

	if(req.admin_login_status == true){

	var { pro_id } = req.params

	db.query("SELECT * FROM `products` WHERE id = ?;", [pro_id],function(error,result){
		if(!error){

			res.render("edit-product.ejs",{message: message,category: req.category, process: req.process, product_info: result, pro_id: pro_id})

			message = null;
		} else{
			res.send(error)
		}
	})

} else {

	res.redirect("/aam-niketon/adminpanel")

}


	
	
})


app.post("/update_product/:pro_id",function(req,res){


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
    
		var { pro_id } = req.params

    var pic_url = "http://localhost:8081/img/productImage/"+req.file.filename


    var query = "UPDATE `products` SET product_name = ? , product_image_url = ?, main_price=?, discount = ?, short_des =?, category_id = ?, feature = ? WHERE `products`.`id` = ?;"

    db.query(query,[product_name,pic_url,main_price,discount,short_des,category_id,feature,pro_id],function(error,result){

        if(!error){

            //message = "Product Update Successfully";
			res.redirect("/all_products")

        } else{
            res.send(error)
        }

    })


})// multer end


})


app.get("/edit_profile",function(req,res){

	//var user_id = localStorage.getItem('user_id');

	var user_id = req.session.user_id;

	db.query("SELECT * FROM `customers` WHERE user_id = ?;",[user_id],function(error,result){
		if(!error){

			
			res.render("edit-profile.ejs",{message:message,login_status: req.login_status, userId: req.userId, category: req.category, products: req.products, user_info: result})
			message = null;

		} else{
			res.send(error)
		}
	})


})


app.post('/edit_profile/:profile_id',function(req,res){

	
	
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

var { profile_id } = req.params

	



	if(req.file == null){

		


		db.query("UPDATE `customers` SET `name` = ?, gender = ?, email_address = ?, date_of_birth = ?, shipping_address = ? WHERE `customers`.`user_id` = ?;",[name, gender,email_address,dateofbirth,presentaddress,profile_id],function(error1,result1){

			if(!error1){


			
			res.redirect("/profile/"+profile_id)


			} else{

				res.send(error1)

			}
		})


	} else{

		console.log("hello")


		var pic_url = "http://localhost:8081/img/cusImage/"+req.file.filename

		console.log(pic_url);

		db.query("UPDATE `customers` SET `name` = ?, pic_url = ?, gender = ?, email_address = ?, date_of_birth = ?, shipping_address = ? WHERE `customers`.`user_id` = ?;",[name, pic_url, gender,email_address,dateofbirth,presentaddress,profile_id],function(error1,result1){

			if(!error1){


				res.redirect("/profile/"+profile_id)


			} else{

				res.send(error1)

			}
		})




	}




	

})






});

app.get("/aam-niketon/adminpanel",function(req,res){

	res.render("admin-login.ejs",{message:message})
	message = null
})

app.post("/admin_login/check", function(req,res){

	var { mobilenum , password } = req.body
	
	db.query("SELECT * FROM `admin_info` WHERE mobile_num = ? AND password=?;",[mobilenum,password],function(error, result){
		if(!error){

			if(result.length>0){

			//localStorage.setItem("admin_id", result[0].id);

			req.session.admin_id = result[0].id;

			res.redirect("/admin_home")
		} else{
			message = "Please enter Valid Information"
			res.redirect("/aam-niketon/adminpanel")

		}

		} else{
			res.send(error)
		}
	})

})


app.post("/get_payment/:user_id", function(req,res){

	var { user_id } = req.params

	var { order_id, payment_mobilenum, pay_money, transaction_id } = req.body

	console.log(payment_mobilenum)
	console.log(order_id)

	db.query("UPDATE `all_order` SET `payment_number` = ?, `pay_money` = ?, `transaction_id` = ? WHERE `all_order`.`order_id` = ?;", [payment_mobilenum, pay_money, transaction_id, order_id-1112], function(error,result){
		if(!error){

			console.log(result)

			res.redirect("/profile/"+user_id)

		} else{
			res.send(error)
		}
	})


})


app.get("/paynow",function(req,res){

    res.render("pay-now.ejs",{login_status: req.login_status, userId: req.userId, category: req.category, products: req.products});

}) 

app.post("/get_payment/", function(req,res){



	var { order_id, payment_mobilenum, pay_money, transaction_id } = req.body

	console.log(payment_mobilenum)
	console.log(order_id)

	var user_id = req.session.user_id

	db.query("UPDATE `all_order` SET `payment_number` = ?, `pay_money` = ?, `transaction_id` = ? WHERE `all_order`.`order_id` = ?;", [payment_mobilenum, pay_money, transaction_id, order_id-1112], function(error,result){
		if(!error){

			console.log(result)

			res.redirect("/profile/"+user_id)

		} else{
			res.send(error)
		}
	})


})

app.get("/delete_order/:order_id",function(req,res){

	var { order_id } = req.params

	db.query("DELETE FROM `all_order` WHERE order_id = ?;",[order_id],function(error,result){

		if(!error){

			res.redirect("/admin_home")

		} else{
			res.send(error)
		}

	})
})


app.get("/invoice/:order_id",function(req,res){

	var { order_id } = req.params;

	db.query("SELECT * FROM `all_order` INNER JOIN customers ON all_order.cus_id = customers.user_id WHERE order_id = ?;",[order_id],function(error,result){

		if(!error){

			console.log('hello')
			console.log(result)

			res.render("invoice.ejs",{order_details:result,})

			//res.send("hello")

		} else{
			res.send(error);
		}

	})




});


app.listen('8081', function(err){
	if(err){
		throw err;
	} else{
	console.log("Server run on port http://localhost:8081");
    }
});