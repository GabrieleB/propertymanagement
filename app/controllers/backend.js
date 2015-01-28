'use strict';

var fs = require('fs-extra');
var busboy = require('connect-busboy');
var mongoose = require('mongoose');

var Property = require('../models/property.js');

function validateInputReq(req, mode) {
	// Validation rules, to be finished
	req.checkBody('property', 'Login Property ID is required').notEmpty();

	if(mode === 'Create') {
		req.checkBody('password', 'Login Property password is required').notEmpty();
	}

	req.checkBody('Owner.Name', 'Owner Name is required').notEmpty();
	//req.checkBody('ownerName', 'Owner Name must only contains letters or numbers').isAlphanumeric();

	req.checkBody('Owner.Surname', 'Owner Surname is required').notEmpty();
	//req.checkBody('ownerSurname', 'Owner Surname is required').notEmpty();
	//req.checkBody('ownerSurname', 'Owner Surname must only contains letters or numbers').isAlphanumeric();
	

	/*

	//req.checkBody('ownerAddress', 'Something').isSomething();
	req.checkBody('ownerCity', 'Owner City must contains only letters').isAlpha();
	req.checkBody('ownerState', 'Owner State must contains only letters').isAlpha();
	req.checkBody('ownerZip', 'Owner Zip must contains only numbers').isInt();
	req.checkBody('ownerCountry', 'Owner Country must contains only letters').isAlpha();
	//req.checkBody8'ownerTel', 'Something').isSomething();
	req.checkBody('ownerEmail', 'Owner email format is not correct').isEmail();
	//req.checkBody('ownerNote', 'Something').isSomething();
	*/

	req.checkBody('Location.AddressUnit', 'Property Address is required').notEmpty();
	/*
	//req.checkBody('locationAddressUnit', 'Something').isSomething();	
	req.checkBody('locationCity', 'Location City must contains only letters').isAlpha(); 	
	req.checkBody('locationState', 'Location State must contains only letters').isAlpha(); 
	*/
	req.checkBody('Location.Zip', 'Location Zip is required').notEmpty();
	/*
	req.checkBody('locationZip', 'Location Zip must contains only numbers').isInt(); 
	req.checkBody('locationCountry', 'Location Country must contains only letters').isAlpha(); 

	//req.checkBody('infoIdPasswdWiFi', 'Something').isSomething();
	//req.checkBody('infoManagementRef', 'Something').isSomething();
	//req.checkBody('infoFrontDeskTel', 'Something').isSomething();
	//req.checkBody('infoBedrooms', ' Something ').isSomething();
	//req.checkBody('infoBathrooms', 'Something').isSomething();
	//req.checkBody('infoAmenities', 'Something').isSomething();
	//req.checkBody('infoDescription', 'Something').isSomething();

	req.checkBody('ratesLowSeasonDay', 'Rates must be greater than or equal to 0').isFloat().gte(0.0);
	req.checkBody('ratesLowSeasonWeek', 'Rates must be greater than or equal to 0').isFloat().gte(0.0);
	req.checkBody('ratesLowSeasonMonth', 'Rates must be greater than or equal to 0').isFloat().gte(0.0); 

	req.checkBody('ratesHighSeasonDay', 'Rates must be greater than or equal to 0').isFloat().gte(0.0); 
	req.checkBody('ratesHighSeasonWeek', 'Rates must be greater than or equal to 0').isFloat().gte(0.0); 
	req.checkBody('ratesHighSeasonMonth', 'Rates must be greater than or equal to 0').isFloat().gte(0.0); 

	req.checkBody('ratesMediumSeasonDay', 'Rates must be greater than or equal to 0').isFloat().gte(0.0); 
	req.checkBody('ratesMediumSeasonWeek', 'Rates must be greater than or equal to 0').isFloat().gte(0.0); 
	req.checkBody('ratesMediumSeasonMonth', 'Rates must be greater than or equal to 0').isFloat().gte(0.0); 
	*/ 

	return req.validationErrors();

}

exports.profileScreen = function(req, res) {

	// Profile screen, if admin redirected to view or user is presented with the property ID and financials
	if(req.user.Admin) {
		res.redirect('/admin/view');
	} else {


		Property.findOne({'PropertyID': req.user.PropertyID}, function(err, property) {
			if(err) {
				req.flash('message', [ {msg: 'Error connectiong to the database', alertType: 'alert error  fade in' }]);
				res.redirect('/login'); 
			} else {
				res.render('profile.swig', {

					property: property.PropertyID,

					financials: property.Financials

				});
			}
		});
	}

};
exports.adminScreen = function(req, res) {
	// Just render admin page

	res.render('admin/admin.swig');

};

