
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
                                      <p>Curriculum Detail</p>
                                    <h2>${curCode}</h2>
                                </div>
                                <div class="col-md-9">
                                    <div style="margin-top: 20px">
                                        <a class="btn btn-warning color-warning-custom" href="curriculumDetails?curid=${curid}" role="button">Overview</a>
                                        <a class="btn btn-warning active color-warning-custom" href="poDetailView?id=${curid}" role="button">POs</a>
                                        <a class="btn btn-warning color-warning-custom" href="ploDetailView?id=${curid}" role="button">PLOs</a>
                                        <a class="btn btn-warning color-warning-custom" href="ploDetailView?id=${curid}" role="button">PLO-POs</a>
                                        <a class="btn btn-warning color-warning-custom" href="subjectDetailView?id=${curid}" role="button">Subjects</a>
                                        <a class="btn btn-warning color-warning-custom" href="subjectDetailView?id=${curid}" role="button">Subject-PLOs</a>
                                        <a class="btn btn-warning color-warning-custom" href="comboDetailView?id=${curid}" role="button">Combos</a>
                                        <a class="btn btn-warning color-warning-custom" href="electiveDetailView?id=${curid}" role="button">Electives</a>
                                    </div>
                                </div>
                                </div>
                                    <div class="cor-p4" style="margin-top: 25px">
                                    <div class="table-responsive" style="margin-top: 30px;" id="root">
                        <table class="table table-bordered cart_summary">
                            <thead>
                                <tr style="background-color: rgb(185, 182, 182);">
                                    <th style="vertical-align: middle;">No</th>
                                    <th style="vertical-align: middle;">PO Name</th>
                                    <th style="vertical-align: middle;">PO Description</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:set var="index" value="${start + 1}"/>
                                <c:forEach items="${list}" var="item">
                                    <tr>
                                        <td>${index}</td>
                                        <td>
                                            <p>${item.poName}</p>
                                        </td>
                                        <td>
                                            <p>
                                                ${item.poDescription}
                                            </p>
                                        </td>
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
