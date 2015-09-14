
var messages = new wijmo.collections.ObservableArray();


function extractMessageFromServer(url) {
	$.ajax({
	  url: url,
	  cache: false,
	  type: 'GET',
	  contentType: 'application/json; charset=utf-8',
	  data: {},
	  success: function (results) {
	      if (results.length > 0) {
	          for (i = 0; i < results.length; i++) {
	        	  messages.push({
		          		MESG_ID : results[i]["MESG_ID"],
		          		MESG_CODE : results[i]["MESG_CODE"],
		          		MESG_NOTE : results[i]["MESG_NOTE"]
	              });
	          	}   
	          
	      } 
	  	}
	})
}

function getMessage(code) {
	var message = "";
	if(messages.length > 0) {
		for (var i = 0; i < messages.length; i++) {
	    	if(messages.items[i].MESG_CODE == code) {
	    		message = messages.items[i].MESG_NOTE;
	    	} 
	    }		
	} else {
		message = "Message Error";
	}
	return message;
}


