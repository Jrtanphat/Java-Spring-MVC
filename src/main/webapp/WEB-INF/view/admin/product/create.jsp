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
                                <h1 class="mt-4">Manage Product</h1>
                                <ol class="breadcrumb mb-4">
                                    <a href="/admin/product" class="breadcrumb-item">Dashboard</a>
                                    <li class="breadcrumb-item active">Create</li>
                                </ol>
                                <div class="mt-3">
                                    <div class="row">
                                        <div class="col-12 mx-auto">
                                            <div class="mt-5">
                                                <div class="row">
                                                    <div class="col-md-6 col-12 mx-auto">
                                                        <h3>Create a product</h3>
                                                        <hr />
                                                        <form:form method="post" action="/admin/product/create"
                                                            modelAttribute="newProduct" class="row"
                                                            enctype="multipart/form-data">
                                                            <c:set var="ErrorName">
                                                                <form:errors path="name" cssClass="invalid-feedback" />
                                                            </c:set>
                                                            <c:set var="ErrorPrice">
                                                                <form:errors path="price" cssClass="invalid-feedback" />
                                                            </c:set>
                                                            <c:set var="ErrorDetailDesc">
                                                                <form:errors path="detailDesc"
                                                                    cssClass="invalid-feedback" />
                                                            </c:set>
                                                            <c:set var="ErrorShortDesc">
                                                                <form:errors path="shortDesc"
                                                                    cssClass="invalid-feedback" />
                                                            </c:set>
                                                            <c:set var="ErrorQuantity">
                                                                <form:errors path="quantity"
                                                                    cssClass="invalid-feedback" />
                                                            </c:set>
                                                            <div class="mb-3 col-12 col-md-6">
                                                                <label class="form-label">Name</label>
                                                                <form:input type="text"
                                                                    class="form-control  ${not empty ErrorName ? 'is-invalid' : ''}"
                                                                    path="name" />
                                                                ${ErrorName}
                                                            </div>
                                                            <div class="mb-3 col-12 col-md-6">
                                                                <label class="form-label">Price</label>
                                                                <form:input type="number"
                                                                    class="form-control  ${not empty ErrorPrice ? 'is-invalid' : ''}"
                                                                    path="price" />
                                                                ${ErrorPrice}
                                                            </div>
                                                            <div class="mb-3 col-12">
                                                                <label class="form-label">Detail Description</label>
                                                                <form:input type="text"
                                                                    class="form-control  ${not empty ErrorDetailDesc ? 'is-invalid' : ''}"
                                                                    path="detailDesc" />
                                                                ${ErrorDetailDesc}
                                                            </div>
                                                            <div class="mb-3 col-12 col-md-6">
                                                                <label class="form-label">Short Description</label>
                                                                <form:input type="text"
                                                                    class="form-control  ${not empty ErrorShortDesc ? 'is-invalid' : ''}"
                                                                    path="shortDesc" />
                                                                ${ErrorShortDesc}
                                                            </div>
                                                            <div class="mb-5 col-12 col-md-6">
                                                                <label class="form-label">Quantity</label>
                                                                <form:input type="text"
                                                                    class="form-control  ${not empty ErrorQuantity ? 'is-invalid' : ''}"
                                                                    path="quantity" />
                                                                ${ErrorQuantity}
                                                            </div>
                                                            <div class="mb-3 col-12 col-md-6">
                                                                <label class="form-label">Factory:</label>
                                                                <form:select class="form-select" path="factory">
                                                                    <form:option value="Apple">Apple(Macbook)
                                                                    </form:option>
                                                                    <form:option value="Asus">Asus</form:option>
                                                                    <form:option value="Lenovo">Lenovo</form:option>
                                                                    <form:option value="Dell">Dell</form:option>
                                                                    <form:option value="LG">LG</form:option>
                                                                    <form:option value="Acer">Acer</form:option>
                                                                </form:select>
                                                            </div>
                                                            <div class="mb-3 col-12 col-md-6">
                                                                <label class="form-label">Target:</l abel>
                                                                    <form:select class="form-select" path="target">
                                                                        <form:option value="GAMING">Gaming</form:option>
                                                                        <form:option value="SINHVIEN-VANPHONG">Sinh viên
                                                                            -
                                                                            Văn
                                                                            phòng</form:option>
                                                                        <form:option value="THIET-KE-DO-HOA">Thiết kế đò
                                                                            họa
                                                                        </form:option>
                                                                        <form:option value="MONG-NHE">Mỏng nhẹ
                                                                        </form:option>
                                                                        <form:option value="DOANH-NHAN">Doanh nhân
                                                                        </form:option>
                                                                    </form:select>
                                                            </div>
                                                            <div class="mb-3 col-12 col-md-6">
                                                                <label for="avatarFile"
                                                                    class="form-label">Image:</label>
                                                                <input class="form-control" type="file" id="avatarFile"
                                                                    accept=".png, .jpg,. jpeg" name="imageFile" />
                                                            </div>
                                                            <div class="col-12 mb-3">
                                                                <img style="max-height: 250px; display: none;"
                                                                    alt="avatar preview" id="avatarPreview">
                                                            </div>
                                                            <div class="col-12 mb-5">
                                                                <button type="submit" class="btn btn-primary">Create
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