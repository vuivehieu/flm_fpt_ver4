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
            <title>Curriculum Management</title>

    </head>

    <body>
        <div class="app-admin-wrap-layout-1 sidebar-full sidebar-theme-slate">
            <jsp:include page="../common/heading/heading.jsp"/>
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
                                    <li class="breadcrumb-item active"><a href="#">Add Curriculum</a></li>
                                </ol>
                            </nav>
                        </div>
                    </div>
                </div>
                <div class="modal-dialog modal-xl" role="document">
                    <div class="modal-content">
                        <form id="formAdd" class="needs-validation" method="POST" action="">
                            <div class="modal-header" style="background: #304156;padding: 10px;">
                                <h5 class="modal-title" id="exampleModalAdd" style="color: white">Add Curriculum</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true" style="color: white">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <div class="row">
                                    <c:if test="${errorMessage!=null}">
                                        <p style="color: red">${errorMessage}</p>
                                    </c:if>
                                    <div class="form-group col-md-12">
                                        <label for="inputCode" class="ml-2" style="font-size: 15px; color:black">Curriculum Code</label>
                                        <div class="input-group">
                                            <input type="text" class="form-control mt-2" id="inputCode" placeholder="Input Code" value="" name="inputCode" aria-describedby="inputGroupPrepend" required style="font-size: 14px;">
                                        </div>
                                    </div>
                                    <div class="form-group col-md-12">
                                        <label for="inputNameEn" class="ml-2" style="font-size: 15px; color:black">Curriculum Name(EN)</label>
                                        <div class="input-group">
                                            <textarea type="text" class="form-control mt-2" id="inputNameEn" placeholder="Input Name(EN)" value="" name="inputNameEn" aria-describedby="inputGroupPrepend" required style="font-size: 14px;"></textarea>

                                        </div>
                                    </div>
                                    <div class="form-group col-md-12">
                                        <label for="inputNameVi" class="ml-2" style="font-size: 15px; color:black">Curriculum Name(VI)</label>
                                        <div class="input-group">
                                            <textarea type="text" cols="2" class="form-control mt-2" id="inputNameVi" placeholder="Input Name(VI)" value="" name="inputNameVi" aria-describedby="inputGroupPrepend" required style="font-size: 14px;"></textarea>

                                        </div>
                                    </div>
                                    <div class="form-group col-md-12">
                                        <label for="inputDescription" class="ml-2" style="font-size: 15px; color:black">Description</label>
                                        <div class="input-group">
                                            <textarea type="text" col="2" class="form-control mt-2" rows="10" cols="70" id="inputDescription" placeholder="Input Description" value="" name="inputDescription" aria-describedby="inputGroupPrepend" required style="font-size: 15px;height: 150px;"></textarea>

                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer" style="margin: 0 auto; display: flex; justify-content: center" >
                                <button class="btn btn-opacity-success" type="submit">Save</button>
                            </div>
                        </form>
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
                                                                    </body>

                                                                    </html>