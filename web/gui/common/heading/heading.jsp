
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!--Header-->
<div class="position-relative nav-bar">
    <div class="position-relative" style="z-index: 9;">
        <nav class="bg-white shadow navbar navbar-expand-lg navbar-collapse p-lg-0">
            <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse">
                <span class="navbar-toggler-icon"></span>
            </button>
            <a href="home" class="mx-5 navbar-brand"
               style="width:100px; height: 100%; overflow: hidden;">
                <img style="width: 100%; height: 100%;" src="./fe/img/Logo_Đại_học_FPT.png" alt="">
            </a>
            <div class="collapse navbar-collapse d-flex justify-content-center" id="navbarCollapse">

                <div class="navbar-nav">
                    <a href="search?type=curriculum&keysearch=&filter=curCode" class="nav-item nav-link" id="curriculum" onclick="activeNav()">Curriculum</a>
                    <c:if test="${account != null && role.rid != 1}">
                        <a href="search?type=syllabus&keysearch=&filter=subjectcode" class="nav-item nav-link" id="syllabus" onclick="activeNav()">Syllabus</a>
                    </c:if>
                    <a href="search?type=preRequisite&keysearch=&filter=subjectName" class="nav-item nav-link" id="preRequisite" onclick="activeNav()">Subject Predecessors</a>
                    <a href="search?type=corollary&keysearch=&filter=subjectcode" class="nav-item nav-link" id="corollary" onclick="activeNav()">Subject Successors</a>
                    <c:if test="${account != null}">
                        <div class="dropdown ml-2" style="display: flex; align-items: center;">
                            <a
                                class="dropdown-toggle d-flex hidden-arrow"
                                href="#"
                                id="navbarDropdownMenuAvatar"
                                data-mdb-toggle="dropdown"
                                aria-expanded="false"
                                style="color: inherit;"
                                >
                                Dashboard
                            </a>
                            <ul
                                class="dropdown-menu dropdown-menu-end"
                                aria-labelledby="navbarDropdownMenuAvatar" style="margin-top: 1rem;width: 17rem;"
                                >


                                <c:forEach var="role" items="${account.roles}">
                                    <c:if test="${role.rid == 6}">
                                        <li style="display: block;width: 100%; margin-bottom: 0.5rem;">
                                            <a class="dropdown-item" href="admin-alluser" style="font-size: 15px;"><span style="font-weight: bolder;color: black;">User Management</span></a>
                                        </li>
                                        <li style="display: block;width: 100%; margin-bottom: 0.5rem;">
                                            <a class="dropdown-item" href="admin-settings" style="font-size: 15px;"><span style="font-weight: bolder;color: black;">System Settings</span></a>
                                        </li>
                                        <li style="display: block;width: 100%; margin-bottom: 0.5rem;">
                                            <a class="dropdown-item" href="#" style="font-size: 15px;"><span style="font-weight: bolder;color: black;">Role Permission</span></a>
                                        </li>
                                        <li style="display: block;width: 100%; margin-bottom: 0.5rem;">
                                            <a class="dropdown-item" href="#" style="font-size: 15px;"><span style="font-weight: bolder;color: black;">Decision Management</span></a>
                                        </li>
                                    </c:if>
                                </c:forEach>
                                <c:if test="${(role.rid == 4) || (role.rid == 5) || (role.rid == 7)}">
                                    <li style="display: block;width: 100%; margin-bottom: 0.5rem;">
                                        <a class="dropdown-item" href="curriculumList" style="font-size: 15px;"><span style="font-weight: bolder;color: black;">Curriculum Management</span></a>
                                    </li>
                                </c:if>
                            </ul>
                        </div>
                    </c:if>
                </div>
            </div>

            <div class="navbar-nav" style="margin-right: 3rem;">
                <c:if test="${account != null}">
                    <div class="dropdown" style="display: flex; align-items: center; margin-left: 2rem;">
                        <a
                            class="dropdown-toggle d-flex align-items-center hidden-arrow"
                            href="#"
                            id="navbarDropdownMenuAvatar"
                            role="button"
                            data-mdb-toggle="dropdown"
                            aria-expanded="false"
                            style ="background-color: #f26838;border-radius: 50%;width: 50px;height: 50px;"
                            >
                            <c:if test="${account.avatar != ''}">
                                <img
                                    src="${account.avatar}"
                                    class="rounded-circle"
                                    height="25"
                                    loading="lazy" style="width: 50px;height: 50px; margin-right: 5px;"
                                    />
                            </c:if>
                            <c:if test="${account.avatar == ''}">
                                <p style="font-size: 2rem;color: #fff;margin: auto;">${account.displayName.charAt(0)}</p>
                            </c:if>

                        </a>

                        <ul
                            class="dropdown-menu dropdown-menu-end"
                            aria-labelledby="navbarDropdownMenuAvatar" style="margin-top: 1rem;width: 17rem;"
                            >
                            <li style="display: block;width: 100%; margin-bottom: 0.5rem;">
                                <a class="dropdown-item" href="#" style="font-size: 15px;"><span style="font-weight: bolder;color: black;">User Profile</span></a>
                                <a class="dropdown-item" href="#" style="font-size: 15px;"><span style="font-weight: bolder;color: black;">Change Password</span></a>
                            <li style="display: block;width: 100%; margin-bottom: 0.5rem;">
                                <a class="dropdown-item" href="logout" style="font-size: 15px; color: #0388f9;">Sign out FLM</a>
                            </li>
                        </ul>
                    </div>
                </c:if>
                <c:if test="${account == null}">
                        <a href="login" class="nav-item nav-link" id="syllabus" onclick="activeNav()">Login</a>
                        <a href="register" class="nav-item nav-link" id="syllabus" onclick="activeNav()">Register</a>
                    </c:if>
            </div>
        </nav>
    </div>
</div>


<script>

    function activeNav() {
        let type = new URLSearchParams(window.location.search).get('type');
        console.log("type", type);
        if (type === 'curriculum') {
            document.getElementById("curriculum").classList.add("active");
        } else if (type === 'syllabus') {
            document.getElementById("syllabus").classList.add("active");
        } else if (type === 'preRequisite') {
            document.getElementById("preRequisite").classList.add("active");
        } else if (type === 'corollary') {
            document.getElementById("corollary").classList.add("active");
        }

        // Thay đổi đường dẫn URL
        let url = new URL(window.location.href);
        url.searchParams.set('type', type);
        window.history.pushState({path: url.href}, '', url.href);
    }

    // Gọi hàm activeNav() khi tải trang
    activeNav();

    // Gọi hàm activeNav() khi click vào nav item
    let navItems = document.querySelectorAll('ul li a');
    navItems.forEach(navItem => {
        navItem.addEventListener('click', function (event) {
            event.preventDefault();
            let href = navItem.getAttribute('href');
            window.location.href = href;
            activeNav();
        });
    });

    let signUpBtn = document.getElementById("signUpBtn");
    if (signUpBtn) {
        signUpBtn.addEventListener("click", function () {
            document.getElementById('email').value = '';
            document.getElementById('userName').value = '';
            document.getElementById('fullName').value = '';
            document.getElementById('password').value = '';
            document.getElementById('comfirm-password').value = '';
            document.getElementById('verifyCode').value = '';
            document.getElementById("errorMessage").innerHTML = '';
            document.getElementById("messageRegister").innerHTML = '';
        });
    }

</script>
