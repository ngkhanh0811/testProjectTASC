<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div id="overlay"></div>
<div id="formCreate" class="flex justify-center">
    <div class="absolute top-[30px]  bg-white z-[100] w-[500px] h-[600px]">
        <div class="flex justify-between border-b font-bold py-[12px] pl-[12px]">
            <p id="title">Cập nhật tài khoản</p>
            <i id="exitBtn" class="fa-solid fa-xmark mt-[6px] mr-[12px] cursor-pointer"></i>
        </div>
        <form method="post" action="users/create">
            <input name="id" hidden="hidden">
            <div class="flex flex-col">
                <div class="flex my-[12px]">
                    <label class="w-[160px] ml-[12px] font-semibold text-sm">Chức vụ</label>
                    <select name="role" class="border w-[300px]">
                        <option>--Chức vụ</option>
                        <option value="1">Trưởng nhóm</option>
                        <option value="2">Nhân viên</option>
                    </select>
                </div>
                <div class="flex mb-[12px]">
                    <label class="w-[160px] ml-[12px] font-semibold text-sm">Tài khoản<span>(*)</span>:</label>
                    <input id="username" name="username" class="border w-[300px]" type="text" >
                </div>
                <div class="flex mb-[12px]">
                    <label class="w-[160px] ml-[12px] font-semibold text-sm">Mật khẩu: </label>
                    <input id="password" name="password" class="border w-[300px]" type="text" >
                </div>
                <div class="flex mb-[12px]">
                    <label class="w-[160px] ml-[12px] font-semibold text-sm">Số ĐT: </label>
                    <input id="phone" name="phone" class="border w-[300px]" type="text" >
                </div>
                <div class="flex mb-[12px]">
                    <label class="w-[160px] ml-[12px] font-semibold text-sm">Họ và tên: </label>
                    <input id="fullName" name="fullName" class="border w-[300px]" type="text" >
                </div>
                <div class="flex mb-[12px]">
                    <label class="w-[160px] ml-[12px] font-semibold text-sm">Mã nhân viên: </label>
                    <input id="staffCode" name="staffCode" class="border w-[300px]" type="text" >
                </div>
                <div class="flex mb-[12px]">
                    <label class="w-[160px] ml-[12px] font-semibold text-sm">Email: </label>
                    <input id="email" name="email" class="border w-[300px]" type="text" >
                </div>
                <div class="flex mb-[12px]">
                    <label class="w-[160px] ml-[12px] font-semibold text-sm">Lương cứng: </label>
                    <input id="salary" name="salary" class="border w-[300px]" type="text" >
                </div>
                <div class="flex mb-[12px]">
                    <label class="w-[160px] ml-[12px] font-semibold text-sm">Ca làm việc: </label>
                    <div class="flex items-center gap-[24px]">
                        <div>
                            <input name="shift" value="1" class="border w-[16px]" type="checkbox">
                            <label>Ca 1</label>
                        </div>
                        <div>
                            <input name="shift" value="2" class="border w-[16px]" type="checkbox">
                            <label>Ca 2</label>
                        </div>
                        <div>
                            <input name="shift" value="3" class="border w-[16px]" type="checkbox">

                            <label>Ca 3</label>
                        </div>
                    </div>
                </div>
                <input hidden="hidden" type="datetime-local">
                <div class="flex mb-[12px]">
                    <label class="w-[160px] ml-[12px] font-semibold text-sm"></label>
                    <input id="leaderTeam" name="leaderTeam" class="border mr-[6px] w-[14px]" type="checkbox">

                    <label>Trưởng nhóm</label>
                </div>
                <div class="flex mb-[12px]">
                    <label class="w-[160px] ml-[12px] font-semibold text-sm"></label>
                    <input id="accessData" name="accessData" class="border mr-[6px] w-[14px]" type="checkbox" >
                    <label>Nhận dữ liệu</label>
                </div>
                <div class="flex mb-[12px]">
                    <label class="w-[160px] ml-[12px] font-semibold text-sm"></label>
                    <button class="rounded text-white bg-[#468cca] border py-[4px] px-[12px]" type="submit"><i class="fa-regular fa-file-lines mr-[8px]"></i>Cập nhật</button>
                </div>
            </div>
        </form>
    </div>
</div>


