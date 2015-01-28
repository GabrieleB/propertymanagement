'use strict';

exports.loginScreen = function(req, res) {
		  // If the user is authenticated he is redirected to the correct homepage
		  // If no connected user simply go to the loging page
		  if(req.isAuthenticated()) {
					 if(req.user.Admin) {
					 	res.redirect('/admin/view');
					 } else {
						res.redirect('/profile');
					 }
		  } else {
		  	res.render('login.swig', { message: req.flash('message') } );
		  }
};

