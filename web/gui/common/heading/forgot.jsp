
<section class="h-100 " style="">
<!-- REGISTER SECTION -->
<div id="modal3" style="margin: 20px 0px ; display: flex ; justify-content: center">
    <div style="padding: 10px 20px ;background-color: #eee; border-radius: 12px ; width: 30%">
        <!--<form class="s12" action="forgotPassword" method="post">-->
            <div style="font-weight: 600 ; font-size: 20px">
                Reset Password
            </div>
            <div class="mt-2">
                <label for="emailForgot" style="font-size: 14px">Email</label>
                <!--                        <input type="text""
                                               onFocus="focusEmailForgot()
                                               id="emailForgot" style="width: 100% ; height: 28px"/>-->
                <input type="text" class="form-control validate" style="font-size: 15px; "
                       placeholder="Email" id="emailForgot" onFocus="focusEmailForgot()"/>
            </div>
            <label for="verifyCodeForgot" style="font-size: 14px">Reset Code</label>
            <div class="d-flex">
                <div class="form-group flex-1 mr-1">
                    <input type="text" onFocus="focusInputCodeForgot()"
                           id="verifyCodeForgot" style="width: 100% ; height: 28px"/>

                </div>
                <!--<div class="">-->
                <button type="button" class="form-group flex-1 mr-1" style="border: 1px solid #304156; border-radius: 6px ; padding: 0px 15px"
                        id="verifyCodeBtnForgot" onclick="verifyEmailForgot()">Verify Email</button>
                <!--</div>-->
            </div>
            <div class="d-flex">
                <div class="form-group flex-1 mr-1">
                    <label for="passwordForgot" style="font-size: 14px">Password</label>
                    <input type="password" onFocus="focusPassForgot()" style="width: 100% ; height: 28px" " disabled  id="passwordForgot"  />

                </div>

                <div class="form-group flex-1 ml-1">
                    <label for="comfirm-passwordForgot" style="font-size: 14px">Confirm password</label>
                    <input type="password" onFocus="focusConfirmPassForgot()" style="width: 100% ; height: 28px" disabled id="comfirm-passwordForgot"  />

                </div>
            </div>
            <p id="messageChangPassSuccess" style="color: blue; text-align: center;"></p>
            <p id="errorMessageForgot" style="color: red; text-align: center; margin-bottom: 30px;"></p>
            <div style="display: flex" class="mt-1">
                <button class="mr-4" id="saveNewPass" onclick="saveNewPassword()" style="border: 1px solid #304156; border-radius: 6px ; padding: 0px 15px">Save new password</button>
            </div>
        <!--</form>-->
    </div>
</div>
</section>

                        
<script>
//    let messageForgot = document.getElementById('messageForgot');
//    if (messageForgot.innerHTML !== '') {
//        document.getElementById('modal3').style.display = 'block';
//        document.getElementById('modal3').classList.add('in');
//        document.getElementById('btn-close').addEventListener('click', function () {
//            document.getElementById('modal3').style.display = 'none';
//            document.getElementById('modal3').classList.remove('in');
//        });
//    }
    
    let codeSendMailForgot= '';
    function verifyEmailForgot(){
        // mail phai co dang @gmail.com, @fpt.edu.vn
        codeSendMailForgot = '';
        let email = $('#emailForgot').val();
        
        
        if(email.includes("@gmail.com") || email.includes("@fpt.edu.vn")){
            let data = {
            emailForgot : email
            };

            $.ajax({
                url: '/SWP391-BL5-G6/forgotPassword',
                type: "POST",
                contentType: "application/json", // NOT dataType!
                data: JSON.stringify(data),
                success: function(response) {
                    // handle success

                    if(response.code != null){
                        codeSendMailForgot = response.code;
                        $('#emailForgot').prop('disabled', true);
                        
                        $('#passwordForgot').prop('disabled', false);
                        $('#comfirm-passwordForgot').prop('disabled', false);
                        $('#saveNewPass').removeClass('disabled');
                        $('#verifyCodeBtnForgot').addClass('disabled');
                    }else {
                        document.getElementById("errorMessageForgot").innerHTML = response.error;
                    }

                },
                error: function (xhr, status, error) {
                     // handle error
                    console.log("error: ", error);
                }
            });
        }else {
            document.getElementById("errorMessageForgot").innerHTML = "Email must be in the form @gmail.com and @fpt.edu.vn";
        }
    }
    
    function saveNewPassword(){
        let email = $('#emailForgot').val();
        let password = $('#passwordForgot').val();
        let confirmPass = $('#comfirm-passwordForgot').val();
        let verifyCode = $('#verifyCodeForgot').val();
        let data = {
            email : email,
            password : password
        };

        if(checkConfirmPassForgot()){
            if(verifyCode != codeSendMailForgot){
                document.getElementById("errorMessageForgot").innerHTML = "The code is not correct";
            }else {
                $.ajax({
                    url: '/SWP391-BL5-G6/updatePassForgot',
                    type: "POST",
                    contentType: "application/json", // NOT dataType!
                    data: JSON.stringify(data),
                    success: function(response) {
                        // handle success

                        if(response.messageChangPassSuccess != null){
                            document.getElementById("messageChangPassSuccess").innerHTML = response.messageChangPassSuccess;
                            document.getElementById("errorMessageForgot").innerHTML = "";
                           setTimeout(function() {
                                let btnClose = document.getElementById("changeLoginPage");
                                btnClose.click();
                            }, 3000);


                        }else {
                            document.getElementById("errorMessageForgot").innerHTML = response.error;
                        }

                    },
                    error: function (xhr, status, error) {
                         // handle error
                        console.log("error: ", error);
                    }
                });
            }

            
        } else {
            document.getElementById("errorMessageForgot").innerHTML = "Password don't match";
        }
    }
    
    function checkConfirmPassForgot() {
        var password = document.getElementById('passwordForgot');
        var confirm_password = document.getElementById('comfirm-passwordForgot');

        if (password.value !== confirm_password.value) {
            
            return false;
        }else {
            return true;
        }
    }

    function closeModal3() {
        document.getElementById('modal3').style.display = 'none';
        document.getElementById('modal3').classList.remove('in');

    }
    
    function focusEmailForgot(){
        document.getElementById("errorMessageForgot").innerHTML = '';
    }
    function focusPassForgot(){
        document.getElementById("errorMessageForgot").innerHTML = '';
    }
    function focusConfirmPassForgot(){
        document.getElementById("errorMessageForgot").innerHTML = '';
    }
    function focusInputCodeForgot(){
        document.getElementById("errorMessageForgot").innerHTML = '';
    }
</script>

