'use strict';

var nodemailer = require('nodemailer');
var smtpTransport = require('nodemailer-smtp-transport');

var Property = require('../models/property.js');
//var User     = require('../models/user.js');

function validateInputReq(req) {
	// Validation rules, not final

	req.checkBody('name', 'Name field is required').notEmpty();
	//length

	req.checkBody('email', 'Email field is required').notEmpty();
	//email

	req.checkBody('subject', 'Subject field is required').notEmpty();
	//length

	req.checkBody('comments', 'Message field is required').notEmpty();
	//legnth


	return req.validationErrors();


}

exports.index = function(req, res) {
	// Render homepage with property that are visible and featured

	//res.render('web/index.swig');
	Property.find({'Visible': 'Visible', 'Admin': false, 'Featured': 'Featured'}, function(err, properties) {
		if(err) {
			var message = [{ msg: 'There was an error loading the properties', alertType: 'alert error  fade in' }];
			req.flash('message', message);	
			res.redirect('/');
		} else {
			res.render('web/index.swig', {
				properties: properties,
				message: req.flash('message')
			});
		}
	});
};

exports.properties = function(req, res) {
	// Render all the properties in the page

	//res.render('web/properties.swig');
	Property.find({'Visible': 'Visible', 'Admin': false}, function(err, properties) {
		if(err) {
			var message = [{ msg: 'There was an error loading the properties', alertType: 'alert error  fade in' }];
			req.flash('message', message);	
			res.redirect('/properties');
		} else {
			res.render('web/properties.swig', {
				properties: properties,
				message: req.flash('message')
			});
		}
	});
};

exports.propertiesViewId = function(req, res) {
	// Render a property with a specific ID

	Property.findOne({'Location.AddressUnitUrl' : req.params.id, 'Location.Zip': req.params.zip}, function(err, property) {
		if(err) {
			req.flash('message', [ {msg: 'Error connectiong to the database', alertType: 'alert error  fade in' }]);
			res.redirect('/properties');
		} 

		if(!property || property.Visible === 'Hidden') {
			res.redirect('/properties');

		} else {
			// Convert \n to <br /> so it's possible to show newline form text coming from database
			property.Info.Description = property.Info.Description.replace(/\r?\n/g, '<br />');
			property.Info.Amenities = property.Info.Amenities.replace(/\r?\n/g, '<br />');

			// Back arrow go back to the previous link visited, can be homepage or list
			var backURL = req.header('Referer') || '/';
			res.render('web/propertiesId.swig', {
				property: property,
				
				back: backURL,

				message: req.flash('message')
			});   // end render
		} // end Property
	}); // end findOne
};

exports.aboutmiami = function(req, res) {
	// Render aboutmiami page

	res.render('web/aboutmiami.swig');
};

exports.contact = function(req, res) {
	// Render contactpage

	res.render('web/contact.swig');
};

exports.contactSend = function(req, res) {
	// Send email from contact form in every single property or contact page. First case subject is generated

	var errors = validateInputReq(req);

	if(errors) {

		for(var i=0; i<errors.length; i++) {
			errors[i].alertType = 'alert error fade in';
		}
		res.send(errors);
	} else {

		var name = req.body.name;
		var email = req.body.email;
		var subject = req.body.subject;
		var messagealt = req.body.comments;

		// use mailgun to send
		var transporter = nodemailer.createTransport(smtpTransport({
			"host": "smtp.mailgun.org",
			"port": "587",
			auth: {
				user: "postmaster@something.mailgun.org",
				pass: "password",
			}
		}));

		// Mail config
		transporter.sendMail({
			from: email,
			to: 'test@gmail.com',
			subject: subject,
			text: 'Email from:' + name + '\n' + messagealt

		}, function(err, info) {
			if(err) {
				// Send error messages
				res.send([{msg: 'There was a problem sending email', alertType: 'alert error fade in' }]);
			} else {
				// Send success message
				res.send([{msg: 'Email successfully sent', alertType: 'alert success fade in' }]);

			}
	     });

	}

};

exports.default = function(req, res) {
	// If no other route is matched just go to homepage

	res.redirect('/');
};

