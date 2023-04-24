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
            <title>Syllabus Management</title>

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
                                        <li class="breadcrumb-item active"><a href="#">Syllabus Management</a></li>
                                    </ol>
                                </nav>
                            </div>
                        </div>
                    </div>
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="row align-items-center">
                                    <!--                                    <div class="col-sm-12 col-md-6">
                                                                            <div class="input-group" style="position: relative;width: 25%;margin-left: auto;margin-bottom: 15px;float: left">
                                                                                <select class="form-control js-basic-example2" id="filterRole" style="margin-left:-2%;background: #cfcfcf;border-radius: 20px;padding: 10px 20px;" onchange="filter()">
                                                                                    <option value="0">All</option>
                                    <c:forEach items="${roles}" var="role">
                                        <option value="${role.rid}" ${filterRole == role.rid? 'selected' : ''}><c:out value="${role.rname}"/></option>
                                    </c:forEach>
                                </select>
                                <div class="input-group-append" style="position: absolute;right: 0;z-index: 10;">
                                </div>
                            </div>
                            <div class="input-group" style="position: relative;width: 30%;margin-left: 25px;margin-bottom: 15px;float: left">
                                <select class="form-control js-basic-example2" id="filterStatus" style="margin-left:-2%;background: #cfcfcf;border-radius: 20px;padding: 10px 20px;" onchange="filter()">
                                    <option value="3">All</option>
                                    <option value="0" ${filterStatus == 0? 'selected' : ''}>Inactive</option>
                                    <option value="1" ${filterStatus == 1? 'selected' : ''}>Active</option>
                                    <option value="2" ${filterStatus == 2? 'selected' : ''}>Not Verify Email</option>
                                </select>
                                <div class="input-group-append" style="position: absolute;right: 0;z-index: 10;">
                                </div>
                            </div>
                        </div>-->
                                    <div class="col-sm-12 col-md-12">
                                        <div class="input-group" style="position: relative;width: 75%;margin-left: auto;margin-bottom: 15px;">
                                            <input class="form-control" id="textSearch" value="${search eq ''? '' : search}" type="text" placeholder="Search for result" style="margin-left:50%;background: #cfcfcf;border-radius: 20px;padding: 10px 20px;">
                                                <div class="input-group-append" style="position: absolute;right: 0;z-index: 10;">
                                                    <button class="btn btn-secondary"  type="button" onclick="search()">
                                                        <i class="fa fa-search"></i>
                                                    </button>
                                                </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="card-header" style="background: #242939 ;display: flex;justify-content: space-between;">
                                    <h2 class="p-1 m-0 text-16 font-weight-semi " style="color: white">Syllabus Management</h2>
                                    <div style="color: white" class="p-1 m-0 text-16">
                                        <!--<i class="fa fa-plus" aria-hidden="true" data-toggle="modal" data-target="#ModalAdd" style="cursor: pointer"></i>-->
                                        <a href="syllabusDetail?type=add"><i class="fa fa-plus" aria-hidden="true"  style="cursor: pointer"></i></a>
                                    </div>
                                </div>
                                <div class="card">
                                    <div class="card-body table-responsive">
                                        <table id="example" style="text-align: center" class="table">
                                            <tbody>
                                                <tr>
                                                    <th>ID</th>
                                                    <th>Subject Code</th>
                                                    <th>Syllabus Name(EN)</th>
                                                    <th>Status</th>
                                                    <th>Approved</th>
                                                    <th></th>
                                                </tr>
                                                <c:forEach items="${list}" var="item">
                                                    <tr>
                                                        <td>${item.slbid}</td>
                                                        <td>${item.subjectCode}</td>
                                                        <td>
                                                            <a href="#">
                                                                <p style="font-size: 18px; font-weight: 500; color: #ff6634" class="product-name">${item.slbName_EN}</p>
                                                                <small class="cart_ref">${item.slbName_VI}</small>
                                                            </a>
                                                        </td>
                                                        <td>
                                                            <c:if test="${item.isActive}">
                                                                <span class="badge badge-success">Active</span>
                                                            </c:if>
                                                            <c:if test="${!item.isActive}">
                                                                <span class="badge badge-danger">Inactive</span>
                                                            </c:if>
                                                        </td>
                                                        <td>
                                                            <c:if test="${item.isApproved}">
                                                                <span class="badge badge-success">Active</span>
                                                            </c:if>
                                                            <c:if test="${!item.isApproved}">
                                                                <span class="badge badge-danger">Inactive</span>
                                                            </c:if>
                                                        </td>
                                                        <td>
                                                            <a href="syllabusUpdate?slbid=${item.slbid}" id="btnDetail"
                                                                    class="btn text-primary rounded-circle m-0 btn-sm btn-icon"
                                                                    style="height: 0px !important;"><i
                                                                    class="material-icons">edit</i>
                                                                <div class="ripple-container"></div>
                                                            </a>
                                                            <!--                                                            <button
                                                                                                                            class="btn text-danger rounded-circle m-0 btn-sm btn-icon"
                                                                                                                            style="height: 0px !important;" onclick="document.getElementById('deleteLink').href = 'SyllabusDeleteCotroller?id=${item.slbid}&pageNo=${pagination.pageNo}&search=${search}&filter=${filter}';
                                                                                                                                    openModal(${result.id})"><i
                                                                                                                                class="material-icons">delete</i></button>-->
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                        <c:if test="${totalPages == 0}">
                                            <h4 style="text-align: center"> Record not found !</h4>
                                        </c:if>
                                        <ul class="pagination justify-content-center font-weight-bold">
                                            <li class="page-item">
                                                <c:if test="${pagination.pageNo > 1}">
                                                    <button class="page-link" ><i class="material-icons " onclick="onPage(1,${pagination.pageSize}, '${search}')">keyboard_double_arrow_left</i>
                                                    </c:if>
                                            </li>
                                            <li class="page-item">
                                                <c:if test="${pagination.pageNo > 1}">
                                                    <button class="page-link" ><i class="material-icons " onclick="onPage(${pagination.pageNo - 1},${pagination.pageSize}, '${search}')">keyboard_arrow_left</i>
                                                    </c:if>
                                            </li>
                                            <c:forEach var="page" begin="1" end="${totalPages}">
                                                <li aria-current="page" class="page-item ${pagination.pageNo == page? 'active' :''}">
                                                    <c:choose>
                                                        <c:when test="${page == pagination.pageNo}">
                                                            <button class="page-link page-number">${page}</button>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <button class="page-link page-number" onclick="onPage(${page},${pagination.pageSize}, '${search}')">${page}</button>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </li>
                                            </c:forEach>
                                            <li class="page-item">
                                                <c:if test="${not empty list && pagination.pageNo != totalPages}">
                                                    <button class="page-link" onclick="onPage(${pagination.pageNo+1},${pagination.pageSize}, '${search}')"><i class="material-icons">keyboard_arrow_right</i>
                                                    </button>
                                                </c:if>
                                            </li>
                                            <li class="page-item">
                                                <c:if test="${not empty list && pagination.pageNo != totalPages}">
                                                    <button class="page-link" onclick="onPage(${totalPages},${pagination.pageSize}, '${search}')"><i class="material-icons">keyboard_double_arrow_right</i>
                                                    </c:if>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--modal delete-->
                    <div aria-hidden="true" aria-labelledby="exampleModalLabel" class="modal fade" id="ModalDelete" role="dialog"
                         tabindex="-1">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header" style="background: #304156;padding: 10px;">
                                    <h5 class="modal-title" id="exampleModalLabel" style="color: white">
                                        Delete Syllabus</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true" style="color: white">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body">
                                    <h4>Are you sure want to delete?</h4>
                                </div>
                                <div class="modal-footer" style="margin: 0 auto; display: flex ; justify-content: space-between">
                                    <a id="deleteLink" class="btn btn-opacity-danger" href="#">
                                        <%--              <button class="btn btn-opacity-danger " style="margin-left: 12px;" type="button">--%>
                                        Delete
                                        <%--              </button>--%>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--modal add-->
                    <div class="modal fade" id="ModalAdd" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">

                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <form id="formAdd" class="needs-validation" method="POST" action="admin-adduser">
                                    <div class="modal-header" style="background: #304156;padding: 10px;">
                                        <h5 class="modal-title" id="exampleModalAdd" style="color: white">Add Syllabus</h5>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true" style="color: white">&times;</span>
                                        </button>
                                    </div>
                                    <div class="modal-body">
                                        <div class="row">
                                            <input type="text" name="slbid" value="${syllabus.slbid}" hidden/>

                                            <label class="ml-2" style="font-size: 15px;margin-left:.5rem!important;">Subject Code: ${syllabus.subjectCode}<span class="text-danger">*</span></label>
                                            <div class="form-group col-md-6">
                                                <select class="form-control js-basic-example2" id="inputRole" name="inputRole" style="width: 100%" required>
                                                    <c:forEach items="${allSubject}" var="item">
                                                        <option value="${item.subjectCode}" ${item.subjectCode==syllabus.subjectCode ? 'selected' : '' }>
                                                            ${item.subjectCode}
                                                        </option>
                                                    </c:forEach>
                                                </select>
                                            </div>

                                            <!--Start-->
                                            <div class="form-group col-md-6">
                                                <label for="inputFullName" class="ml-2" style="font-size: 15px; color:black">Syllabus Name EN</label>
                                                <div class="input-group">
                                                    <input value="${syllabus.slbName_EN}" name="slbName_EN" type="text" class="form-control mt-2" id="tag"  aria-describedby="inputGroupPrepend" required style="font-size: 14px;">
                                                </div>
                                            </div>
                                            <!------->
                                            <div class="form-group col-md-6">
                                                <label for="inputEmail" class="ml-2" style="font-size: 15px; color:black">Syllabus Name VI</label>
                                                <div class="input-group">
                                                    <input value="${syllabus.slbName_VI}" name="slbName_VI" type="text" class="form-control mt-2" id="name"  aria-describedby="inputGroupPrepend" required style="font-size: 14px;">
                                                </div>
                                            </div>
                                            <!--end-->

                                             <!--Start-->
                                            <div class="form-group col-md-6">
                                                <label for="inputFullName" class="ml-2" style="font-size: 15px; color:black">Degree Level</label>
                                                <div class="input-group">
                                                    <input id="subjectNameEN" name="degreeLevel" type="text" value="${syllabus.degreeLevel}" class="form-control mt-2"  aria-describedby="inputGroupPrepend" required style="font-size: 14px;">
                                                </div>
                                            </div>
                                            <!------->
                                            <div class="form-group col-md-6">
                                                <label for="inputEmail" class="ml-2" style="font-size: 15px; color:black">Time Allocation</label>
                                                <div class="input-group">
                                                    <input id="subjectNameVI" type="text" name="timeAllocation" value="${syllabus.timeAllocation}" class="form-control mt-2"  aria-describedby="inputGroupPrepend" required style="font-size: 14px;">
                                                </div>
                                            </div>
                                            <!--end-->
                                                    
                                            
                                            <div class="input-field col s6">
                                                <input type="radio" id="isActive" name="isActive" ${syllabus.isActive ? 'checked' : '' } value="true"
                                                    class="validate">
                                                <label for="isActive">Active</label>
                                                <input type="radio" id="unActive" name="isActive" ${syllabus.isActive ? '' : 'checked' } value="false"
                                                    class="validate">
                                                <label for="unActive">unActive</label>
                                            </div>
                                            <div class="input-field col s6">
                                                <input type="radio" id="isApproved" name="isApproved" ${syllabus.isApproved ? 'checked' : '' } value="true"
                                                    class="validate">
                                                <label for="isApproved">Approved</label>
                                                <input type="radio" id="unApproved" name="isApproved" ${syllabus.isApproved ? '' : 'checked' } value="false"
                                                    class="validate">
                                                <label for="unApproved">unApproved</label>
                                            </div>
                                             
                                                    
                                                    
                                            

                                            <div class="form-group col-md-12">
                                                <label for="inputFullName" class="ml-2" style="font-size: 15px; color:black">Fullname</label>
                                                <div class="input-group">
                                                    <input type="text" class="form-control mt-2" id="inputFullName" placeholder="Input Fullname" name="inputFullName" aria-describedby="inputGroupPrepend" required style="font-size: 14px;">

                                                </div>
                                            </div>


                                            <label class="ml-2" style="font-size: 15px;margin-left:.5rem!important;">Role</label>
                                            <div class="form-group col-md-12">
                                                <select class="form-control js-basic-example2" id="inputRole" name="inputRole" style="width: 100%" required>
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
                                                            </div>
                                                            <div class="modal-footer" style="margin: 0 auto; display: flex; justify-content: center" >
                                                                <button class="btn btn-opacity-success" type="submit">Save</button>
                                                            </div>
                                                            </form>
                                                            </div>
                                                            </div>
                                                            </div>
                                                
                                                
                                                            <div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">

                                                                <div class="modal-dialog" role="document">
                                                                    <div class="modal-content">
                                                                        <form id="formEdit" class="needs-validation" method="POST" action="admin-updateuser">
                                                                            <div class="modal-header" style="background: #304156;padding: 10px;">
                                                                                <h5 class="modal-title" id="exampleModalAdd" style="color: white">Edit User</h5>
                                                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                                                    <span aria-hidden="true" style="color: white">&times;</span>
                                                                                </button>
                                                                            </div>
                                                                            <div class="modal-body">
                                                                                <div class="row">
                                                                                    <div class="form-group col-md-12">
                                                                                        <label for="updateUsername" class="ml-2" style="font-size: 15px; color:black">Username</label>
                                                                                        <div class="input-group">
                                                                                            <input type="text" class="form-control mt-2" id="updateUsername" disabled placeholder="Input Username" value="" name="updateUsername4" aria-describedby="inputGroupPrepend" required style="font-size: 14px;">
                                                                                                <input type="text" class="form-control mt-2" id="updateUsername3" placeholder="Input Username" value="" name="updateUsername" aria-describedby="inputGroupPrepend" style="font-size: 14px;display: none">
                                                                                                    <input type="text" class="form-control mt-2" id="updateId" placeholder="Input Username" value="" name="updateId" aria-describedby="inputGroupPrepend" style="font-size: 14px;display: none">
                                                                                                        </div>
                                                                                                        </div>
                                                                                                        <div class="form-group col-md-12">
                                                                                                            <label for="updateFullName" class="ml-2" style="font-size: 15px; color:black">Fullname</label>
                                                                                                            <div class="input-group">
                                                                                                                <input type="text" class="form-control mt-2" id="updateFullName" disabled placeholder="Input Fullname" value="" name="updateFullName" aria-describedby="inputGroupPrepend" required style="font-size: 14px;">

                                                                                                            </div>
                                                                                                        </div>
                                                                                                        <div class="form-group col-md-12">
                                                                                                            <label for="updateEmail" class="ml-2" style="font-size: 15px; color:black">Email</label>
                                                                                                            <div class="input-group">
                                                                                                                <input type="text" class="form-control mt-2" id="updateEmail" disabled placeholder="Input Fullname" value="" name="updateEmail" aria-describedby="inputGroupPrepend" required style="font-size: 14px;">

                                                                                                            </div>
                                                                                                        </div>
                                                                                                        <div class="form-group col-md-12">
                                                                                                            <label for="updateAvatar" class="ml-2" style="font-size: 15px; color:black">Avatar</label>  
                                                                                                            <div class="input-group">
                                                                                                                <input type="text" class="form-control mt-2" id="updateAvatar" disabled placeholder="Input Fullname" value="" name="updateAvatar" aria-describedby="inputGroupPrepend" required style="font-size: 14px;">
                                                                                                            </div>
                                                                                                        </div>
                                                                                                        <label class="ml-2" style="font-size: 15px;margin-left:.5rem!important;">Role</label>
                                                                                                        <div class="form-group col-md-12">
                                                                                                            <select class="form-control js-basic-example2" id="updateRole" name="updateRole" style="width: 100%" required>
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
                                                                                                        <div class="form-group col-md-12">
                                                                                                            <div class="input-group">
                                                                                                                <label for="updateStatus1" class="ml-2" style="font-size: 15px">Active</label>
                                                                                                                <input type="radio" value="1" class="form-control mt-2" id="updateStatus1" name="updateStatus" style="font-size: 2px;" aria-describedby="inputGroupPrepend">
                                                                                                                    <label for="updateStatus2" class="ml-2" style="font-size: 15px">Inactive</label>
                                                                                                                    <input type="radio" value="0" class="form-control mt-2" id="updateStatus2" name="updateStatus" style="font-size: 2px;" aria-describedby="inputGroupPrepend">
                                                                                                                        <label for="updateStatus3" class="ml-2" style="font-size: 15px">Not Verify Email</label>
                                                                                                                        <input type="radio" value="2" class="form-control mt-2" id="updateStatus3" name="updateStatus" style="font-size: 2px;" aria-describedby="inputGroupPrepend">
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
                                                                                                                            <!---->
                                                                                                                            <!-- End:: Footer-->
                                                                                                                            </div>
                                                                                                                            <!-- End::Main header-->
                                                                                                                            </div>
                                                                                                                            </div>

                                                                                                                            <script src="admin-template/js/vendors.bundle.min.js"></script>
                                                                                                                            <script src="admin-template/js/main.bundle.min.js"></script>
                                                                                                                            <script src="admin-template/vendors/datatables.net/js/jquery.dataTables.min.js"></script>
                                                                                                                            <script src="admin-template/vendors/datatables.net-bs4/js/dataTables.bootstrap4.min.js"></script>
                                                                                                                            <script src="admin-template/js/pages/datatables/basicDatatable.min.js"></script>
                                                                                                                            <script type="text/javascript">
                                                        $(document).ready(function () {
                                                            $(".js-basic-example2").select2({
                                                                theme: "classic"
                                                            });
                                                        });
                                                        function onPage(pageNo, pageSie, search) {
                                                            if (search === '') {
                                                                window.location.href = `syllabusList?pageNo=` + pageNo;
                                                            } else {
                                                                window.location.href = `syllabusList?pageNo=` + pageNo + `&search=` + search;
                                                            }
                                                        }
                                                        function filter() {
                                                            const searchValue = "${search}";
                                                            const filterRole = document.getElementById("filterRole").value;
                                                            const filterStatus = document.getElementById("filterStatus").value;
                                                            if (searchValue === '') {
                                                                if (filterRole !== 0 && filterStatus !== 3) {
                                                                    window.location.href = `admin-alluser?pageNo=1&filterRole=` + filterRole + `&filterStatus=` + filterStatus;
                                                                } else if (filterRole !== 0) {
                                                                    window.location.href = `admin-alluser?pageNo=1&filterRole=` + filterRole;
                                                                } else if (filterStatus !== 3) {
                                                                    window.location.href = `admin-alluser?pageNo=1&filterStatus=` + filterStatus;
                                                                }
                                                            } else {
                                                                if (filterRole !== 0 && filterStatus !== 3) {
                                                                    window.location.href = `admin-alluser?pageNo=1&filterRole=` + filterRole + `&filterStatus=` + filterStatus + '&search=' + searchValue;
                                                                } else if (filterRole !== 0) {
                                                                    window.location.href = `admin-alluser?pageNo=1&filterRole=` + filterRole + '&search=' + searchValue;
                                                                } else if (filterStatus !== 3) {
                                                                    window.location.href = `admin-alluser?pageNo=1&filterStatus=` + filterStatus + '&search=' + searchValue;
                                                                }
                                                            }
                                                        }
                                                        function search() {
                                                            const searchValue = document.getElementById("textSearch").value;
                                                            if (searchValue === '') {
                                                                window.location.href = `syllabusList`;
                                                            } else
                                                                window.location.href = `syllabusList?search=` + searchValue;

                                                        }
                                                        $('#editModal').on('show.bs.modal', function (event) {
                                                            var button = $(event.relatedTarget); // Button that triggered the modal
                                                            var status = button.data('status'); // Extract value from data-* attributes
                                                            var role = button.data('role');
                                                            var id = button.data('userid');
                                                            var name = button.data('name');
                                                            var avatar = button.data('avatar');
                                                            var username = button.data('username');
                                                            var email = button.data('email');
                                                            console.log(status);
                                                            console.log(role);
                                                            console.log(id);
                                                            // Set the selected value of the "statusRadio" radio buttons based on the "data-status" attribute
                                                            if (status === 1) {
                                                                $('#updateStatus1').prop('checked', 'checked');
                                                            } else if (status === 2) {
                                                                $('#updateStatus3').prop('checked', 'checked');
                                                            } else {
                                                                $('#updateStatus2').prop('checked', 'checked');
                                                            }
                                                            $('#updateId').attr('value', id);
                                                            $('#updateAvatar').attr('value', avatar);
                                                            $('#updateFullName').attr('value', name);
                                                            $('#updateUsername3').attr('value', username);
                                                            $('#updateUsername').attr('value', username);
                                                            $('#updateEmail').attr('value', email);
                                                            $('#updateRole').val(role)
                                                            $('#updateRole').val(role).trigger('change');

                                                        });
                                                        function openModal(id) {
                                                            $("#ModalDelete").modal('show');
                                                        }
                                                        ;
                                                                                                                            </script>
                                                                                                                            </body>


                                                                                                                            </html>