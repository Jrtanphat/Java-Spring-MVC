<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
    <%@page contentType="text/html" pageEncoding="UTF-8" %>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>Product Detail ${id}</title>
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

                <!-- Latest compiled JavaScript -->
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
                <link href="/css/styles.css" rel="stylesheet" />
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
                                    <li class="breadcrumb-item active">User Details</li>
                                </ol>
                                <div class="container mt-5">
                                    <div class="row">
                                        <div class="col-12 mx-auto">
                                            <div class="d-flex justify-content-between">
                                                <h3>Product Detail with id = ${id}</h3>
                                            </div>
                                            <hr />
                                            <div class="card" style="width: 60%;">
                                                <img src="/images/product/${product.image}" alt="" class="card-img-top">
                                                <div class="card-header">
                                                    Product Information
                                                </div>
                                                <ul class="list-group list-group-flush">
                                                    <li class="list-group-item">Name: ${product.name}</li>
                                                    <li class="list-group-item">Price: ${product.price}</li>
                                                    <li class="list-group-item">Detail Description:
                                                        ${product.detailDesc}</li>
                                                    <li class="list-group-item">Short Description: ${product.shortDesc}
                                                    </li>
                                                    <li class="list-group-item">Factory: ${product.factory}</li>
                                                    <li class="list-group-item">Target: ${product.target}</li>
                                                </ul>
                                            </div>
                                            <a href="/admin/product" class="btn btn-success mt-3">Back</a>
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