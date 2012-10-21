var firstname = $('#firstname');
var secondname= $('#secondname');
var fullnameFldMsg = $('#fullnameFldMsg');
var picbookid = $('#picbookid');
var yahooIdFldMsg = $('#yahooIdFldMsg');
var password = $('#password');
var passwordFldMsg = $('#passwordFldMsg');
var passwordconfirm = $('#passwordconfirm');
var confPasswordFldMsg = $('#confPasswordFldMsg');
var regForm = $('#regFormBody');

function validateFirstname(){  
        //if it's NOT valid  
        if(firstname.val()==""){   
            fullnameFldMsg.text("firstname cannot be empty");  
            fullnameFldMsg.css('color','#E46C6E');  
            return false;  
        }  
        //if it's valid  
        else{  
       
            fullnameFldMsg.text("What's your name?");  
            fullnameFldMsg.css('color','#B1B1B1');  
            return true;  
        }  
    }  
    
function validateSecondname(){  
        //if it's NOT valid  
        if(secondname.val()==""){   
            fullnameFldMsg.text("secondname cannot be empty");  
            fullnameFldMsg.css('color','#E46C6E');  
            return false;  
        }  
        //if it's valid  
        else{  
       
            fullnameFldMsg.text("What's your name?");  
            fullnameFldMsg.css('color','#B1B1B1');  
            return true;  
        }  
    }

function validatePass1(){  
 
      
        //it's NOT valid  
        if(password.val().length <5){  
        
            passwordFldMsg.text("Ey! Remember: At least 5 characters: letters, numbers and '_'");  
            passwordFldMsg.css('color','#E46C6E');  
            return false;  
        }  
        //it's valid  
        else{  
              
            passwordFldMsg.text("At least 5 characters: letters, numbers and '_'");  
            passwordFldMsg.css('color','#B1B1B1');    
            
            return true;  
        }  
    }  

function validatePass2(){  
     
        //are NOT valid  
        if( password.val() != passwordconfirm.val() ){  
             
            confPasswordFldMsg.text("Passwords doesn't match!");  
            confPasswordFldMsg.css('color','#E46C6E');  
            return false;  
        }  
        //are valid  
        else{  
             
            confPasswordFldMsg.text("Confirm password");  
            confPasswordFldMsg.css('color','#B1B1B1');  
            return true;  
        }  
    }  
    
      //On blur  
    firstname.blur(validateFirstname);  
    secondname.blur(validateSecondname);
    
    password.blur(validatePass1);  
    passwordconfirm.blur(validatePass2);  
    //On key press 
    firstname.keyup(validateFirstname);  
    secondname.keyup(validateSecondname);
   
    password.keyup(validatePass1);  
    passwordconfirm.keyup(validatePass2);  
    
    //On Submitting  
    regForm.submit(function(){  
        if(validateFirstname() && validateSecondname() && validatePass1() &&validatePass2()) 
            return true  
        else  
            return false;  
    }); 