exports.adminCreateScreen = function(req, res) {
	// Render admin create page

	res.render('admin/create.swig', {message: req.flash('message')});
};

exports.adminCreateSave = function(req, res) {
	// Save property added in create page

	var errors = validateInputReq(req, 'Create');

	// if errors found just give an error message
	if(errors) {

		for (var i=0; i<errors.length; i++) {
			errors[i].alertType = 'alert error  fade in';
		}

		req.flash('message', errors);
		res.redirect('/admin/create');

	} else {

		//   Check if property exists
		Property.findOne({ 'PropertyID' : req.body.property }, function(err, property) {
			// If there is a generic error just exit and report
			if(err) {
				req.flash('message', [ {msg: 'Error connectiong to the database', alertType: 'alert error  fade in' }]);
				res.redirect('/admin/create');
			}
			// If user exists just quit and report
			if(property) {
				req.flash('message', [{msg: 'The Property ID is already taken', alertType: 'alert error  fade in'}]);
				res.redirect('/admin/create');
			} else {

				// NO errors so far so first create the Property
				var propertyAdd = new Property();

				propertyAdd.PropertyID = req.body.property;
				propertyAdd.Password = propertyAdd.generateHash(req.body.password);
				propertyAdd.Owner = req.body.Owner;
				propertyAdd.Location = req.body.Location;
				
				propertyAdd.save( function(err, property) {

					if(err) {
						console.error(err);
						req.flash('message',[{ msg: 'There was an error saving the property', alertType: 'alert error  fade in' }]);
						res.redirect('/admin/create');
					} else {
						// Save successful so create the dir for the property 
						var dir = process.cwd() + '/public/images/' + property.id;

						fs.mkdirs(dir, function(err) {
							if(err) {
								req.flash('message',[{ msg: 'There was an error saving the property', alertType: 'alert error  fade in' }]); 
								res.redirect('/admin/create'); 
							} else {
								req.flash('message',[{ msg: 'Property successfully saved', alertType: 'alert success  fade in' }]);
								res.redirect('/admin/view/' + req.body.property); 
							}

						});
					}

				}); // end property save	
					

			} // end else when property doesn't exist
		}); // end Property findone

	} // end else no errors
}; // end function

exports.adminViewScreen = function(req, res) {
	// Show all properties
	Property.find({'Admin': false}, function(err, properties) {
		if(err) {
		
			req.flash('message',[{ msg: 'There was an error loading the properties', alertType: 'alert error  fade in' }]);	
			res.redirect('/admin/view');
		
		} else {
			res.render('admin/viewAll.swig', {
				properties: properties,

				message: req.flash('message')
			});
		}
	});
};

exports.adminViewIdScreen = function(req, res) {
	// Show the property with that ID
	Property.findOne({'PropertyID' : req.params.id }, function(err, property) {
		if(err) {
			req.flash('message', [ {msg: 'Error connectiong to the database', alertType: 'alert error  fade in' }]);
			res.redirect('/admin/view');
		} 
		
		if(!property) {
			res.redirect('/admin/view');

		} else {
			res.render('admin/viewId.swig', {
				property: property,

				message: req.flash('message')
			});   // end render
		} // end Property
	}); // end findOne
}; // end function


