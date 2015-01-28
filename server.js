var express             =               require('express');
var app                 =               express();

var port                =               process.env.PORT || 8888;

var mongoose            =               require('mongoose');
var passport            =               require('passport');
var flash               =               require('connect-flash');
var morgan              =               require('morgan');
var cookieParser        =               require('cookie-parser');
var bodyParser          =               require('body-parser');
var session             =               require('express-session');
var configDB            =               require('./config/database.js');

var swig                =               require('swig');

var validator		=		require('express-validator');

var busboy 		=		require('connect-busboy');

var nodemailer		=		require('nodemailer');


// Configuration =============================================
mongoose.connect(configDB.url);

require('./config/passport')(passport);

app.use(morgan('dev')); // Log every request to console
app.use(cookieParser()); // read cookies (needed for auth)
app.use(bodyParser.json()); // get informations from html forms
app.use(bodyParser.urlencoded({extended: true}));
app.use(validator());

// For managing uploaded images
app.use(busboy());

// Swig engine
app.engine('swig', swig.renderFile); // setup 

app.set('view engine', 'swig');
app.set('views', __dirname + '/views');
     
// Passport 
app.use(session({secret: 'prova', resave: true, saveUninitialized: true})); // session secre
app.use(passport.initialize());
app.use(passport.session()); // persistent login session

// Flash
app.use(flash()); // use connect-flash for flash messages stored in session

// Server static when not used with a webserver
app.use(express.static(__dirname + '/public'));
      
       
// Routes ======================================================
require('./app/routes.js')(app, passport); // Load our routes and pass in our app and fully configurated passport
        
        
          
// Launch ======================================================
app.listen(port);
console.log('The magic is on port ' + port);
