<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
    <%@page contentType="text/html" pageEncoding="UTF-8" %>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>Create User</title>
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

                <!-- Latest compiled JavaScript -->
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
                <link href="/css/styles.css" rel="stylesheet" />
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

                <script>
                    // Khi file duoc load vao, lay id cua input => tao ra 1 url tu file => chen css de hien ra anh
                    $(document).ready(() => {
                        const avatarFile = $("#avatarFile");
                        avatarFile.change(function (e) {
                            const imgURL = URL.createObjectURL(e.target.files[0]);
                            $("#avatarPreview").attr("src", imgURL);
                            $("#avatarPreview").css({ "display": "block" });
                        });
                    });
                </script>

            </head>

            <body class="sb-nav-fixed">
                <jsp:include page="../layout/header.jsp" />
                <div id="layoutSidenav">
                    <jsp:include page="../layout/sidebar.jsp" />
                    <div id="layoutSidenav_content">
                        <main>
                            <div class="container-fluid px-4">
                                <h1 class="mt-4">Manage user</h1>
                                <ol class="breadcrumb mb-4">
                                    <a href="/admin/user" class="breadcrumb-item">Dashboard</a>
                                    <li class="breadcrumb-item active">Create</li>
                                </ol>
                                <div class="mt-3">
                                    <div class="row">
                                        <div class="col-12 mx-auto">
                                            <div class="mt-5">
                                                <div class="row">
                                                    <div class="col-md-6 col-12 mx-auto">
                                                        <h3>Create a user</h3>
                                                        <hr />
                                                        <form:form method="post" action="/admin/user/create"
                                                            modelAttribute="newUser" class="row"
                                                            enctype="multipart/form-data">
                                                            <div class="mb-3 col-12 col-md-6">
                                                                <label class="form-label">Email </label>
                                                                <form:input type="email" class="form-control"
                                                                    path="email" />
                                                            </div>
                                                            <div class="mb-3 col-12 col-md-6">
                                                                <label class="form-label">Password</label>
                                                                <form:input type="password" class="form-control"
                                                                    path="password" />
                                                            </div>
                                                            <div class="mb-3 col-12 col-md-6">
                                                                <label class="form-label">Phone Number</label>
                                                                <form:input type="text" class="form-control"
                                                                    path="phone" />
                                                            </div>
                                                            <div class="mb-3 col-12 col-md-6">
                                                                <label class="form-label">Full Name</label>
                                                                <form:input type="text" class="form-control"
                                                                    path="fullName" />
                                                            </div>
                                                            <div class="mb-5 col-12">
                                                                <label class="form-label">Address</label>
                                                                <form:input type="text" class="form-control"
                                                                    path="address" />
                                                            </div>
                                                            <div class="mb-3 col-12 col-md-6">
                                                                <label class="form-label">Role:</label>
                                                                <form:select class="form-select" path="role.name">
                                                                    <option value="ADMIN">Admin</option>
                                                                    <option value="USER">User</option>
                                                                </form:select>
                                                            </div>
                                                            <div class="mb-3 col-12 col-md-6">
                                                                <label for="avatarFile"
                                                                    class="form-label">Avatar:</label>
                                                                <input class="form-control" type="file" id="avatarFile"
                                                                    accept=".png, .jpg,. jpeg" name="imageFile" />
                                                            </div>
                                                            <div class="col-12 mb-3">
                                                                <img style="max-height: 250px; display: none;"
                                                                    alt="avatar preview" id="avatarPreview">
                                                            </div>
                                                            <div class="col-12 mb-5">
                                                                <button type="submit" class="btn btn-primary">Submit
                                                                </button>
                                                            </div>
                                                        </form:form>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </main>
                        <jsp:include page="../layout/footer.jsp" />
                    </div>
                </div>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
                    crossorigin="anonymous"></script>
                <script src="js/scripts.js"></script>
            </body>

            </html>