exports.adminViewIdSave = function(req, res) {
	// Save the property edited

	var errors = validateInputReq(req, 'Update');

	var propertyId = req.params.id;

	// If errors print
	if(errors) {
		for (var i=0; i<errors.length; i++) {
			errors[i].alertType = 'alert error  fade in';
		}

		req.flash('message', errors);
		res.redirect('/admin/view/' + propertyId); 
	} else {
		Property.findOne({ 'PropertyID': req.params.id }, function(err, property) {
			if(err) {
				// Go to list properties and print the error message
				req.flash('message', [{ msg: 'Error connecting to the database', alertType: 'alert error  fade in' }]);
				res.redirect('/admin/view/' + propertyId);
			}
			if(!property) {
				// Property doesn't exist so return to list properties and print error
				req.flash('message', [{ msg: 'Property not exists', alertType: 'alert error  fade in' }]);
				res.redirect('/admin/view/' + propertyId);
			} else {
				// Property found save all the data and save

				property.PropertyID		=		req.body.property;

			        property.Owner			=		req.body.Owner;	
				property.Location		=		req.body.Location; 
				property.Info			=		req.body.Info;
				property.Rates			=		req.body.Rates;

				property.Financials		=		req.body.Financials;

				property.Featured		=		req.body.featured;
			        property.Visible 		=		req.body.visible;

				property.PropertyID = req.body.property;
				// If password has changed save it
				if(req.body.password !== '') {
					property.Password = property.generateHash(req.body.password);
				}

				property.markModified('Financials');

				property.save( function(err) {

					if(err) {
						req.flash('message', [{ msg: 'There was an error saving the property', alertType: 'alert error  fade in' }]);
						res.redirect('/admin/view/' + propertyId);
					} else {
						req.flash('message',[{ msg: 'Property successfully updated', alertType: 'alert success  fade in' }]);
						res.redirect('/admin/view/' + req.body.property );
					} // end else property save 

				}); // end property save


			} // end else success property find one
		}); // end property find one
	} // end else error success

}; // end function

exports.adminDeleteId = function(req, res) {
	// Delete a property with a specific ID

	Property.findOne({'PropertyID':  req.params.id}, function(err, property) {
		if(err) {
			req.flash('message', [ {msg: 'Error connecting the database', alertType: 'alert error  fade in'}]);
			res.redirect('/admin/view' + req.params.id);
		} else {
			property.remove( function(err) {
				// Remove from database
				if(err) {
					req.flash('message', [ {msg: 'Error deleting the property', alertType: 'alert error  fade in'}]);
					res.redirect('/admin/view' + req.params.id);
				} else {
					// Remove associated dir and files

					var dir = process.cwd() + '/public/images/' + property.id;
					console.log(dir);
					fs.remove(dir, function(err) {
						if(err) {
							console.log(err);
						} else {
							console.log('Successfully removed');
						}
					});


					req.flash('message', [ {msg: 'Property successfully deleted', alertType: 'alert success  fade in' }]);
					res.redirect('/admin/view');	
				}
			});
		}
	});
};

exports.uploadRead = function(req, res) {
	// Read the pictures associated to a property

	// Convert ID string format from request to mongoose ObjectId for query
	var _id = mongoose.Types.ObjectId(req.params.id);

	Property.findOne({'_id': _id}, function(err, property) {
		if(err) {
			console.log(err);
			res.send('');
		} 
		
		if(!property) {
			console.log('Not Found');
		} else {
		
			// Read the associated images path and send to client
			var results = [];
			
			property.Images.forEach( function(file) {
				results.push({name: file.url});
			});	
			res.send(results);
		}
	});

};

exports.upload = function(req, res) {
	// Upload the one or more picture associated with a property

	var fstream;
	req.pipe(req.busboy);

	// Absolute path of the app image folder
	var dir = process.cwd() + '/public/images/' + req.params.id + '/';

	// Relative path of the app image folder saved in the database
	var relativeDir = '/images/' + req.params.id + '/';

	req.busboy.on('file', function(fieldname, file, filename) {
		fstream = fs.createWriteStream( dir + filename);
		file.pipe(fstream);
		fstream.on('close', function() {
			console.log('Successfully Uploaded!');

			var _id = mongoose.Types.ObjectId(req.params.id);

			Property.findOneAndUpdate(
				{'_id': _id},
				{$push: {'Images': {url: relativeDir+filename}}},
				{safe: true, upsert: false},
				function(err, property) {
					if(err) {
						console.log(err);
					 } else {
					 
					 	res.send('Successfully Uploaded!');
					 }

				}
			);
			
		});
	});
};

exports.uploadDelete = function(req, res) {
	// Delete one or more pictures associated to a property
	
	var file = process.cwd() + '/public/images/' + req.params.id + '/' + req.params.file;	
	
	var relativeDir = '/images/' + req.params.id + '/';
	//var _id = toObjectId(req.params.id);
	
	var _id = mongoose.Types.ObjectId(req.params.id);	
	
	// Remove form fs and then from database
	fs.unlink(file, function(err) {
		if(err) {
			console.log(err);
		} else {

			Property.findOneAndUpdate(
				{'_id': _id},
				{$pull: {'Images': {url: relativeDir + req.params.file}}},
				function(err, property) {
					if(err) {
						console.log(err);
					} else {
						res.send('Ok');

					}
				}
			);
		}
	});
};

