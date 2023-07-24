<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../common/taglib.jsp"%>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">
<html>
<head>
    <meta charset="UTF-8">
    <title>List</title>
    <%@include file="../common/resource.jsp"%>
</head>
<body>
<%@include file="../common/sidebar.jsp"%>
<%@include file="../common/formUpdate.jsp"%>
<div class="content">
    <div class="relative shadow-md z-10">
        <div class="max-w-[1500px] mx-[auto] my-[0] flex items-center justify-between py-[10px]">
            <div class="content-heading-title">
                <h3 class="font-bold text-md">Danh sách nhân viên | <span class="text-orange-400">Số TK: ${count}</span></h3>
            </div>
            <div class="content-heading-breadcrumb">
                <form method="get" action="/users" class="searchForm flex items-center m-[0] py-[4px] border-b">
                    <input class="outline-0" type="text" placeholder="Search by..." name="searchString" />
                    <button type="submit"><i class="fa-solid fa-magnifying-glass text-black p-[10px]"></i></button>
                </form>
            </div>
        </div>
    </div>
    <div class="flex flex-row items-center gap-[32px] max-w-[1500px] mx-[auto] my-[16px]">
        <div>
            <select name="role" class="border py-[4px] pl-[8px] w-[232px]">
                <option>-- Chức vụ --</option>
                <option value="1">Trưởng nhóm</option>
                <option value="2">Thành viên</option>
            </select>
        </div>
        <div>
            <select class="border py-[4px] pl-[8px] w-[232px]">
                <option>-- Chọn trưởng nhóm --</option>
                <option value="true">Trưởng nhóm</option>
                <option value="false">Thành viên</option>
            </select>
        </div>
        <div>
            <select name="accessData" class="border py-[4px] pl-[8px] w-[232px]">
                <option>-- Chọn TT nhận dữ liệu --</option>
                <option value="true">Cho phép</option>
                <option value="false">Không cho phép</option>
            </select>
        </div>
        <div>
            <select name="isActive" class="border py-[4px] pl-[8px] w-[232px]">
                <option>-- Chọn TT sử dụng --</option>
                <option value="true">Đang sử dụng</option>
                <option value="false">Không sử dụng</option>
            </select>
        </div>
    </div>
    <div class="flex flex-row items-center gap-[32px] max-w-[1500px] mx-[auto] my-[16px]">
        <button class="rounded text-white bg-[#468cca] border px-[12px] py-[4px]" id="addBtn"><i class="fa-solid fa-plus"></i> Thêm tài khoản</button>
        <button class="rounded bg-gray-50 border px-[12px] py-[4px]"><i class="fa-solid fa-gears"></i> Thêm nhiều tài khoản</button>
        <button class="rounded bg-gray-50 border px-[12px] py-[4px]"><i class="fa-solid fa-gears"></i> Cập nhật dữ liệu</button>
        <button class="rounded bg-gray-50 border px-[12px] py-[4px]"><i class="fa-regular fa-file-excel"></i> Xuất excel</button>
    </div>
    <table class="m-[20px] mt-[0] w-[97%] border">
        <tr class="text-left pl-[20px] h-[40px] border-b text-white">
            <th class="text-center font-semibold pl-[8px]">STT</th>
            <th class="text-center font-semibold">#</th>
            <th class="text-center font-semibold">Họ tên</th>
            <th class="text-center font-semibold">Chức vụ</th>
            <th class="text-center font-semibold">Mã nhân viên</th>
            <th class="text-center font-semibold">Lương cứng</th>
            <th class="text-center font-semibold">Số điện thoại</th>
            <th class="text-center font-semibold">Email</th>
            <th class="text-center font-semibold">Trưởng nhóm</th>
            <th class="text-center font-semibold">Nhận dữ liệu</th>
            <th class="text-center font-semibold">Ca làm việc</th>
            <th class="text-center font-semibold">Đang sử dụng</th>
            <th class="text-center font-semibold">Ngày cập nhật</th>
            <th class="text-center font-semibold">Thao tác</th>
        </tr>
        <c:forEach var="item" items="${users}">
            <tr id="data">
                <input  hidden="hidden" value="${item.id}">
                <td id="id" class="text-center">${item.id}</td>
                <td class="text-center">${item.staffCode}</td>
                <td class="text-center">${item.fullName}</td>
                <td class="text-center">${item.role}</td>
                <td class="text-center">${item.staffCode}</td>
                <td class="text-center">${item.salary}</td>
                <td class="text-center">${item.phone}</td>
                <td class="text-center">${item.email}</td>
                <c:if test="${item.leaderTeam == true}">
                    <td class="text-center"><i class="fa-regular fa-circle-check text-green-500"></i></td>
                </c:if>
                <c:if test="${item.leaderTeam == false}">
                    <td class="text-center"><i class="fa-regular fa-circle-xmark text-red-500"></i></td>
                </c:if>
                <c:if test="${item.accessData == true}">
                    <td class="text-center"><i class="fa-regular fa-circle-check text-green-500"></i></td>
                </c:if>
                <c:if test="${item.accessData == false}">
                    <td class="text-center"><i class="fa-regular fa-circle-xmark text-red-500"></i></td>
                </c:if>
                <td class="text-center">${item.shift}</td>
                <td class="text-center"><i class="fa-regular fa-circle-check text-green-500"></i></td>
                <td id="test" class="text-center">${item.updatedAt}</td>
                <td class="text-center">
                    <ul class="flex gap-[12px] items-center">
                        <li class="py-[8px]"><button class="hover:text-[#27a9e3]"><a href="/user?id=${item.id}"><i class="fa-solid fa-circle-info"></i></a></button></li>
                        <li class="py-[8px]"><button onclick="postData(${item.id}, ${item.staffCode}, ${item.fullName}, ${item.role}, ${item.salary}, ${item.phone}, ${item.email}, ${item.leaderTeam}, ${item.accessData}, ${item.shift}, ${item.updatedAt})" class="hover:text-[#27a9e3] addAccount"><i class="fa-solid fa-pen-to-square"></i></button></li>
                        <li class="py-[8px]">
                            <button onsubmit="return confirm('Are you sure to delete this employee?')">
                                <a class="hover:text-[#27a9e3]" href="/users/delete?id=${item.id}"><i class="fa-solid fa-trash-can"></i></a>
                            </button>
                        </li>
                    </ul>
                </td>
            </tr>
        </c:forEach>
    </table>
