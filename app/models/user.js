var mongoose =
        require('mongoose');

var bcrypt = require('bcrypt-nodejs');

var userSchema = mongoose.Schema({
	Property:	  	  { type: String, required: true, index: {unique: true} },
	Password:        	  { type: String, required: true },
	Admin:			  { type: Boolean, default: false }, 
});
 
 
userSchema.methods.generateHash = function(password) {
	return bcrypt.hashSync(password, bcrypt.genSaltSync(8), null);
};
 
userSchema.methods.validPassword = function(password) {
	return bcrypt.compareSync(password, this.Password);
}
module.exports = mongoose.model('User', userSchema);
