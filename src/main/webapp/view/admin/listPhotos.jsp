<%-- 
    Document   : listComments
    Created on : Jul 11, 2020, 5:24:23 PM
    Author     : TASS
--%>

<%@include  file="/common/taglib.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8" language="java" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>

        <div class="card-header py-3">
            <c:if test="${not empty message}">
                <div class="alert alert-${alert}">
                    <p class="text-center" style="margin-bottom: 0px;">
                        <strong>${message}</strong>
                    </p>
                </div>
            </c:if>
            <c:if test="${not empty messageResponse}">
                <div class="alert alert-${alert}">
                    ${messageResponse}
                </div>
            </c:if>
            <h3 class="text-dark mb-4">Photo Management</h3>
            <div class="card shadow">
                <div class="card-header py-3">
                    <div class="row">
                        <div class="col-md-10">
                            <p class="text-primary m-0 font-weight-bold" style="padding-top: 7px;">List of all photos</p>
                        </div>

                        <!-- add + delete article -->

                        <div class="col-md-2">
                            <div class="widget-box table-filter">
                                <div class="table-btn-controllers">
                                    <div class="pull-right tableTools-container">
                                        <div class="dt-buttons btn-overlap btn-group">
                                            <a flag="info" class="dt-button buttons-colvis btn btn-white btn-primary btn-bold" data-toggle="tooltip" title="Add new photo" title="Add photo" href='<c:url value="/admin-photo?type=edit" />'>
                                                <span>
                                                    <i class="fas fa-plus">   </i>
                                                </span>
                                            </a>
                                            <button id="btnDelete" type="button" class="dt-button buttons-html5 btn btn-white btn-primary btn-bold" data-toggle="tooltip" title="Delete photo(s)">
                                                <span>
                                                    <i class="fas fa-trash-alt"></i>
                                                </span>
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>


                    <!-- add + delete article -->
                </div>
                <div class="card-body text-center shadow">

                    <div class="table-responsive table mt-2" id="dataTable" role="grid" aria-describedby="dataTable_info">
                        <table class="table my-0" id="dataTable">
                            <thead>
                                <tr>
                                    <th scope="col">#</th>
                                    <th scope="col"><input type="checkbox" id="checkAll"></th>
                                    <th scope="col">ID</th>
                                    <th scope="col">Link Image</th>

                                    <th scope="col">Title</th>
                                    <th scope="col">Description</th>
                                    <th scope="col">Created By</th>
                                    <th scope="col">Created Date</th>
                                    <th scope="col">Options</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:set var="index" value="1" />
                                <c:forEach var="item" items="${photo.listResult}">
                                    <tr>
                                        <th scope="row">${index}</th>
                                        <th scope="row"><input type="checkbox" id="checkbox_${item.id}" value="${item.id}"></th>
                                        <td>${item.id}</td>
                                        <td>${item.image}</td>
                                        <td>${item.title}</td>
                                        <td>${item.shortDescription}</td>
                                        <td>${item.createdBy}</td>
                                        <td>${item.createdDate}</td>

                                        <td>
                                            <c:url var="editURL" value="/admin-photo">
                                                <c:param name="type" value="edit" />
                                                <c:param name="id" value="${item.id}" />
                                            </c:url>
                                            <a class="btn btn-sm btn-primary btn-edit" data-toggle="tooltip" title="Edit photo" href="${editURL}">
                                                <i class="fa fa-edit" aria-hidden="true"></i>
                                            </a>
                                        </td>
                                    </tr>
                                    <c:set var="index" value="${index+1}" />
                                </c:forEach>
                            </tbody>
                            <tfoot>
                                <tr>
                                    <th scope="col">#</th>
                                    <th scope="col"><input type="checkbox" id="checkAll"></th>
                                    <th scope="col">ID</th>
                                    <th scope="col">Link Image</th>

                                    <th scope="col">Title</th>
                                    <th scope="col">Description</th>
                                    <th scope="col">Created By</th>
                                    <th scope="col">Created Date</th>
                                    <th scope="col">Options</th>
                                </tr>
                            </tfoot>
                        </table>

                    </div>
                </div>
                <!--            <div class="row">
                                <div class="col-md-6 align-self-center">
                                    <p id="dataTable_info" class="dataTables_info" role="status" aria-live="polite">Showing ${(model.page-1)*5+1} to ${(model.page-1)*5+index-1} of ${model.totalItems}</p>
                                </div>
                                <div class="col-md-6">
                                    <form id="formSubmit" name="formSubmit">
                                        <input type="hidden" value="" id="page" name="page" />
                                        <input type="hidden" value="" id="maxPageItem" name="maxPageItem" />
                                        <input type="hidden" value="" id="sortBy" name="sortBy" />
                                        <input type="hidden" value="" id="sortType" name="sortType" />
                                        <input type="hidden" value="list" id="type" name="type" />
                                        <nav class="d-lg-flex justify-content-lg-end dataTables_paginate paging_simple_numbers">
                                            <ul class="pagination" id="pagination"></ul>
                                        </nav>
                                    </form>
                
                                </div>
                            </div>-->
            </div>
            <script type="text/javascript">
                var totalPages = ${model.totalPages}; //50
                var currentPage = ${model.page}; //1
                var limit = 5; //; 
                $(function () {
                    window.pagObj = $("#pagination")
                            .twbsPagination({
                                totalPages: totalPages,
                                visiblePages: 5,
                                startPage: currentPage,
                                onPageClick: function (event, page) {
                                    if (currentPage != page) {
                                        //console.info(page + " (from options)");
                                        $("#maxPageItem").val(limit);
                                        $("#page").val(page);
                                        $("#sortBy").val('id');
                                        $("#sortType").val('desc');
                                        $("#type").val('list');
                                        $("#formSubmit").submit();
                                    }
                                },
                            })
                            .on("page", function (event, page) {
                                console.info(page + " (from event listening)");
                            });
                });
                $("#checkAll").click(function () {
                    $('input:checkbox').not(this).prop('checked', this.checked);
                });
            </script>
    </body>
</html>
