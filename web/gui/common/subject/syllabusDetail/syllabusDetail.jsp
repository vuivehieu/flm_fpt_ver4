<%-- 
    Document   : syllabus
    Created on : 20-01-2023, 14:47:42
    Author     : phanh
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

        <jsp:include page="../../heading/heading.jsp"/>
        <!--SECTION START-->
        <section style=" margin-top: 2rem; ">
            <div class="com-sp pad-bot-70 pg-inn">
                <div class="row">
                    <div class="cor ">
                        <div class="col-md-12">
                            <div class="cor-con-mid">
                                <div class="row">
                                    <div class="col-md-3">
                                        <p style="font-weight: bold">Syllabus Detail</p>
                                        <h2>${subject.subjectCode}</h2>
                                    </div>
                                    <div class="col-md-6" style="display: flex;
                                         justify-content: center; margin-left: 30px">
                                        <ul>
                                            <li><a href="#" style="color: black;margin-right: 2px;font-weight: bold;">Overview</a></li>
                                            <li><a href="#" style="color: black;margin-right: 2px">CLOs</a></li>
                                            <li><a href="#" class="active" style="color: black;margin-right: 2px">CLO-PLOs</a></li>
                                            <li><a href="materialDetailView?slbid=${syllabus.slbid}&subjectCode=${subject.subjectCode}" style="color: black;margin-right: 2px">Material</a></li>
                                            <li><a href="#" style="color: black;margin-right: 2px">Schedule</a></li>
                                            <li><a href="#" style="color: black;margin-right: 2px">CQs</a></li>
                                            <li><a href="#" style="color: black;margin-right: 2px">Assessment</a></li>
                                        </ul>
                                    </div>
                                    <div class="col-md-3"></div>
                                </div>
                                <div class="cor-p4" style="margin-top: 25px">
                                    <c:set var="stopLoop" value="false"/>
                            <c:forEach var="role" items="${account.roles}">
                                <c:if test="${!stopLoop}">
                                    <c:if test="${(role.rid == 6) || (role.rid == 5) || (role.rid == 7)}">
                                        <button class="btn" style="border: 0.2px solid black;float: right;margin-right: 50px" onclick="showEditForm(${syllabus.slbid})">Edit Syllabus</button>
                                        <c:set var="stopLoop" value="true"/>
                                    </c:if>
                                </c:if>
                            </c:forEach>
                                    <div class="con-title">
                                <h2>${subject.subjectName_EN} - <span> ${subject.subjectCode}</span></h2>
                                <p>${subject.subjectName_VI}</p>
                                
                            </div>
                                </div>
                                                        <div>
                                    <ul>
                                        <li>
                                            <div class="pg-eve-desc subject-details">

                                                <h4 style="margin-bottom: 1rem">Syllabus Details </h4>
                                                <p>Syllabus ID: <span>${syllabus.slbid}</span></p>
                                                <p>Syllabus Name: <span>${syllabus.slbName_EN} - ${syllabus.slbName_VI}</span></p>
                                                <p>Subject Code: <span>${syllabus.subjectCode}</span></p>
                                                <p>No Credit: <span>${subject.noCredit}</span></p>
                                                <p>DegreeLevel: <span>${syllabus.degreeLevel}</span></p>
                                                <p>Time Allocation: <span>${syllabus.timeAllocation}</span></p>
                                                <p>Pre-Requisite: 
                                                    <span>
                                                        <c:forEach items="${syllabus.preReq}" var="i">
                                                            ${i.preReqCode}
                                                        </c:forEach>
                                                    </span>
                                                </p>
                                                <p>Description: <span>${syllabus.description}</span></p>
                                                <p>StudentTasks: <span>${syllabus.studentTask}</span></p>
                                                <p>Tools: <span>${syllabus.tool}</span></p>
                                                <p>IsApproved:  <span>${syllabus.isApproved}</span></p>
                                                <p>Note: <span>${syllabus.note}</span></p>
                                                <p>MinAvgMarkToPass: <span>${syllabus.minAvgMarkToPass}</span></p>
                                                <p>IsActive: <span>${syllabus.isActive}</span></p>
                                                <p>ApprovedDate: <span>${syllabus.approvedDate}</span></p>
                                            </div>
                                        </li>
                                    </ul>
                            </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!--SECTION END-->

        <jsp:include page="../../footer/footer.jsp"/>
        <script>
            function showEditForm(id){
                window.location.href='<%= request.getContextPath() %>/syllabusEdit?id='+id;
            }
        </script>

        <!--Import jQuery before materialize.js-->
        <script src="js/main.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/materialize.min.js"></script>
        <script src="js/custom.js"></script>
    </body>


</html>
