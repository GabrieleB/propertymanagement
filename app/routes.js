'use strict';

var weba = require('./controllers/weba.js');
var auth = require('./controllers/auth.js');
var backend = require('./controllers/backend.js');

// Private functions
function isLoggedIn(req, res, next) {
	if(req.isAuthenticated()) {
		return next();
	}

	req.flash('loginMessage', 'You must login first');
	res.redirect('/login');

}

function isAuthorized(req, res, next) {
	if(!req.user.Admin) {
		req.flash('loginMessage', 'No permission allowed');
		return res.redirect('/login');
	}

	next();
}

module.exports = function(app, passport) {
	 
	// ============ FRONTEND ROUTES
	app.get('/', weba.index);
	app.get('/properties', weba.properties);
	app.get('/properties/:zip/:id', weba.propertiesViewId);
	app.get('/aboutmiami', weba.aboutmiami);
	app.get('/contact', weba.contact);
        app.post('/contact', weba.contactSend) ; 

        app.get('/login', auth.loginScreen);
	app.post('/login', 
		passport.authenticate('local-login', {
                	failureRedirect: '/login',
                	failureFlash: true
		}),
		auth.loginScreen);

	// ============ BACKEND ROUTES

                                                                                                                                                                                                                                 
        // ============ PROFILE
	app.get('/profile', isLoggedIn, backend.profileScreen);
                                                                                                                                                                                                                                                                               
	// ===== PR
	
	app.use('/admin', isLoggedIn, isAuthorized, function(req, res, next) {
		next();
	});	

	app.get('/admin', backend.adminScreen); 

	app.get('/admin/create', backend.adminCreateScreen); 
	app.post('/admin/create', backend.adminCreateSave);

	app.get('/admin/view', backend.adminViewScreen); 
	app.get('/admin/view/:id', backend.adminViewIdScreen);
	app.post('/admin/view/:id', backend.adminViewIdSave);

	app.get('/admin/delete/:id', backend.adminDeleteId);

	app.use('/upload', isLoggedIn, isAuthorized, function(req, res, next) {
		next();
	}); 

	app.get('/upload/:id', backend.uploadRead);
	app.post('/upload/:id', backend.upload);
	app.get('/upload/delete/:id/:file', backend.uploadDelete);

	// LOGOUT
	app.get('/logout', function(req, res) {
		req.logout();
		res.redirect('/');
	});

	// All the pages not in the specified routes are redirected to the homepage
	app.use(weba.default);


};

