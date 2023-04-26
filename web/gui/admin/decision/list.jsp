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
            <title>Settings</title>

    </head>

    <body>
                <% if (request.getParameter("message") != null) { %>
        <script>
            alert("<%= request.getParameter("message") %>");
        </script>
        <% } %>
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
                                        <li class="breadcrumb-item active"><a href="#">Decision</a></li>
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
                                        <div class="input-group" style="position: relative;width: 30%;margin-left: 25px;margin-bottom: 15px;float: left">
                                            <select class="form-control js-basic-example2" id="filterStatus" style="margin-left:-2%;background: #cfcfcf;border-radius: 20px;padding: 10px 20px;" onchange="filter()">
                                                <option value="3">All</option>
                                                <option value="0" ${filterStatus == 0? 'selected' : ''}>Not Approved</option>
                                                <option value="1" ${filterStatus == 1? 'selected' : ''}>Approved</option>
                                            </select>
                                            <div class="input-group-append" style="position: absolute;right: 0;z-index: 10;">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-12 col-md-6">
                                        <div class="input-group" style="position: relative;width: 75%;margin-left: auto;margin-bottom: 15px;">
                                            <input class="form-control" id="textSearch" value="${search eq ''? '' : search}" type="text" placeholder="Search for result" style="margin-left:-2%;background: #cfcfcf;border-radius: 20px;padding: 10px 20px;" onkeyup="if (event.keyCode === 13)
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
                                    <h2 class="p-1 m-0 text-16 font-weight-semi " style="color: white">Decisions</h2>
                                    <div style="color: white" class="p-1 m-0 text-16">
                                        <i class="fa fa-plus" onclick="openAddForm()" style="cursor: pointer"></i>
                                    </div>
                                </div>
                                <div class="card">
                                    <div class="card-body table-responsive">
                                        <table id="example" style="text-align: center" class="table">
                                            <tbody>
                                                <tr>
                                                    <th class="sort-handler cursor-pointer" style="width: 5%">No</th>
                                                    <th class="sort-handler cursor-pointer" style="width:10%">Decision No</th>
                                                    <th class="sort-handler cursor-pointer" style="width:20%">Decision Name</th>
                                                    <th class="sort-handler cursor-pointer" style="width:30%">Note</th>
                                                    <th class="sort-handler cursor-pointer" style="width:10%">Approve Date</th>

                                                    <th style="width:5%">Status</th>
                                                    <th style="width:10%"></th>
                                                </tr>
                                                <c:forEach items="${list}" var="item" varStatus="noIndex">
                                                    <tr>
                                                        <td>${noIndex.index + (pagination.pageNo - 1) * pagination.pageSize + 1}</td>
                                                        <td>
                                                            ${item.decisionNo}
                                                        </td>
                                                        <td>${item.decisionName}</td>
                                                        <td>${item.note}</td>
                                                        <td>
                                                            <fmt:formatDate pattern="dd/MM/yyyy" value="${item.approvedDate}" />                                                           
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
                                                            <button
                                                                onclick="handleEdit('${item.decisionNo}')"
                                                                class="btn text-primary rounded-circle m-0 btn-sm btn-icon"
                                                                style="height: 0px !important;"><i
                                                                    class="material-icons">edit</i>
                                                            </button>
                                                            <button class="btn text-danger rounded-circle m-0 btn-sm btn-icon" style="height: 0px !important;" onclick="handleDelete('${item.decisionNo}')" ><i class="material-icons">delete</i></button>

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
                                                    <button class="page-link" ><i class="material-icons " onclick="onPage(1,${pagination.pageSize}, '${search}', '${filterStatus}')">keyboard_double_arrow_left</i>
                                                    </c:if>
                                            </li>
                                            <li class="page-item">
                                                <c:if test="${pagination.pageNo > 1}">
                                                    <button class="page-link" ><i class="material-icons " onclick="onPage(${pagination.pageNo - 1},${pagination.pageSize}, '${search}', '${filterStatus}')">keyboard_arrow_left</i>
                                                    </c:if>
                                            </li>
                                            <c:forEach var="page" begin="1" end="${totalPages}">
                                                <li aria-current="page" class="page-item ${pagination.pageNo == page? 'active' :''}">
                                                    <c:choose>
                                                        <c:when test="${page == pagination.pageNo}">
                                                            <button class="page-link page-number">${page}</button>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <button class="page-link page-number" onclick="onPage(${page},${pagination.pageSize}, '${search}', '${filterStatus}')">${page}</button>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </li>
                                            </c:forEach>
                                            <li class="page-item">
                                                <c:if test="${not empty list && pagination.pageNo != totalPages}">
                                                    <button class="page-link" onclick="onPage(${pagination.pageNo+1},${pagination.pageSize}, '${search}', '${filterStatus}')"><i class="material-icons">keyboard_arrow_right</i>
                                                    </button>
                                                </c:if>
                                            </li>
                                            <li class="page-item">
                                                <c:if test="${not empty list && pagination.pageNo != totalPages}">
                                                    <button class="page-link" onclick="onPage(${totalPages},${pagination.pageSize}, '${search}', '${filterStatus}')"><i class="material-icons">keyboard_double_arrow_right</i>
                                                    </c:if>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
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
                                                        $(document).ready(function () {
                                                            $(".js-basic-example2").select2({
                                                                theme: "classic"
                                                            });
                                                        });
                                                        function onPage(pageNo, pageSize, search, filterStatus) {
                                                            if (search === '') {
                                                                window.location.href = `admin-decisions?pageNo=` + pageNo + `&filterStatus=` + filterStatus;
                                                            } else {
                                                                window.location.href = `admin-decisions?pageNo=` + pageNo + `&filterStatus=` + filterStatus + `&search=` + search;
                                                            }
                                                        }
                                                        function filter() {
                                                            const searchValue = "${search}";
                                                            const filterStatus = document.getElementById("filterStatus").value;
                                                            if (searchValue === '') {
                                                                if (filterStatus !== 3) {
                                                                    window.location.href = `admin-decisions?pageNo=1&filterStatus=` + filterStatus;
                                                                }
                                                            } else {
                                                                if (filterStatus !== 3) {
                                                                    window.location.href = `admin-decisions?pageNo=1&filterStatus=` + filterStatus + '&search=' + searchValue;
                                                                }
                                                            }
                                                        }
                                                        function search() {
                                                            const filterStatus = "${filterStatus}";
                                                            const searchValue = document.getElementById("textSearch").value;
                                                            if (searchValue === '') {
                                                                window.location.href = `admin-decisions?&filterStatus=` + filterStatus;
                                                            } else
                                                                window.location.href = `admin-decisions?filterStatus=` + filterStatus + `&search=` + searchValue;
                                                        }
                                                        function openAddForm() {
                                                            window.location.href = `decision-add`;
                                                        }
                                                        function handleEdit(id) {
                                                            window.location.href = `decision-edit?decisionNo=` + id;
                                                        }
                                                        function handleDelete(id) {
                                                            if (confirm('Are you sure want to delete?')) {
                                                                window.location.href = `decision-delete?decisionNo=` + id;
                                                            }
                                                        }
        </script>
    </body>


</html>