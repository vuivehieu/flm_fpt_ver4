<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%--<c:set var="account" value="${cookie.userRole.value}" />--%>
<%--<c:set var="roles" value="${account.roles}" />--%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <title>FLM System</title>
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
        <c:if test="${account == null}">
            <div style="position: relative;">
                <div class="py-5" style="width: 100vw; height: 90vh; overflow: hidden;">
                    <img style="object-fit: fill; width: 100%; height: 100%;" src="./fe/img/DH-FPT-4359-1612093890.jpg" alt="">
                </div>
                <div style="position: absolute; top: 50% ;left: 50%; transform: translate(-50%,-50%);">
                    <p style="font-size: 56px; font-weight: 700; color: #ff6634;;">FPT University</p>
                </div>
            </div>
        </c:if>

        <c:if test="${account != null}">

            <div class="" style="max-width: 80rem; margin: 3rem auto;">
                <div class="row">
                    <div class="col-sm-3 d-none" id="guest">
                        <div class="card" style="height: 180px; width: 310px">
                            <div class="card-body">
                                <h5 class="card-title">Guest Features</h5>
                                <a href="search?type=curriculum&keysearch=&filter=curCode" class="d-block text-black pb-2">View Curriculum</a>
                                <a href="search?type=preRequisite&keysearch=&filter=subjectName" class="d-block text-black pb-2">Subject Predecessors</a>
                                <a href="search?type=corollary&keysearch=&filter=subjectcode" class="text-black">Subject Successors</a>                                               
                            </div>
                        </div>
                    </div>

                    <div class="col-sm-3 d-none" id="student">
                        <div class="card" style="height: 180px; width: 310px">
                            <div class="card-body">
                                <h5 class="card-title">Student Features</h5>
                                <a href="search?type=curriculum&keysearch=&filter=curCode" class="d-block text-black pb-2">View Curriculum</a>
                                <a href="search?type=syllabus&keysearch=&filter=subjectcode" class="d-block text-black pb-2">View Training Syllabus</a>
                                <a href="search?type=preRequisite&keysearch=&filter=subjectName" class="d-block text-black pb-2">Subject Predecessors</a>
                                <a href="search?type=corollary&keysearch=&filter=subjectcode" class="text-black">Subject Successors</a> 
                            </div>
                        </div>
                    </div>

                    <div class="col-sm-3 d-none" id="teacher">
                        <div class="card" style="height: 180px; width: 310px">
                            <div class="card-body">
                                <h5 class="card-title">Teacher Features</h5>
                                <a href="search?type=curriculum&keysearch=&filter=curCode" class="d-block text-black pb-2">View Curriculum</a>
                                <a href="search?type=syllabus&keysearch=&filter=subjectcode" class="d-block text-black pb-2">View Training Syllabus</a>
                                <a href="search?type=preRequisite&keysearch=&filter=subjectName" class="d-block text-black pb-2">Subject Predecessors</a>
                                <a href="search?type=corollary&keysearch=&filter=subjectcode" class="text-black">Subject Successors</a> 
                            </div>
                        </div>
                    </div>

                    <div class="col-sm-3 d-none" id="admin">
                        <div class="card" style="height: 180px; width: 310px">
                            <div class="card-body">
                                <h5 class="card-title">Admin Features</h5>
                                <a href="admin-settings" class="d-block text-black pb-2">System Setting</a>
                                <a href="#" class="d-block text-black pb-2">Role Permissions</a>
                                <a href="admin-alluser" class="d-block text-black pb-2">User Management</a>
                                <a href="#" class="text-black">Decision Management</a>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row mt-5" >
                    <div class="col-sm-3 d-none" id="review">
                        <div class="card" style="height: 180px; width: 310px">
                            <div class="card-body">
                                <h5 class="card-title">Reviewer Features</h5>
                                <a href="#" class="d-block text-black pb-2">Review Syllabus</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-3 d-none" id="designer">
                        <div class="card" style="height: 180px; width: 310px">
                            <div class="card-body">
                                <h5 class="card-title">Designer Features</h5>
                                <a href="#" class="d-block text-black pb-2">Design Syllabus</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-3 d-none" id="staff">
                        <div class="card" style="height: 180px; width: 310px">
                            <div class="card-body">
                                <h5 class="card-title">CRDD Staff Features</h5>
                                <a href="#" class="d-block text-black pb-2">Manage Curriculum</a>
                                <a href="#" class="d-block text-black pb-2">Manage Subjects</a>
                                <a href="#" class="d-block text-black pb-2">Manage Syllabus</a>
                                <a href="#" class="d-block text-black">Material Decision</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-3 d-none" id="head">
                        <div class="card " style="height: 180px; width: 310px">
                            <div class="card-body">
                                <h5 class="card-title">CRDD Head Features</h5>
                                <a href="#" class="d-block text-black pb-2">Assign Curriculum</a>
                                <a href="#" class="d-block text-black pb-2">Approve, Disapprove Curriculum</a>
                                <a href="#" class="d-block text-black ">Approve, Disapprove Syllabus</a>
                                <a href="#" class="d-block text-black ">Approve, Disapprove Decision</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </c:if>

        <!-- About End -->

        <!-- FOOTER -->
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
        <script>
            function locCacPhanTuTrungLap(arr) {
                let uniqueArr = [];
                arr.forEach(function (item) {
                    if (!uniqueArr.includes(item)) {
                        uniqueArr.push(item);
                    }
                });
                return uniqueArr;
            }

            if (${roles}) {
                let roles = ${roles};

                console.log("roles", roles);
                let newRoles = [];
                roles.forEach(function (role) {
                    if (role == 6) {
                        newRoles.push("guest", "student", "teacher", "admin", "review", "designer", "staff", "head");
                    } else if (role == 1 || role == 2) {
                        newRoles.push("guest", "student");
                    } else if (role == 3) {
                        newRoles.push("guest", "student", "teacher");
                    } else if (role == 4 || role == 8) {
                        newRoles.push("guest", "review", "designer");
                    } else if (role == 5) {
                        newRoles.push("guest", "student", "teacher", "review", "designer", "staff", "head");
                    } else if (role == 7) {
                        newRoles.push("guest", "student", "teacher", "review", "designer", "staff");
                    }
                });
                console.log("new roles", newRoles);
                console.log("new roles after", locCacPhanTuTrungLap(newRoles));
                locCacPhanTuTrungLap(newRoles).forEach(function (role) {
                    if (role == 'guest') {
                        $('#guest').removeClass('d-none');
                    } else if (role == 'student') {
                        $('#student').removeClass('d-none');
                    } else if (role == 'teacher') {
                        $('#teacher').removeClass('d-none');
                    } else if (role == 'admin') {
                        $('#admin').removeClass('d-none');
                    } else if (role == 'review') {
                        $('#review').removeClass('d-none');
                    } else if (role == 'designer') {
                        $('#designer').removeClass('d-none');
                    } else if (role == 'staff') {
                        $('#staff').removeClass('d-none');
                    } else if (role == 'head') {
                        $('#head').removeClass('d-none');
                    }
                });
            }



        </script>

    </body>

</html>
