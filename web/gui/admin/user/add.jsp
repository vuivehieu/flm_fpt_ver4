<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="en" xml:lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width,initial-scale=1" />
        <meta http-equiv="X-UA-Compatible" content="ie=edge" />
        <link href="https://fonts.googleapis.com/css?family=Material+Icons" rel="stylesheet" />
        <link href="https://fonts.googleapis.com/css2?family=Archivo:ital,wght@0,400;0,500;0,600;0,700;1,400&amp;display=swap" rel="stylesheet" />
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" />
        <link rel="stylesheet" href="admin-template/css/vendors.bundle.min.css" />
        <link rel="stylesheet" href="admin-template/vendors/datatables.net-bs4/css/dataTables.bootstrap4.min.css" />
        <link rel="stylesheet" href="admin-template/css/main.bundle.min.css"/>
        <script src="https://code.jquery.com/jquery-3.2.1.min.js" integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4=" crossorigin="anonymous"></script>
        <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet"/>
        <script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js" defer="defer"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css">
            <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js"></script>
            <title>User Management</title>

    </head>

    <body>
        <div class="app-admin-wrap-layout-1 sidebar-full sidebar-theme-slate">
            <!--== MAIN CONTRAINER ==-->
            <jsp:include page="../common/heading/heading.jsp"/>

            <!--== BODY CONTNAINER ==-->
            <div>
                <div class="main-content-body">
                    <!-- Start:: content (Your custom content)  -->
                    <div class="subheader px-lg" style="padding: 0">
                        <div class="subheader-container">
                            <div class="subheader-main">
                                <nav aria-label="breadcrumb" class="ul-breadcrumb">
                                    <ol class="ul-breadcrumb-items">
                                        <li class="breadcrumb-home"><a href="#"> <i class="material-icons"
                                                                                    >home</i></a></li>
                                        <li class="breadcrumb-item"><a href="#">FLM</a></li>
                                        <li class="breadcrumb-item active"><a href="#">Add User Management</a></li>
                                    </ol>
                                </nav>
                            </div>
                        </div>
                    </div>
                    
                    
                    <div style="max-width: 720px; margin-left: auto; margin-right: auto;">
                        <form id="formAdd" class="needs-validation" method="POST" action="admin-adduser" enctype="multipart/form-data">
                            
                            <div class="">
                                <div class="form-group col-md-12">
                                    <label for="inputUsername" class="ml-2" style="font-size: 15px; color:black">Username</label>
                                    <div class="input-group">
                                        <input type="text" onFocus="focusUserName()" class="form-control mt-2" id="inputUsername" placeholder="Input Username" name="inputUsername" aria-describedby="inputGroupPrepend" required style="font-size: 14px;"/>
                                    </div>
                                </div>
<!--                                <div class="form-group col-md-12 d-none">
                                    <label for="inputPassword" class="ml-2" style="font-size: 15px; color:black">Password</label>
                                    <div class="input-group">
                                        <input type="password" class="form-control mt-2" id="inputPassword" placeholder="Input Password" name="inputPassword" aria-describedby="inputGroupPrepend" required style="font-size: 14px;">
                                    </div>
                                </div>-->
                                <div class="form-group col-md-12">
                                    <label for="inputFullName" class="ml-2" style="font-size: 15px; color:black">Fullname</label>
                                    <div class="input-group">
                                        <input type="text" class="form-control mt-2" id="inputFullName" placeholder="Input Fullname" name="inputFullName" aria-describedby="inputGroupPrepend" required style="font-size: 14px;"/>

                                    </div>
                                </div>
                                <div class="form-group col-md-12">
                                    <label for="inputEmail" class="ml-2" style="font-size: 15px; color:black">Email</label>
                                    <div class="input-group">
                                        <input type="email" onFocus="focusEmail()" class="form-control mt-2" id="inputEmail" placeholder="Input Email" name="inputEmail" aria-describedby="inputGroupPrepend" required style="font-size: 14px;"/>

                                    </div>
                                </div>
                                <div class="form-group col-md-12 ">
                                    <label for="inputAvatar" class="ml-2" style="font-size: 15px; color:black">Avatar</label>
                                    <div class="input-group">
                                        <input type="file" class="form-control mt-2" id="inputAvatar" placeholder="Input Avatar" name="inputAvatar" aria-describedby="inputGroupPrepend" style="font-size: 14px;"></input>
                                    </div>
                                </div>
                                <label class="ml-2" style="font-size: 15px;margin-left:.5rem!important;">Role</label>
                                <div class="form-group col-md-12">
                                    <select class="js-example-basic-multiple" name="states[]" multiple="multiple">
                                        <c:forEach items="${roles}" var="role">
                                            <c:if test="${role.rid != 6}">
                                                <option value="${role.rid}"><c:out value="${role.rname}"/></option>
                                            </c:if>
                                        </c:forEach>
                                    </select>
                                </div>

                                <div class="col-md-12 form-group">
                                    <label class="ml-2" style="font-size: 15px">Status</label>
                                </div>
                                <div class="form-group col-md-6">
                                    <div class="input-group">
                                        <label for="inputStatus1" class="ml-2" style="font-size: 15px">Active</label>
                                        <input type="radio" value="1" class="form-control mt-2" id="inputStatus1" name="inputStatus" style="font-size: 2px;" aria-describedby="inputGroupPrepend">
                                            <label for="inputStatus2" class="ml-2" style="font-size: 15px">Inactive</label>
                                            <input type="radio" value="0" class="form-control mt-2" id="inputStatus2" name="inputStatus" style="font-size: 2px;" aria-describedby="inputGroupPrepend">
                                    </div>                                    
                                </div>
                            </div>
                            
                            <div class="" style="margin: 0 auto; display: flex; justify-content: center" >
                                        <button class="btn btn-opacity-success" type="submit">Save</button>
                            </div>
                        </form>
                        <p style="font-size: 14px ;color: red;text-align: center ; margin-top: 6px" id="errorMessage">${error != null ? error : ''}</p>
                    </div>  
                    
                    
                </div>
            </div>
        </div>

        <script src="admin-template/js/vendors.bundle.min.js"></script>
        <script src="admin-template/js/main.bundle.min.js"></script>
        <script src="admin-template/vendors/datatables.net/js/jquery.dataTables.min.js"></script>
        <script src="admin-template/vendors/datatables.net-bs4/js/dataTables.bootstrap4.min.js"></script>
        <script src="admin-template/js/pages/datatables/basicDatatable.min.js"></script>
        <script type="text/javascript">
            function focusUserName(){
                document.getElementById("errorMessage").innerHTML = '';
            }
            function focusEmail(){
                document.getElementById("errorMessage").innerHTML = '';
            }  
        </script>
        <script>
            $(document).ready(function() {
              $(".js-example-basic-multiple").select2();
            });
        </script>
        
    </body>
</html>