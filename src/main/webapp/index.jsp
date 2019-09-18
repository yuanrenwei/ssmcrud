<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>员工列表</title>
    <meta charset="UTF-8">
    <!--web路径，不以/开始的找资源，是以当前路径为基准的-->
    <!--以/开始的相对路径，找资源，以服务器路径为标准（http://
    localhost:8080/crud ,需要加上项目名http://localhost:8080/crud
    -->
    <script src="${pageContext.request.contextPath}/static/jquery-1.11.1.js" type="text/javascript"></script>
    <link href="${pageContext.request.contextPath}/static/bootstrap_3.3.0/css/bootstrap.min.css" rel="stylesheet"/>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/bootstrap_3.3.0/js/bootstrap.min.js"></script>
</head>
<body>


<!--修改员工的模态框-->
<div class="modal fade" id="empUpdateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">员工修改</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label for="empName_add_input" class="col-sm-2 control-label">empName</label>
                        <div class="col-sm-10">
                         <p class="form-control-static" id="empName_update_static"></p>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="email_add_input" class="col-sm-2 control-label">email</label>
                        <div class="col-sm-10">
                            <input type="text" name="email" class="form-control" id="email_update_input" placeholder="email">
                            <span class="help-block"></span>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label">gender</label>
                        <div class="col-sm-10">

                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender1_update_input" value="M" checked="checked">男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender2_update_input" value="W">女
                            </label>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label">deptName</label>
                        <div class="col-sm-4">
                            <select class="form-control" name="dId">
                            </select>
                        </div>
                    </div>

                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="emp_update_btn">修改</button>
            </div>
        </div>
    </div>
</div>


<!--员工添加的模态框-->
<div class="modal fade" id="empAddModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">添加员工</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label for="empName_add_input" class="col-sm-2 control-label">empName</label>
                        <div class="col-sm-10">
                            <input type="text" name="empName" class="form-control" id="empName_add_input" placeholder="empName">
                            <span class="help-block"></span>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="email_add_input" class="col-sm-2 control-label">email</label>
                        <div class="col-sm-10">
                            <input type="text" name="email" class="form-control" id="email_add_input" placeholder="email">
                            <span class="help-block"></span>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label">gender</label>
                        <div class="col-sm-10">

                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender1_add_input" value="M" checked="checked">男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender2_add_input" value="W">女
                            </label>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label">deptName</label>
                        <div class="col-sm-4">
                            <select class="form-control" name="dId" id="dept_add_select">
                            </select>
                        </div>
                    </div>

                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="emp_save_btn">保存</button>
            </div>
        </div>
    </div>
</div>


<!--搭建显示页面-->
<div class="container">
    <!--标题-->
    <div class="row">
        <h1>SSM-CRUD</h1>
    </div>
    <!--新增、删除的按钮-->
    <div class="row">
        <div class="col-md-4 col-md-offset-8">
            <button  class="btn btn-primary" id="emp_add_modal_btn">新增</button>
            <button class="btn btn-danger" id="emp_delete_all_btn">删除</button>
        </div>
    </div>
    <!--表格-->
    <div class="row">
        <div class="col-md-12">
            <table class="table table-hover tbn-sm" id="emp_table">
                <thead>
                <tr>
                    <th>
                        <input type="checkbox" id="check_all"/>
                    </th>
                    <th>#</th>
                    <th>empName</th>
                    <th>gender</th>
                    <th>email</th>
                    <th>deptName</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>

                </tbody>


            </table>
        </div>
    </div>
    <!--分页显示栏-->
    <div class="row">
        <!--分页信息-->
        <div class="col-md-6" id="page_info_area">
        </div>
        <div class="col-md-6" id="page_nav_area">

        </div>
    </div>
