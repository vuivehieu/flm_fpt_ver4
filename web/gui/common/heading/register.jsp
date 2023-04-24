           
<section class="h-100 " style="">
      <!-- REGISTER SECTION -->
<div id="modal2" style="margin: 20px 0px ; display: flex ; justify-content: center">
    <div style="padding: 10px 20px ;background-color: #eee; border-radius: 12px ; width: 30%">
        <!--<form class="s12" action="register" method="post">-->
            <div style="font-weight: 600 ; font-size: 20px">
                User Register
            </div>
            <div class="mt-2">
                <label for="userName" style="font-size: 14px">User Name</label>
                <input type="text" disabled
                       id="userName" onFocus="focusUserName()" style="width: 100% ; height: 28px"/>
            </div>
            <div class="mt-2">
                <label for="fullName" style="font-size: 14px">Full Name</label>
                <input type="text" disabled
                       id="fullName" style="width: 100% ; height: 28px"/>
            </div>
            <div class="mt-2">
                <label for="email" style="font-size: 14px">Email</label>
                <input type="text""
                       id="email" onFocus="focusEmail()" style="width: 100% ; height: 28px"/>
            </div>
            <label for="verifyCode" style="font-size: 14px">Input Code</label>
            <div class="d-flex">
                <div class="form-group flex-1 mr-1">
                    <input type="text" onFocus="focusInputCode()"
                           id="verifyCode" style="width: 100% ; height: 28px"/>

                </div>
                <!--<div class="">-->
                <button type="button" class="form-group flex-1 mr-1" style=" font-size: 14px; border: 1px solid #304156; border-radius: 6px ; padding: 0px 10px"
                     id="verifyCodeBtn" onclick="verifyEmail()">Send Verification Code</button>
                <!--</div>-->
            </div>
            <div class="d-flex">
                <div class="form-group flex-1 mr-1">
                    <label for="password" style="font-size: 14px">Password</label>
                    <input type="password" onFocus="focusPass()" style="width: 100% ; height: 28px" " disabled  id="password"  />

                </div>

                <div class="form-group flex-1 ml-1">
                    <label for="comfirm-password" style="font-size: 14px">Confirm password</label>
                    <input type="password" onFocus="focusConfirmPass()" style="width: 100% ; height: 28px" disabled id="comfirm-password"  />

                </div>
            </div>
            <p id="messageRegister" style="color: blue; text-align: center;"></p>
            <p id="errorMessage" style="color: red; text-align: center"></p>
            <div style="display: flex" class="mt-1">
                <button class="mr-4" id="register" onclick="register()" style="border: 1px solid #304156; border-radius: 6px ; padding: 0px 15px">Register</button>
            </div>
        <!--</form>-->
    </div>
</div>
</section>

<script>
    let codeSendMail = '';
    function verifyEmail(){
        // mail phai co dang @gmail.com, @fpt.edu.vn
        codeSendMail = '';
        let email = $('#email').val();
        
        if(email.includes("@gmail.com") || email.includes("@fpt.edu.vn")){
            let data = {
            email : email
            };

            $.ajax({
                url: '/SWP391-BL5-G6/comfirmEmail',
                type: "POST",
                contentType: "application/json", // NOT dataType!
                data: JSON.stringify(data),
                success: function(response) {
                    // handle success

                    if(response.code != null){
                        codeSendMail = response.code;
                        $('#email').prop('disabled', true);
                        $('#userName').prop('disabled', false);
                        $('#fullName').prop('disabled', false);
                        $('#password').prop('disabled', false);
                        $('#comfirm-password').prop('disabled', false);
                        $('#register').removeClass('disabled');
                        $('#verifyCodeBtn').addClass('disabled');
                    }else {
                        document.getElementById("errorMessage").innerHTML = response.error;
                    }

                },
                error: function (xhr, status, error) {
                     // handle error
                    console.log("error: ", error);
                }
            });
        }else {
            document.getElementById("errorMessage").innerHTML = "Email must be in the form @gmail.com and @fpt.edu.vn";
        }
    }

    function register(){
        let userName = $('#userName').val();
        let fullName = $('#fullName').val();
        let email = $('#email').val();
        let password = $('#password').val();
//                            let confirmPass = $('#comfirm-password').val();
        let verifyCode = $('#verifyCode').val();
        let data = {
            userName : userName,
            fullName : fullName,
            email : email,
            password : password
        };
        console.log("data" ,data)
        if(checkConfirmPass()){
            if(verifyCode != codeSendMail){
                document.getElementById("errorMessage").innerHTML = "The code is not correct";
            }else {
                $.ajax({
                url: '/SWP391-BL5-G6/register',
                type: "POST",
                contentType: "application/json", // NOT dataType!
                data: JSON.stringify(data),
                success: function(response) {
                    // handle success
                    console.log('response' ,response)
                    if(response.messageRegister != null){
                        document.getElementById("messageRegister").innerHTML = response.messageRegister;

//                        setTimeout(function() {
//                            let btnClose = document.getElementById("btn-close-2");
//                            btnClose.click();
//                        }, 3000);


                    }else {
                        document.getElementById("errorMessage").innerHTML = response.error;
                    }

                },
                error: function (xhr, status, error) {
                     // handle error
                    console.log("error: ", error);
                }
            });
            }

            
        }
    }


    function checkConfirmPass() {
        var password = document.getElementById('password');
        var confirm_password = document.getElementById('comfirm-password');

        if (password.value !== confirm_password.value) {
//                                event.preventDefault();
            document.getElementById("errorMessage").innerHTML = "Password don't match";
            return false;
        }else {
            return true;
        }
    }

    function closeModal2() {
        document.getElementById('modal2').style.display = 'none';
        document.getElementById('modal2').classList.remove('in');

    }


    function focusUserName(){
        document.getElementById("errorMessage").innerHTML = '';
    }
    function focusEmail(){
        document.getElementById("errorMessage").innerHTML = '';
    }
    function focusPass(){
        document.getElementById("errorMessage").innerHTML = '';
    }
    function focusConfirmPass(){
        document.getElementById("errorMessage").innerHTML = '';
    }
    function focusInputCode(){
        document.getElementById("errorMessage").innerHTML = '';
    }

</script>
