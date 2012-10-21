function shake(e, oncomplete, distance, time) {
	 // Handle arguments
	 if (typeof e === "string") e = document.getElementById(e);
	 if (!time) time = 500;
	 if (!distance) distance = 7;

	 var originalStyle = e.style.cssText;      
	 e.style.position = "relative";            
	 var start = (new Date()).getTime();       
	 animate();                                

		 function animate() {
	     var now = (new Date()).getTime();     
	     var elapsed = now-start;              
	     var fraction = elapsed/time;          

	     if (fraction < 1) {     
	         var x = distance * Math.sin(fraction*4*Math.PI);
	         e.style.left = x + "px";
     setTimeout(animate, Math.min(25, time-elapsed));
	     }
	     else {                 
	         e.style.cssText = originalStyle  
	         if (oncomplete) oncomplete(e);   
	     }
	 }
	}
	var loginForm = $('#login_form');
	var username = $('#username');
	var passwd = $('#passwd');
	var usernameMsg = $('#usernameMsg');
	var passwdMsg = $('#passwdMsg');
	function validateForm(){
		if(username.val()==""){
			shake("username");
			usernameMsg.css('display','inline-block');
			passwdMsg.css('display','none');
			return false;
		}
		else if(passwd.val()==""){
			shake("passwd");
			usernameMsg.css('display','none');
			passwdMsg.css('display','inline-block');
			return false;
		}
		else 
			return true;
	}
	loginForm.submit(function(){
		if(validateForm())
			return true;
		else 
			return false;
		
	});
	