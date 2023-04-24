                

<section>
    <!--LOGIN SECTION--> 
    <div style="margin: 20px 0px ; display: flex ; justify-content: center">
        <div style="padding: 10px 20px ;background-color: #eee; border-radius: 12px ; width: 30%">
            <form class="s12" action="login" method="post">
                <div style="font-weight: 600 ; font-size: 20px">
                    User Login
                </div>
                <div class="mt-2">
                    <label for="userName" style="font-size: 14px">Email, Mobile,or User Name*</label>
                    <input type="text" id="userName" name="userName" style="width: 100% ; height: 28px" />
                </div>
                <div class="mt-2">
                    <label for="password" style="font-size: 14px">Password*</label>
                    <input type="password" id="password" name="password" style="width: 100% ; height: 28px" />
                </div>
                <p style="font-size: 14px ;color: red;text-align: center ; margin-top: 6px" id="messageLogin">${error != null ? error : ''}</p>
                <div style="display: flex" class="mt-3">
                    <button class="mr-4" type="submit" style="border: 1px solid #304156; border-radius: 6px ; padding: 0px 15px">Sign In</button>
                    <button style="border: 1px solid #304156; border-radius: 6px ; padding: 0px 15px">
                        <a 
                            style="color : black"
                            href="https://accounts.google.com/o/oauth2/auth?scope=email%20profile%20openid&openid.realm&include_granted_scopes=true&redirect_uri=http://localhost:8080/SWP391-BL5-G6/loginGoogle&response_type=code&client_id=85314650649-qt98rm1tth046spr9j93ka3qo1mjcuns.apps.googleusercontent.com&approval_prompt=force">
                            Login Google
                        </a> 
                    </button>
                </div>
                <div class="d-flex justify-content-lg-around mt-4">
                    <p class="mb-0">
                        No account yet?
                    </p>
                    <a style="text-decoration: underline" href="/SWP391-BL5-G6/register">
                        Register User
                    </a>
                </div>
                <div class="d-flex justify-content-center">
                    <a style="text-decoration: underline" href="/SWP391-BL5-G6/forgotPassword">Forgot Password?</a>
                </div>
            </form>
        </div>
    </div>
</section>

<script>
    let messageLogin = document.getElementById('messageLogin');
    if (messageLogin.innerHTML !== '') {
        document.getElementById('modal1').style.display = 'block';
        document.getElementById('modal1').classList.add('in');
    }

</script>