</div>
</div>
<script>

    function postData(staffCode,fullName, role, salary, phone, email, leaderTeam, accessData, shift, updatedAt){
        var staffCode = document.getElementById("staffCode");
        var username = document.getElementById("username");
        var password = document.getElementById("password");
        var fullName = document.getElementById("fullName");
        var role = document.getElementById("role");
        var phone = document.getElementById("phone");
        var email = document.getElementById("email");
        var shift = document.getElementById("shift");
        var leaderTeam = document.getElementById("leaderTeam");
        var accessData = document.getElementById("accessData");

        staffCode.innerHTML = staffCode;
    }


        var overlay = document.getElementById("overlay");
        var visibleForm = document.getElementById("formCreate");
        var addBtn = document.getElementById("addBtn");
        var buttonAdd = document.querySelectorAll(".addAccount");
        var exitBtn = document.getElementById("exitBtn");
        var title = document.getElementById("title");

        function toggle(){
            overlay.classList.toggle("visibleOverlay");
            visibleForm.classList.toggle("visibleForm");
        }

        buttonAdd.forEach((btn) => {
            btn.onclick = function(){
                title.innerHTML = "Cập nhật tài khoản";
                toggle();
            }
        })

        addBtn.onclick = function (){
            title.innerHTML = "Tạo mới tài khoản";
            toggle();
        }


        overlay.onclick = function(){
            toggle();
        };

        exitBtn.onclick = function(){
            toggle();
        };
</script>
</body>
</html>





