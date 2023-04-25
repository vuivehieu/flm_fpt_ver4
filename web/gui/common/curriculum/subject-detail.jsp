
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="ckeditor" uri="http://ckeditor.com"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
            ul {
                list-style-type: none;
                margin: 0;
                padding: 0;
                overflow: hidden;
            }

            li {
                float: left;
            }

            li a {
                display: block;
                padding: 8px;
            }
        </style>

    </head>

    <body>

        <jsp:include page="../heading/heading.jsp"/>
        <!--SECTION START-->
        <section style=" margin-top: 2rem; ">
            <div class="com-sp pad-bot-70 pg-inn">
                <div class="row">
                    <div class="cor">
                        <div class="col-md-12">
                            <div class="cor-con-mid">
                                <div class="row">
                                    <div class="col-md-3">
                                        <p style="font-weight: bold;">Curriculum Detail</p>
                                        <h2>${curCode}</h2>
                                    </div>
                                    <div class="col-md-6" style="display: flex;
                                         justify-content: center; margin-left: 45px">
                                        <ul>
                                            <li><a href="curriculumDetails?curid=${curid}" style="color: black;margin-right: 2px;">Overview</a></li>
                                            <li><a href="poDetailView?id=${curid}" style="color: black;margin-right: 2px;">POs</a></li>
                                            <li><a href="ploDetailView?id=${curid}" style="color: black;margin-right: 2px">PLOs</a></li>
                                            <li><a href="ploDetailView?id=${curid}" style="color: black;margin-right: 2px">PLO-POs</a></li>
                                            <li><a href="subjectDetailView?id=${curid}" style="color: black;margin-right: 2px;font-weight: bold;">Subjects</a></li>
                                            <li><a href="subjectDetailView?id=${curid}" style="color: black;margin-right: 2px">Subject-PLOs</a></li>
                                            <li><a href="comboDetailView?id=${curid}" style="color: black;margin-right: 2px;">Combos</a></li>
                                            <li><a href="electiveDetailView?id=${curid}" style="color: black;margin-right: 2px;">Electives</a></li>
                                        </ul>
                                    </div>
                                    <div class="col-md-3"></div>
                                </div>
                                <div class="cor-p4" style="margin-top: 25px">
                                    <div class="table-responsive" style="margin-top: 30px;" id="root">
                                        <table class="table table-bordered cart_summary">
                                            <thead>
                                                <tr style="background-color: rgb(185, 182, 182);">
                                                    <th style="vertical-align: middle;">No</th>
                                                    <th style="vertical-align: middle;">Subject Code</th>
                                                    <th style="vertical-align: middle;">Subject Name</th>
                                                    <th style="vertical-align: middle;">Semester</th>
                                                    <th style="vertical-align: middle;">No Credits</th>
                                                    <th style="vertical-align: middle;">Note</th>
                                                    <th style="vertical-align: middle;">Prerequisite</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:set var="index" value="${start + 1}"/>
                                                <c:forEach items="${list}" var="item">
                                                    <tr>
                                                        <td>${index}</td>
                                                        <td>
                                                            <p>${item.subjectCode}</p>
                                                        </td>
                                                        <td>
                                                            <a href="#">
                                                                <p style="font-size: 18px; font-weight: 500; color: #ff6634" class="product-name">
                                                                    ${item.subjectName_EN}
                                                                </p>
                                                                <small class="cart_ref">${item.subjectName_VI}</small>
                                                            </a>
                                                        </td>
                                                        <td>${item.semester}</td>
                                                        <td>${item.noCredit}</td>
                                                        <td>${item.note}</td>
                                                        <td>${item.preRequiste}</td>
                                                    </tr>                       
                                                    <c:set var="index" value="${index + 1}"/>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!--SECTION END-->

        <jsp:include page="../footer/footer.jsp"/>  


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
