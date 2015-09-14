
var systemMessages = new wijmo.collections.ObservableArray();


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
	        	  systemMessages.push({
		          		MESG_ID : results[i]["MESG_ID"],
		          		MESG_CODE : results[i]["MESG_CODE"],
		          		MESG_NOTE : results[i]["MESG_NOTE"]
	              });
	          	}   
	          
	      } 
	  	}
	})
}

function getMessage(messageCode) {
	var message = "";
	if(systemMessages.length > 0) {
		for (var i = 0; i < systemMessages.length; i++) {
	    	if(systemMessages[i].MESG_CODE == messageCode) {
	    		message = systemMessages[i].MESG_NOTE;
	    	} 
	    }		
	} else {
		message = "Message Error";
	}
	return message;
}


