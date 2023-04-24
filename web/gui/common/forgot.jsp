<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%--<c:set var="account" value="${cookie.userRole.value}" />--%>
<%--<c:set var="roles" value="${account.roles}" />--%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <title>Education Master Template</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="Free HTML Templates" name="keywords">
        <meta content="Free HTML Templates" name="description">

        <!-- Favicon -->
        <link href="fe/img/favicon.ico" rel="icon">

        <!-- Google Web Fonts -->
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap" rel="stylesheet">

        <!-- Font Awesome -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">

        <!-- Libraries Stylesheet -->
        <link href="fe/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
        <link href="fe/lib/lightbox/css/lightbox.min.css" rel="stylesheet">

        <!-- Customized Bootstrap Stylesheet -->
        <link href="fe/css/style.css" rel="stylesheet">


        <!--MDB--> 
        <script
            type="text/javascript"
            src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.2.0/mdb.min.js"
        ></script>

        <!--Font Awesome--> 
        <link
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"
            rel="stylesheet"
            />
        <!--Google Fonts--> 
        <link
            href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap"
            rel="stylesheet"
            />
        <!--MDB--> 
        <link
            href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.2.0/mdb.min.css"
            rel="stylesheet"
            />

        <style>
            .gradient-custom-2 {
                /* fallback for old browsers */
                background: #fccb90;

                /* Chrome 10-25, Safari 5.1-6 */
                background: -webkit-linear-gradient(to right, #ee7724, #d8363a, #dd3675, #b44593);

                /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
                background: linear-gradient(to right, #ee7724, #d8363a, #dd3675, #b44593);
            }

            @media (min-width: 768px) {
                .gradient-form {
                    height: 100vh !important;
                }
            }
            @media (min-width: 769px) {
                .gradient-custom-2 {
                    border-top-right-radius: .3rem;
                    border-bottom-right-radius: .3rem;
                }
            }
        </style>

    </head>

    <body>
        <jsp:include page="heading/heading.jsp"/>
        <!-- DISCOVER MORE -->

        <!-- About Start -->

        <!--        <div id="modal3" role="dialog">
                    <div class="container py-5 h-100">
                      <div class="row d-flex justify-content-center align-items-center h-100">
                        <div class="col-xl-10">
                          <div class="card rounded-3 text-black">
                            <div class="row g-0">
                              <div class="col-lg-6">
                                <div class="card-body p-md-5 mx-md-4" style="position: relative;">
                                  <a href="#" id="btn-close" style="position: absolute; top:10px; right:10px;" class="pop-close" data-dismiss="modal"><img style="width: 12px;height: 12px;" src="images/cancel.png" alt="" /></a>
                                  <div class="text-center">
                                    <h4 class="mt-1 mb-5 pb-1">Forgot password</h4>
                                  </div>
        
                                    <div class="form-group mb-4">
                                        <label class="form-label" for="emailForgot">Email</label>
                                      <input type="text" class="form-control validate" style="font-size: 15px; "
                                        placeholder="Email" id="emailForgot" onFocus="focusEmailForgot()"/>
        
                                    </div>
        
                                    <div class="form-group mb-4">
                                        <label class="form-label" for="passwordForgot">New Password</label>
                                      <input type="password" onFocus="focusPassForgot()" class="form-control validate" 
                                             style="font-size: 15px; " disabled  id="passwordForgot"  />
        
                                    </div>
        
                                    <div class="form-group mb-4">
                                        <label class="form-label" for="comfirm-passwordForgot">Confirm password</label>
                                       <input type="password" onFocus="focusConfirmPassForgot()" class="form-control validate" 
                                              style="font-size: 15px; " disabled id="comfirm-passwordForgot"  />
        
                                    </div>
        
                                  <div class="row">
                                    <div class="col-md-6 mb-4">
                                      <div class="form-group">
                                          <label class="form-label" for="verifyCodeForgot">Input Code</label>
                                           <input type="text" class="form-control validate" onFocus="focusInputCodeForgot()"
                                             id="verifyCodeForgot" style="font-size: 15px;"/>
        
                                      </div>
                                    </div>
                                    <div class="col-md-6 mb-4">
                                      <div class="form-outline">
                                          <label class="form-label" for="verifyCodeBtnForgot"></label>
                                          <button class="btn btn-primary btn-block fa-lg gradient-custom-2 mb-3" type="button" style="font-size: 15px; margin-top: 5px;" 
                                                  id="verifyCodeBtnForgot" onclick="verifyEmailForgot()">Verify Email</button>
                                      </div>
                                    </div>
                                  </div>
        
        
                                  <div class="text-center pt-1 pb-1">
                                    <button class="btn btn-primary btn-block fa-lg gradient-custom-2 mb-3 disabled" type="button" style="font-size: 15px;" id="saveNewPass" onclick="saveNewPassword()">Save new password</button>
                                  </div>
        
                                     <p id="messageChangPassSuccess" style="color: blue; text-align: center;"></p>
                                     <p id="errorMessageForgot" style="color: red; text-align: center; margin-bottom: 30px;"></p>
        
                                  <div class="input-field s12" style="text-align: center;"> <a href="#" data-dismiss="modal" data-toggle="modal" data-target="#modal1" onclick="closeModal3()" id="changeLoginPage">Are you a already member ? Login</a> </div>
        
                                </div>
                              </div>
                              <div class="col-lg-6 d-flex align-items-center gradient-custom-2">
                                <div class="text-white px-3 py-4 p-md-5 mx-md-4">
                                  <h4 class="mb-4" style="font-size: 15px;">Welcome to FPT Learning Material</h4>
                                  <p class="small mb-0" style="font-size: 15px;">Don't have an account? Create your account. It's take less then a minutes</p>
                                </div>
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>-->
        <jsp:include page="heading/forgot.jsp"/> 
        <jsp:include page="footer/footer.jsp"/> 
        <!-- JavaScript Libraries -->
        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
        <script src="fe/lib/easing/easing.min.js"></script>
        <script src="fe/lib/waypoints/waypoints.min.js"></script>
        <script src="fe/lib/owlcarousel/owl.carousel.min.js"></script>
        <script src="fe/lib/isotope/isotope.pkgd.min.js"></script>
        <script src="fe/lib/lightbox/js/lightbox.min.js"></script>

        <!-- Contact Javascript File -->
        <script src="fe/mail/jqBootstrapValidation.min.js"></script>
        <script src="fe/mail/contact.js"></script>

        <!-- Template Javascript -->
        <script src="fe/js/main.js"></script>    
    </body>

</html>
