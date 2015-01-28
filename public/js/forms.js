jQuery(document).ready(function($) {

	var website = {

		init: function() {
			var self = this;
			self.makeId();
			self.calculateSum();
			self.updateSum();
			self.addItem();
			self.removeItem();
		},

		makeId: function() {
			var text = "";
		    	var possible = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";

		    	for( var i=0; i < 5; i++ )
		    		text += possible.charAt(Math.floor(Math.random() * possible.length));

	            	return text; 
		}, 
		calculateSum: function() {
			var sum = 0;

			$('.value').each( function() {
	        		if(!isNaN(this.value) && this.value.length!=0) {
			        	sum += parseFloat(this.value);
		        	}
			});

		        $(".total").html(sum.toFixed(2)); 	 	 
			//$('#total').val(sum.toFixed(2));
		}, 



		updateSum: function() {
			var self = this;

			$('.value').each( function() {
				$(this).keyup( function() {
					self.calculateSum();
				});
			}); 
		}, 

		addItem: function() {
			var self = this;
			jQuery("#addItem").on("click", function(event) {
				   
				event.preventDefault();

				var id = self.makeId();

				var node = '<div class="form-group"><input type="text" class="form-control col-xs-8" name="Financials[' + id + '][field]"><input type="text" class="form-control col-xs-3 value" name="Financials[' + id + '][value]"><input type="text" class="form-control hidden" name="Financials[' + id + '][idval]" value="' + id + '"><a href="#" class="removeItem"><i class="fa fa-times-circle col-xs-1"></i></a></div>';

				$(this).parent().parent().find('#totalContainer').before(node);

				self.removeItem();
				self.updateSum();

			});
		},

		removeItem: function() {
			var self = this;

			jQuery('.removeItem').on("click", function(event) {

				event.preventDefault();
				
				$(this).parent().remove();

				self.updateSum();

				self.calculateSum();

			});
		}

	};


	website.init();

	/******************************** ****/

	var dropzone = new Dropzone('#fileupload', {url: $('#fileupload').attr('action'), 

		init: function() {
			var thisDropzone = this;

			$.getJSON($('#fileupload').attr('action'), function(data) {
				$.each(data, function(key, value) {
					var mockFile = { name: value.name, size: value.size };
					thisDropzone.options.addedfile.call(thisDropzone, mockFile);
					thisDropzone.files.push(mockFile);
					//thisDropzone.options.thumbnail.call(thisDropzone, mockFile,  '/images/' + $('#fileupload').attr('action').split('/')[2]  + "/" + value.name);
					thisDropzone.options.thumbnail.call(thisDropzone, mockFile,  value.name);	
				});
			});
		},
		previewTemplate: "<div class=\"dz-preview dz-file-preview\">\n  <div class=\"dz-details\">\n        <img data-dz-thumbnail />\n  </div>\n  <div class=\"dz-progress\"><span class=\"dz-upload\" data-dz-uploadprogress></span></div>\n  <div class=\"dz-success-mark\"><span>✔</span></div>\n  <div class=\"dz-error-mark\"><span>✘</span></div>\n  <div class=\"dz-error-message\"><span data-dz-errormessage></span></div>\n</div>",
		addRemoveLinks: true,
	    	removedfile: function(file) {
			//var filePath = '/upload/delete/' + $('#fileupload').attr('action').split('/')[2] + "/" + file.name;
			var filePath = '/upload/delete/'  + file.name.slice(8);		
			$.get(filePath)
			var _ref;
			return (_ref = file.previewElement) != null ? _ref.parentNode.removeChild(file.previewElement) : void 0;
		},
	    	acceptedFiles: "image/*"

	});
	};			

});
