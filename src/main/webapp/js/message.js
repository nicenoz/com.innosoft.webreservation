// ===============
// Global Variable
// ===============
var message;
var messagesFromServer;
var code;

var messageNote;
var messageList;
var messagesCollection;

// ================
// Get Message Data
// ================
function extractMessageFromServer() {
	messagesFromServer = new wijmo.collections.ObservableArray();
	
	$.ajax({
	  url: 'http://localhost:8082/webreservation/api/message/list',
	  cache: false,
	  type: 'GET',
	  contentType: 'application/json; charset=utf-8',
	  data: {},
	  success: function (results) {
	      if (results.length > 0) {
	          for (i = 0; i < results.length; i++) {
	        	  messagesFromServer.push({
		          		MESG_ID : results[i]["MESG_ID"],
		          		MESG_CODE : results[i]["MESG_CODE"],
		          		MESG_NOTE : results[i]["MESG_NOTE"]
	              });
	          	}    	
	      } else {
	    	  alert('No data');
	      }
	  	}
	}).fail(function(xhr, textStatus, err) {
		alert(err);
	});
	
	return messagesFromServer;
}

// ===================
// Create Message Note
// ===================
function getMessage(code) {
	messageNote = new Array();
	
	for (var i = 0; i < messagesCollection.items.length; i++) {
    	if(messagesCollection.items[i].MESG_CODE == code) {
    		messageNote.push(messagesCollection.items[i].MESG_NOTE);
    		console.log(messageNote);
    	} 
    }
	
	return messageNote;
}

// ============
// On Load Page
// ============
$(document).ready(function () {
	extractMessageFromServer();
	
	messagesCollection = new wijmo.collections.CollectionView(messagesFromServer);
	getMessage(code);
});
