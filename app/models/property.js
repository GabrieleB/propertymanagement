var mongoose =
        require('mongoose');


var bcrypt = require('bcrypt-nodejs');

var Schema = mongoose.Schema;

var propertySchema = mongoose.Schema({

	PropertyID:			  { type: String, required: true, index: {unique: true}   },

	Password:			  { type: String, required: true },
    	Admin:				  { type: Boolean, default: false },

	Owner : {
		Name:                     { type: String, required: true },
		Surname: 	 	  { type: String, required: true },
		Address: 		  String,
		City:			  String,
		State:			  String,
		Zip:			  String,
		Country:	          String,

		Tel:			  String,
		Email:			  String,

		Note:			  String,
	},

	Location: {
		AddressUnit:              { type: String, required: true },
		AddressUnitUrl:		  { type: String, default: '' },
		City:                     { type: String },
		State:                    { type: String },	
		Zip:                      { type: String, required: true},
		Country:                  String,

	},

	Info: {
		IdPasswdWifi:		  String,
		ManagementRef:		  String,
		FrontDeskTel:		  String,
		Bedrooms:		  { type: String, default: '1' },
		Bathrooms:		  String,
		Amenities:		  String,
		Description:		  String,
	},

	Rates: {
		LowSeason: {
			Day:		  { type: Number, min: 0 },
			Week:             { type: Number, min: 0 },
			Month:		  { type: Number, min: 0 },
		},
		HighSeason: {
			Day:		  { type: Number, min: 0 },
			Week:             { type: Number, min: 0 },
			Month:		  { type: Number, min: 0 },
		},
		MediumSeason: {
			Day:		  { type: Number, min: 0 },
			Week:             { type: Number, min: 0 },
			Month:		  { type: Number, min: 0 },
		},
	}, 

	Financials:			  Schema.Types.Mixed,

	Images:				  [
					  	{
							url: String
						}
					  ],

	Featured:			  { type: String, enum: ['Featured', 'NotFeatured'], default: 'NotFeatured'},
	Visible: 			  { type: String, enum: ['Visible', 'Hidden'], default: 'Hidden' },
});

propertySchema.pre('save', function(next) {

	this.Location.AddressUnit = _searchableString(this.Location.AddressUnit);
	this.Location.AddressUnitUrl = _createLocationUrl(this.Location.AddressUnit);

	next();
});

propertySchema.methods.generateHash = function(password) {
	return bcrypt.hashSync(password, bcrypt.genSaltSync(8), null);
};
 
 propertySchema.methods.validPassword = function(password) {
	return bcrypt.compareSync(password, this.Password);
}

function _searchableString(string) {
	return string.replace(/\s+/g, ' ').trim();
}

function _createLocationUrl(string) {
	return string.replace(/\s+/g, '-').replace(/#/g, '');
}

module.exports = mongoose.model('Property', propertySchema);