</div>
<script type="text/javascript">
    var totalRecord,currentPage;//总记录数
    //1.页面加载完成以后，直接去发送ajax请求，要到分页数据
    $(function(){
        //去首页
        to_page(1);
    })

    function to_page(pn){
        $.ajax({
            url:"${pageContext.request.contextPath}/emps",
            data:"pn="+pn,
            type:"get",
            success:function(result){
                // console.log(result);
                //1、解析并显示员工数据
                // build_emps_table(result);
                build_emps_table(result);

                //2、解析并显示分页信息
                build_page_info(result);
                //3、解析显示分页条信息
                build_page_nav(result);

            }
        })
    }
    function build_emps_table(result){
        //清空table表格
        $("#emp_table tbody").empty();
        var emps=result.extend.pageInfo.list;
        $.each(emps,function(index,item){
            //alert(item.empName);
            var checkBoxTd=$("<td><input type='checkbox' class='check_item'/></td>");
            var empIdTd=$("<td></td>").append(item.empId);
            var empNameTd=$("<td></td>").append(item.empName);
            var genderTd=$("<td></td>").append(item.gender=='M'?"男":"女");
            var emailTd=$("<td></td>").append(item.email);
            var deptNameTd=$("<td></td>").append(item.department.deptName);
            /**
             *
             * @type {*|jQuery}
             */
            var editBtn=$("<button></button>").addClass("btn btn-primary btn-sm edit_btn" ).append($("<span><span>").addClass("glyphicon glyphicon-pencil")).append("编辑");
            //为编辑按钮添加一个自定义的属性，来表示当前员工的id
            editBtn.attr("edit-id",item.empId);
            var delBtn=$("<button></button>").addClass("btn btn-danger btn-sm delete_btn").append($("<span><span>").addClass("glyphicon glyphicon-trash")).append("删除");
            //为删除按钮添加一个自定义的属性表示当前删除的员工的id
            delBtn.attr("del-id",item.empId);
            var btnTd=$("<td></td>").append(editBtn).append(" ").append(delBtn);
            $("<tr></tr>").append(checkBoxTd).append(empIdTd).append(empNameTd).append(genderTd).append(emailTd).append(deptNameTd).append(btnTd).appendTo("#emp_table tbody");
        });
    }
    //解析显示分页信息
    function build_page_info(result){
        $("#page_info_area").empty();
        $("#page_info_area").append("当前"+result.extend.pageInfo.pageNum+"页,总"+result.extend.pageInfo.pages+"页,总"+result.extend.pageInfo.total+"条记录")
        totalRecord=result.extend.pageInfo.total;
        currentPage=result.extend.pageInfo.pageNum;
    }
    //解析显示分页条的信息
    function build_page_nav(result){
        $("#page_nav_area").empty();
        var ul=$("<ul></ul>").addClass("pagination");
        var firstPageLi=$("<li></li>").append($("<a></a>").append("首页").attr("href","#"));
        var prePageLi=$("<li></li>").append($("<a></a>").append("&laquo;"));
        if(result.extend.pageInfo.hasPreviousPage==false){
            firstPageLi.addClass("disabled");
            prePageLi.addClass("disabled");
        }else{
            firstPageLi.click(function () {
                to_page(1);
            })
            prePageLi.click(function () {
                to_page(result.extend.pageInfo.pageNum-1);
            })
        }

        var nextPageLi=$("<li></li>").append($("<a></a>").append("&raquo;"));
        var lastPageLi=$("<li></li>").append($("<a></a>").append("尾页").attr("href","#"));
        if(result.extend.pageInfo.hasNextPage==false){
            nextPageLi.addClass("disabled");
            lastPageLi.addClass("disabled");
        }else{
            nextPageLi.click(function () {
                to_page(result.extend.pageInfo.pageNum+1);
            })
            lastPageLi.click(function(){
                to_page(result.extend.pageInfo.pages);
            })
        }

        ul.append(firstPageLi).append(prePageLi);
        $.each(result.extend.pageInfo.navigatepageNums,function(index,item){
            var numLi=$("<li></li>").append($("<a></a>").append(item));
            if(result.extend.pageInfo.pageNum==item)
            {
                numLi.addClass("active");
            }
            numLi.click(function(){
                to_page(item);
            })
            ul.append(numLi);
        });
        ul.append(nextPageLi).append(lastPageLi);
        var navEle=$("<nav></nav>").append(ul);
        navEle.appendTo("#page_nav_area");
    }
    //清空表单样式及其内容
    function reset_form(ele){
        $(ele)[0].reset();
        //清空表单样式
        $(ele).find("*").removeClass("has-error has-success");
        $(ele).find(".help-block").text("");
    }
    //点击新增弹出模态框
    $("#emp_add_modal_btn").click(function(){
        reset_form("#empAddModal form");
        //清除表单数据
      //  $("")[0].reset();
        //发送ajax请求，查处部门信息，先是在下拉列表中
        getDepts("#empAddModal select");
        //弹出模态框
        $("#empAddModal").modal({
            backdrop:"static"
        })
    })
    //查出所有的部门信息，显示在下拉列表中
    function getDepts(ele){
        $(ele).empty();
        $.ajax({
            url:"${pageContext.request.contextPath}/depts",
            type:"GET",
            success:function(result){
                // console.log(result);
                //显示部门信息在下拉列表中
                //$("#empAddModal select").append("")
                $.each(result.extend.depts,function(){
                    var optionEle=$("<option></option>").append(this.deptName).attr("value",this.deptId);
                    optionEle.appendTo(ele);
                })
            }
        })
    }
    //校验用户名是否可用
    $("#empName_add_input").change(function(){
        var empName=this.value;
        //发送ajax请求校验用户是否可用
        $.ajax({
            url:"${pageContext.request.contextPath}/checkUser",
            data:"empName="+empName,
            type:"POST",
            success:function(result){
                if(result.code==100){
                    show_validate_msg("#empName_add_input","success","用户名可用");
                    $("#emp_save_btn").attr("ajax-va","success");
                }else{
                    show_validate_msg("#empName_add_input","error",result.extend.va_msg);
                    $("#emp_save_btn").attr("ajax-va","error");
                }
             }
        })
    })
    //校验表单数据
    function validate_add_form(){
        //拿到要检验的数据，使用正则表达式
        var empName= $("#empName_add_input").val();

        var regName=/(^[a-zA-Z0-9_-]{6,16}$)|(^[\u2E80-\u9FFF]{2,5}$)/;
        if(!regName.test(empName)){
            show_validate_msg("#empName_add_input","error","前端验证用户名可以是2-5位中文或者6-16英文数字的组合");
            //alert("用户名可以是2-5位中文或者6-16英文数字的组合");
            return false;
        }
        else{
            show_validate_msg("#empName_add_input","success","");
        }
        var email=$("#email_add_input").val();
        var regEmail=/^([a-zA-Z]|[0-9])(\w|\-)+@[a-zA-Z0-9]+\.([a-zA-Z]{2,4})$/
        if(!regEmail.test(email)){
            show_validate_msg("#email_add_input","error","邮箱格式有误");
            return false;
        }
        else{
            show_validate_msg("#email_add_input","success","");
        }
        return true;
    }
    //点击保存，保存员工
    $("#emp_save_btn").click(function(){
        //1.模态框中填写的表单数据提交给服务器进行保存
        //2.发送ajax请求保存员工
       /* if(!validate_add_form()){
            return false;
        }*/
        //判断之前的ajax用户名校验是否成功，如果成功
        if($(this).attr("ajax-va")=="error"){
            return false;
        }

        $.ajax({
            url:"${pageContext.request.contextPath}/emp",
            type:"POST",
            data:$("#empAddModal form").serialize(),
            success:function(result){
               // alert(result.msg);
                if(result.code==100){
                    //员工保存成功
                    //1.关闭模态框
                    $("#empAddModal").modal('hide');
                    //2，来到最后一页，显示刚才保存的数据信息
                    //发送显示最后一页数据结束
                    to_page(totalRecord);
                }else{
                    //显示失败的信息
                    //console.log(result);
                    //有哪个字段的错误信息，就显示哪个字段信息
                    if(undefined!=result.extend.errorFields.email){
                        //显示邮箱的错误信息
                        show_validate_msg("#email_add_input","error",result.extend.errorFields.email);
                    }
                    if(undefined!=result.extend.errorFields.empName){
                        //形式员工的名字错误信息
                        show_validate_msg("#empName_add_input","error",result.extend.errorFields.empName);
                    }
                }

            }
        });

    })

    function show_validate_msg(ele,status,msg){
        $(ele).parent().removeClass("has-success has-error");
        $(ele).next("span").text("");
        if("success"==status){
            $(ele).parent().addClass("has-success");
            $(ele).next("span").text("");
        }else if("error"==status){
            $(ele).parent().addClass("has-error");
            $(ele).next("span").text(msg);
        }
    }

    //单个删除
    $(document).on("click",".delete_btn",function(){
        //1、弹出确认删除对话框
        //alert($(this).parents("tr").find("td:eq(1)").text());
        var empName=$(this).parents("tr").find("td:eq(2)").text();
        var empId=$(this).attr("del-id");
        if(confirm("确认删除["+empName+"]吗?")){
            //确认，发送ajax请求删除即可
            $.ajax({
                url:"${pageContext.request.contextPath}/emp/"+empId,
                type:"DELETE",
                success:function(result){
                    alert(result.msg);
                    //回到本页
                    to_page(currentPage);
                }
            })
        }
    });
    //我们是按钮创建之前就绑定了click，所以绑定不上了
    //1)可以在创建按钮的时候绑定
    //2)绑定单击事件.live()方法jQuery新版本没有这个fangfa
    //使用on进行代替
    $(document).on("click",".edit_btn",function(){
       // alert("edit");
        reset_form("#empUpdateModal form");
        //0.查出员工信息，显示员工信息

        //1.查出部门信息，显示部门列表
        getDepts("#empUpdateModal select");
        getEmp($(this).attr("edit-id"));
        //把员工的id传递给模态框更新按钮
        $("#emp_update_btn").attr("edit-id",$(this).attr("edit-id"))
        //2.弹出模态框
        $("#empUpdateModal").modal({
            backdrop:"static"
        })
    })
    function getEmp(id){
        $.ajax({
            url:"${pageContext.request.contextPath}/emp/"+id,
            type:"GET",
            success:function(result){
                var empData=result.extend.emp;

                $("#empName_update_static").text(empData.empName);
                $("#email_update_input").val(empData.email);
                $("#empUpdateModal input[name=gender]").val([empData.gender]);
                $("#empUpdateModal select").val([empData.dId]);
               // console.log()
            }
        })
    }

    //点击更新，更新员工
    $("#emp_update_btn").click(function(){
        //验证邮箱是否合法

        //拿到要检验的数据，使用正则表达式
        var email=$("#email_update_input").val();
        var regEmail=/^([a-zA-Z]|[0-9])(\w|\-)+@[a-zA-Z0-9]+\.([a-zA-Z]{2,4})$/
        if(!regEmail.test(email)){
            show_validate_msg("#email_update_input","error","邮箱格式有误");
            return false;
        }
        else{
            show_validate_msg("#email_update_input","success","");
        }
        //2.发送ajax请求保存更新的员工数据
        $.ajax({
            url:"${pageContext.request.contextPath}/emp/"+$(this).attr("edit-id"),
            type:"POST",
            data:$("#empUpdateModal form").serialize()+"&_method=PUT",
            success:function(result)
            {
               // alert(result.msg);
                //关闭对话框
                $("#empUpdateModal").modal("hide");
                //回到本页面
                to_page(currentPage);
            }
        })
    })

    //完成全选、全不选的操作
    $("#check_all").click(function(){
        //attr获取checked是undefined
        //我们这些原生的属性：attr获取自定义属性的值
        // alert($(this).attr("checked"));
        //prop修改和读取dom原生属性的值
        //alert($(this).prop("checked"));
        $(".check_item").prop("checked",$(this).prop("checked"));
        // $(".check_item")
    });

    $(document).on("click",".check_item",function(){
        //当前选择中的元素是否5个
        var flag=$(".check_item:checked").length==$(".check_item").length;
        $("#check_all").prop("checked",flag);
    })


    //点击全部删除，就批量删除
    $("#emp_delete_all_btn ").click(function(){

        var empNames="";
        var del_idstr="";
        $.each($(".check_item:checked"),function(){
            empNames += $(this).parents("tr").find("td:eq(2)").text()+",";
            del_idstr+=$(this).parents("tr").find("td:eq(1)").text()+"-";
        });
        //去除empNames多余的,
        empNames=empNames.substring(0,empNames.length-1);
        del_idstr=del_idstr.substring(0,del_idstr.length-1);
        if(confirm("确认删除【"+empNames+"】吗？")){
            //发送ajax请求删除
            $.ajax({
                url:"${pageContext.request.contextPath}/emp/"+del_idstr,
                type:"DELETE",
                success:function(result){
                    alert(result.msg);
                    //回到当前页
                    to_page(currentPage);
                }
            })
        }
    })

</script>
</body>
</html>
