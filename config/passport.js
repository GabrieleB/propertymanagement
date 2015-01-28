'use strict';

var LocalStrategy = require('passport-local').Strategy;


var Property = require('../app/models/property');

module.exports = function(passport) {
	// PASSPORT SESSION CONFIG
	// Serialize user for session 
	passport.serializeUser( function(user, done) {
		done(null, user.id);
	});

	passport.deserializeUser( function(id, done) {
		Property.findById(id, function(err, user) {
			done(err, user);
		});
	});

	passport.use('local-login', new LocalStrategy({
		 
	        usernameField : 'property',
                passwordField : 'password',
                passReqToCallback : true
		 
        },
			 
        function(req, property, password, done) {

				 
                console.log(property);
                console.log(password);
								 
                //find if email exists
	                Property.findOne({ 'PropertyID' : property }, function(err, property) {
             
                        	// Error in requesting so return the error
				if(err) {
					return done(err);
				}
				                                                                                
				// User doesn't exist
				if(!property) {
					return done(null, false, req.flash('message', [ {msg: 'Wrong Property ID or Password', alertType: 'alert error  fade in' }]));
				}
				                                                                                                                                                                           
				// Password is wrong
				if(!property.validPassword(password)) {
					return done(null, false, req.flash('message', [ {msg: 'Wrong Property ID or Password', alertType: 'alert error  fade in' }]));
				}
				                                                                                                                                                                                                                                                                 
				// All good return the user
				return done(null, property);
				                                                                                                                                                                                                                                                                                                   
			});
	}

	) // end new
		); // end passport 

};
