<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

        <!--Start Content-->
        <!--        <div class="modal fade show" id="addModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" style="display: block !important;">-->

        <div class="modal-dialog modal-xl" role="document" style="margin-top: 100px; margin-bottom: 100px;">
            <div class="modal-content">
                <c:if test="${errorMessage!=null}">
                    <p style="color: red">${errorMessage}</p>
                </c:if>
                <form id="formAdd" class="needs-validation" method="POST" action="">
                    <div class="modal-header" style="background: #4F4F4F;padding: 10px;margin-bottom: 30px">
                        <h5 class="modal-title" id="exampleModalAdd" style="color: white">Edit Syllabus</h5>
                    </div>
                    <div class="modal-body">
                        <div class="row">
                            <div class="form-group col-md-12">
                                <label for="inputCode" class="ml-2" style="font-size: 15px; color:black">Syllabus Name(EN)</label>
                                <div class="input-group">
                                    <input type="text" class="form-control mt-2" id="inputNameEn" placeholder="Input Name(EN)" value="${syllabus.slbName_EN}" name="inputNameEn" aria-describedby="inputGroupPrepend" required style="font-size: 14px;">
                                    <input type="text" class="form-control mt-2" id="inputNameEn" placeholder="Input Name(EN)" value="${syllabus.slbName_EN}" name="inputNameEnOld" aria-describedby="inputGroupPrepend" required style="font-size: 14px;display: none">
                                    <input type="number" class="form-control mt-2" id="inputId" placeholder="Input Name(EN)" value="${syllabus.slbid}" name="inputId" aria-describedby="inputGroupPrepend" required style="font-size: 14px;display: none">
                                </div>
                            </div>
                            <div class="form-group col-md-12">
                                <label for="inputNameEn" class="ml-2" style="font-size: 15px; color:black">Syllabus Name(VI)</label>
                                <div class="input-group">
                                    <textarea type="text" class="form-control mt-2" id="inputNameVi" placeholder="Input Name(VI)" value="${syllabus.slbName_VI}" name="inputNameVi" aria-describedby="inputGroupPrepend" required style="font-size: 14px;">${syllabus.slbName_VI}</textarea>
                                    <input type="text" class="form-control mt-2" id="inputNameEn" placeholder="Input Name(EN)" value="${syllabus.slbName_VI}" name="inputNameViOld" aria-describedby="inputGroupPrepend" required style="font-size: 14px;display: none">

                                </div>
                            </div>
                            <div class="form-group col-md-12">
                                <label for="inputNameVi" class="ml-2" style="font-size: 15px; color:black">Degree Level</label>
                                <div class="input-group">
                                    <textarea type="text" cols="2" class="form-control mt-2" id="inputDegree" placeholder="Input Degree Level" value="${syllabus.degreeLevel}" name="inputDegree" aria-describedby="inputGroupPrepend" required style="font-size: 14px;">${syllabus.degreeLevel}</textarea>

                                </div>
                            </div>
                            <div class="form-group col-md-12">
                                <label for="inputTime" class="ml-2" style="font-size: 15px; color:black">Time Allocation</label>
                                <div class="input-group">
                                    <textarea type="text" col="2" class="form-control mt-2" rows="10" cols="70" id="inputTime" placeholder="Input Time Allocation" value="${syllabus.timeAllocation}" name="inputTime" aria-describedby="inputGroupPrepend" required style="font-size: 15px">${syllabus.timeAllocation}</textarea>

                                </div>
                            </div>
                            <div class="form-group col-md-12">
                                <label for="inputDescription" class="ml-2" style="font-size: 15px; color:black">Description</label>
                                <div class="input-group">
                                    <textarea type="text" col="2" class="form-control mt-2" rows="10" cols="70" id="inputDescription" placeholder="Input Description" value="${syllabus.description}" name="inputDescription" aria-describedby="inputGroupPrepend" required style="font-size: 15px;">${syllabus.description}</textarea>

                                </div>
                            </div>
                            <div class="form-group col-md-12">
                                <label for="inputTask" class="ml-2" style="font-size: 15px; color:black">Student Task</label>
                                <div class="input-group">
                                    <textarea type="text" col="2" class="form-control mt-2" rows="10" cols="70" id="inputTask" placeholder="Input Student Task" value="${syllabus.studentTask}" name="inputTask" aria-describedby="inputGroupPrepend" required style="font-size: 15px;">${syllabus.studentTask}</textarea>
                                </div>
                            </div>

                            <label class="ml-2" style="font-size: 15px;margin-left:.5rem!important;">Decision No</label>
                            <div class="form-group col-md-12">
                                <select class="js-example-basic-single form-control" style="width:100%" name="inputDecision">
                                    <c:forEach items="${decisions}" var="decision">
                                        <c:if test="${syllabus.decision!=null}">
                                            <option value="${decision.decisionNo}" ${syllabus.decision.decisionNo == decision.decisionNo? 'selected':''}><c:out value="${decision.decisionName}"/></option>
                                        </c:if>
                                        <c:if test="${syllabus.decision==null}">
                                            <option value="${decision.decisionNo}"><c:out value="${decision.decisionName}"/></option>
                                        </c:if>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="col-md-12 form-group">
                                <label class="ml-2" style="font-size: 15px">Status</label>
                            </div>
                            <c:set var="stopLoop" value="false"/>
                            <c:forEach var="role" items="${account.roles}">
                                <c:if test="${!stopLoop}">
                                    <c:if test="${(role.rid == 6) || (role.rid == 5) || (role.rid == 7)}">
                                        <div class="form-group col-md-6">
                                            <div class="input-group">

                                                <input type="radio" value="1" class="ml-2 mr-2 radio" id="inputStatus1" name="inputStatus" style="font-size: 2px;" aria-describedby="inputGroupPrepend" ${syllabus.isActive? 'checked="checked"' : ''}>
                                                <label for="inputStatus1" class="" style="font-size: 15px">Active</label>

                                                <input type="radio" value="0" class="ml-2 mr-2 radio" id="inputStatus2" name="inputStatus" style="font-size: 2px;" aria-describedby="inputGroupPrepend" ${!syllabus.isActive? 'checked="checked"' : ''}>
                                                <label for="inputStatus2" class="" style="font-size: 15px">Inactive</label>
                                            </div>                                    
                                        </div>
                                        <c:set var="stopLoop" value="true"/>
                                    </c:if>
                                </c:if>
                            </c:forEach>
                        </div>
                    </div>
                    <div class="modal-footer" style="margin: 0 auto; display: flex; justify-content: center; padding: 20px" >
                        <button class="btn btn-opacity-success" type="submit">Save</button>
                    </div>
                </form>
            </div>
        </div>
        <!--</div>--> 
        <!--End Content-->

        <jsp:include page="../footer/footer.jsp"/>



        <!-- JavaScript Libraries -->
        <script src="https://code.jquery.com/jquery-3.4.1.min.js">
        </script>
        <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet"/>
        <script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js" defer="defer"></script>
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
            $(document).ready(function () {
                $(".js-example-basic-single").select2();
            });
        </script>
    </body>


</html>
