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
                                        <li class="breadcrumb-item active"><a href="#">Curriculum Management</a></li>
                                    </ol>
                                </nav>
                            </div>
                        </div>
                    </div>
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="row align-items-center">
                                    <div class="col-sm-12 col-md-6">
                                        <div class="input-group" style="position: relative;width: 25%;margin-left: auto;margin-bottom: 15px;float: left">
                                            <!--                                    <select class="form-control js-basic-example2" id="filterType" style="margin-left:-2%;background: #cfcfcf;border-radius: 20px;padding: 10px 20px;" onchange="filter()">-->
                                            <!--                                        <option value="application" ${filter == 'application' ? 'selected' : ''}><spring:message code="file.media"/></option>-->
                                            <!--                                        <option value="image" ${filter == 'image' ? 'selected' : ''}><spring:message code="file.file"/></option>-->
                                            <!--                                    </select>-->
                                            <div class="input-group-append" style="position: absolute;right: 0;z-index: 10;">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-12 col-md-6">
                                        <div class="input-group" style="position: relative;width: 75%;margin-left: auto;margin-bottom: 15px;">
                                            <input class="form-control" id="textSearch" value="" type="text" placeholder="Search for result" style="margin-left:-2%;background: #cfcfcf;border-radius: 20px;padding: 10px 20px;" onkeyup="if (event.keyCode === 13)
                                                        search();">
                                                <div class="input-group-append" style="position: absolute;right: 0;z-index: 10;">
                                                    <button class="btn btn-secondary"  type="button" onclick="search()">
                                                        <i class="fa fa-search"></i>
                                                    </button>
                                                </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="card-header" style="background: #242939 ;display: flex;justify-content: space-between;">
                                    <h2 class="p-1 m-0 text-16 font-weight-semi " style="color: white">Curriculum Management</h2>
                                    <div style="color: white" class="p-1 m-0 text-16">
                                        <i class="fa fa-plus" aria-hidden="true" data-toggle="modal" data-target="#addModal" style="cursor: pointer"></i>
                                    </div>
                                </div>
                                <div class="card">
                                    <div class="card-body table-responsive">
                                        <table id="example" style="text-align: center" class="table">
                                            <tbody>
                                                <tr>
                                                    <th class="sort-handler cursor-pointer">Curriculum Code</th>
                                                    <th class="sort-handler cursor-pointer">Curriculum Name(EN)</th>
                                                    <th class="sort-handler cursor-pointer">Curriculum Name(VI)</th>
                                                    <th class="sort-handler cursor-pointer">Description</th>
                                                    <th class="sort-handler cursor-pointer">Approved</th>
                                                    <th style="width: 5%"></th>
                                                </tr>
                                                <c:forEach items="${curriculums}" var="item">
                                                    <tr>
                                                        <td>
                                                            <a href="#">
                                                                <span class="list-enq-name">${item.curCode}</span>
                                                            </a>
                                                        </td>
                                                        <td>${item.curName_EN}</td>
                                                        <td>${item.curName_VI}</td>
                                                        <td style="display: -webkit-box; -webkit-line-clamp: 4; -webkit-box-orient: vertical; overflow: hidden; line-height: 3em;">${item.description}</td>
                                                        <td>
                                                            <c:if test="${item.isApproved}">
                                                                <span class="badge badge-success">Approved</span>
                                                            </c:if>
                                                            <c:if test="${!item.isApproved}">
                                                                <span class="badge badge-danger">Not Approved</span>
                                                            </c:if>
                                                        </td>
                                                        <td>
                                                            <button id="btnDetail"
                                                                    data-id="${item.curid}" data-curcode="${item.curCode}" data-curnameen="${item.curName_EN}" data-curnamevi="${item.curName_VI}" data-description="${item.description}"
                                                                    data-target="#editModal"
                                                                    data-toggle="modal"
                                                                    aria-hidden="true"
                                                                    class="btn text-primary rounded-circle m-0 btn-sm btn-icon"
                                                                    style="height: 0px !important;"><i
                                                                    class="material-icons">edit</i>
                                                                <div class="ripple-container"></div>
                                                            </button>
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
                                                    <button class="page-link"><i class="material-icons" onclick="onPage(1, '${search}')">keyboard_double_arrow_left</i></button>
                                                </c:if>
                                            </li>
                                            <li class="page-item">
                                                <c:if test="${pagination.pageNo > 1}">
                                                    <button class="page-link"><i class="material-icons" onclick="onPage(${pagination.pageNo - 1}, '${search}')">keyboard_arrow_left</i></button>
                                                </c:if>
                                            </li>
                                            <c:forEach var="page" begin="${(pagination.pageNo - 2) > 0 ? (pagination.pageNo - 2) : 1 }" end="${(pagination.pageNo + 2) < totalPages ? (pagination.pageNo + 2) : totalPages }">
                                                <li aria-current="page" class="page-item ${pagination.pageNo == page? 'active' :''}">
                                                    <c:choose>
                                                        <c:when test="${page == pagination.pageNo}">
                                                            <button class="page-link page-number">${page}</button>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <button class="page-link page-number" onclick="onPage(${page}, '${search}')">${page}</button>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </li>
                                            </c:forEach>
                                            <li class="page-item">
                                                <c:if test="${not empty curriculums && pagination.pageNo != totalPages}">
                                                    <button class="page-link" onclick="onPage(${pagination.pageNo+1}, '${search}')"><i class="material-icons">keyboard_arrow_right</i></button>
                                                </c:if>
                                            </li>
                                            <li class="page-item">
                                                <c:if test="${not empty curriculums && pagination.pageNo != totalPages}">
                                                    <button class="page-link" onclick="onPage(${totalPages}, '${search}')"><i class="material-icons">keyboard_double_arrow_right</i></button>
                                                </c:if>
                                            </li>
                                        </ul>


                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">

                        <div class="modal-dialog modal-xl" role="document">
                            <div class="modal-content">
                                <form id="formAdd" class="needs-validation" method="POST" action="add-curriculum">
                                    <div class="modal-header" style="background: #304156;padding: 10px;">
                                        <h5 class="modal-title" id="exampleModalAdd" style="color: white">Add Curriculum</h5>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true" style="color: white">&times;</span>
                                        </button>
                                    </div>
                                    <div class="modal-body">
                                        <div class="row">
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
                                                    <textarea type="text" col="2" class="form-control mt-2" rows="10" cols="70" id="inputDescription" placeholder="Input Description" value="" name="inputDescription" aria-describedby="inputGroupPrepend" required style="font-size: 15px;resize: none;"></textarea>

                                                </div>
                                            </div>
                                            <label class="ml-2" style="font-size: 15px;margin-left:.5rem!important;">Decision</label>
                                            <div class="form-group col-md-12">
                                                <select class="form-control js-basic-example2" id="inputDecision" name="inputDecision" style="width: 100%" required>
                                                    <c:forEach items="${decisions}" var="item">
                                                        <option value="${item.decisionNo}"><c:out value="${item.decisionName}"/></option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                            <label class="ml-2" style="font-size: 15px;margin-left:.5rem!important;">Major</label>
                                            <div class="form-group col-md-12">
                                                <select class="form-control js-basic-example2" id="inputMajor" name="inputMajor" style="width: 100%" required>
                                                    <c:forEach items="${majors}" var="item">
                                                        <option value="${item.majorID}"><c:out value="${item.majorName_VI}"/></option>
                                                    </c:forEach>
                                                </select>
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

                        <div class="modal-dialog modal-xl" role="document">
                            <div class="modal-content">
                                <form id="formEdit" class="needs-validation" method="POST" action="update-curriculum">
                                    <div class="modal-header" style="background: #304156;padding: 10px;">
                                        <h5 class="modal-title" id="exampleModalAdd" style="color: white">Update Curriculum</h5>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true" style="color: white">&times;</span>
                                        </button>
                                    </div>
                                    <div class="modal-body">
                                        <div class="row">
                                            <div class="form-group col-md-12">
                                                <label for="updateUsername" class="ml-2" style="font-size: 15px; color:black">Curriculum Code</label>
                                                <div class="input-group">
                                                    <input type="text" class="form-control mt-2" id="updateCode" disabled placeholder="Input Username" value="" name="updateCode" aria-describedby="inputGroupPrepend" required style="font-size: 14px;">
                                                        <input type="text" class="form-control mt-2" id="updateCode2" placeholder="Input Username" value="" name="updateCode2" aria-describedby="inputGroupPrepend" style="font-size: 14px;display: none">
                                                            <input type="text" class="form-control mt-2" id="updateId" placeholder="Input Username" value="" name="updateId" aria-describedby="inputGroupPrepend" style="font-size: 14px;display: none">
                                                                </div>
                                                                </div>
                                                                <div class="form-group col-md-12">
                                                                    <label for="updateNameEn" class="ml-2" style="font-size: 15px; color:black">Curriculum Name(EN)</label>
                                                                    <div class="input-group">
                                                                        <textarea type="text" class="form-control mt-2" id="updateNameEn" placeholder="Input Fullname" value="" name="updateNameEn" aria-describedby="inputGroupPrepend" required style="font-size: 14px;"></textarea>

                                                                    </div>
                                                                </div>
                                                                <div class="form-group col-md-12">
                                                                    <label for="updateNameVi" class="ml-2" style="font-size: 15px; color:black">Curriculum Name(VI)</label>
                                                                    <div class="input-group">
                                                                        <textarea type="text" cols="2" class="form-control mt-2" id="updateNameVi" placeholder="Input Fullname" value="" name="updateNameVi" aria-describedby="inputGroupPrepend" required style="font-size: 14px;"></textarea>

                                                                    </div>
                                                                </div>
                                                                <div class="form-group col-md-12">
                                                                    <label for="updateDescription" class="ml-2" style="font-size: 15px; color:black">Description</label>
                                                                    <div class="input-group">
                                                                        <textarea type="text" col="2" class="form-control mt-2" rows="10" cols="70" id="updateDescription" placeholder="Input Description" value="" name="updateDescription" aria-describedby="inputGroupPrepend" required style="font-size: 15px;resize: none;"></textarea>

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
                                                        let currentIndex;
                                                        let oldText;
                                                        $(".sort-handler").click(function (e) {
                                                            const index = $(this).index();
                                                            if (index != currentIndex || !currentIndex) {
                                                                if (oldText) {
                                                                    $($('.sort-handler').get(currentIndex)).html(oldText);
                                                                }
                                                                currentIndex = index;
                                                            }
                                                            if (!$(this).text().includes(oldText) || !oldText) {
                                                                oldText = $(this).text();
                                                            }
                                                            // if (oldText.include('&#8593;')){
                                                            //     oldText.replace('&#8593;', '');
                                                            // } else if (oldText.include('&#8595;')){
                                                            //     oldText.replace('&#8595;', '');
                                                            // }
                                                            $(this).html(oldText + ' &#8593;');
                                                            var table, rows, switching, i, x, y, shouldSwitch, dir, switchcount = 0;
                                                            table = document.getElementById("example");
                                                            switching = true;
                                                            //Set the sorting direction to ascending:
                                                            dir = "asc";
                                                            /*Make a loop that will continue until
                                                             no switching has been done:*/
                                                            while (switching) {
                                                                //start by saying: no switching is done:
                                                                switching = false;
                                                                rows = table.rows;
                                                                /*Loop through all table rows (except the
                                                                 first, which contains table headers):*/
                                                                for (i = 1; i < (rows.length - 1); i++) {
                                                                    //start by saying there should be no switching:
                                                                    shouldSwitch = false;
                                                                    /*Get the two elements you want to compare,
                                                                     one from current row and one from the next:*/
                                                                    x = rows[i].getElementsByTagName("TD")[index];
                                                                    y = rows[i + 1].getElementsByTagName("TD")[index];
                                                                    /*check if the two rows should switch place,
                                                                     based on the direction, asc or desc:*/
                                                                    if (dir == "asc") {
                                                                        if (new Intl.Collator().compare(x.innerHTML.toLowerCase(), y.innerHTML.toLowerCase()) == 1) {
                                                                            //if so, mark as a switch and break the loop:
                                                                            shouldSwitch = true;
                                                                            break;
                                                                        }
                                                                    } else if (dir == "desc") {
                                                                        if (new Intl.Collator().compare(x.innerHTML.toLowerCase(), y.innerHTML.toLowerCase()) == -1) {
                                                                            //if so, mark as a switch and break the loop:
                                                                            shouldSwitch = true;
                                                                            break;
                                                                        }
                                                                    }
                                                                }
                                                                if (shouldSwitch) {
                                                                    /*If a switch has been marked, make the switch
                                                                     and mark that a switch has been done:*/
                                                                    rows[i].parentNode.insertBefore(rows[i + 1], rows[i]);
                                                                    switching = true;
                                                                    //Each time a switch is done, increase this count by 1:
                                                                    switchcount++;
                                                                } else {
                                                                    /*If no switching has been done AND the direction is "asc",
                                                                     set the direction to "desc" and run the while loop again.*/
                                                                    if (switchcount == 0 && dir == "asc") {
                                                                        $(this).html(oldText + ' &#8595;');
                                                                        dir = "desc";
                                                                        switching = true;
                                                                    }
                                                                }
                                                            }
                                                        });
                                                        $('#editModal').on('show.bs.modal', function (event) {
                                                            var button = $(event.relatedTarget); // Button that triggered the modal
                                                            var curCode = button.data('curcode'); // Extract value from data-* attributes
                                                            var curNameEn = button.data('curnameen');
                                                            var curNameVi = button.data('curnamevi');
                                                            var description = button.data('description');
                                                            var id = button.data('id');
                                                            console.log(id);
                                                            console.log(curCode);
                                                            // Set the selected value of the "statusRadio" radio buttons based on the "data-status" attribute
                                                            $('#updateId').attr('value', id);
                                                            $('#updateCode').attr('value', curCode);
                                                            $('#updateCode2').attr('value', curCode);
                                                            $('#updateNameEn').attr('value', curNameEn);
                                                            $('#updateNameVi').attr('value', curNameVi);
                                                            $('#updateDescription').attr('value', description);
                                                            $('#updateDescription').val(description);
                                                            $('#updateNameEn').val(curNameEn);
                                                            $('#updateNameVi').val(curNameVi);
                                                        });
                                                        function search() {
                                                            const searchValue = document.getElementById("textSearch").value;
                                                            if (searchValue === '') {
                                                                window.location.href = `curriculumList`;
                                                            } else
                                                                window.location.href = `curriculumList?search=` + searchValue;
                                                        }
                                                        function onPage(pageNo, search) {
                                                            if (search === '') {
                                                                window.location.href = `curriculumList?pageNo=` + pageNo;
                                                            } else {
                                                                window.location.href = `curriculumList?pageNo=` + pageNo + `&search=` + search;
                                                            }
                                                        }
                                                                </script>
                                                                </body>

                                                                </html>