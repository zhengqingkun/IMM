//验证添加客户名称
function checkAddName() {
    var $fname = $("#addname");
    var $divID = $("#Divname");
    $divID.html("");
    if ($fname.val() == "") {
        $divID.html("客户名称不能为空");
        return false;
    }
    return true;
}
//验证添加负责人名称
function checkAddPersonInCharge() {
    var $fname = $("#addpersonInCharge");
    var $divID = $("#DivpersonInCharge");
    $divID.html("");
    if ($fname.val() == "") {
        $divID.html("负责人名称不能为空");
        return false;
    }
    return true;
}
//验证添加负责人职称
function checkAddPost() {
    var $fname = $("#addpost");
    var $divID = $("#Divpost");
    $divID.html("");
    if ($fname.val() == "") {
        $divID.html("负责人职称不能为空");
        return false;
    }
    return true;
}
//验证添加客户地址
function checkAddAddress() {
    var $fname = $("#addaddress");
    var $divID = $("#Divaddress");
    $divID.html("");
    if ($fname.val() == "") {
        $divID.html("客户地址不能为空");
        return false;
    }
    return true;
}
//验证添加送货地址
function checkAddFactoryAddress() {
    var $fname = $("#addfactoryAddress");
    var $divID = $("#DivfactoryAddress");
    $divID.html("");
    if ($fname.val() == "") {
        $divID.html("送货地址不能为空");
        return false;
    }
    return true;
}
//验证添加移动电话
function checkAddMobilePhone() {
    var $fname = $("#addmobilePhone");
    var $divID = $("#DivmobilePhone");
    $divID.html("");
    if ($fname.val() == "") {
        $divID.html("移动电话不能为空");
        return false;
    }
    return true;
}
//验证添加电话
function checkAddPhone() {
    var $fname = $("#addphone");
    var $divID = $("#Divphone");
    $divID.html("");
    if ($fname.val() == "") {
        $divID.html("电话不能为空");
        return false;
    }
    return true;
}
//验证添加传真
function checkAddFax() {
    var $fname = $("#addfax");
    var $divID = $("#Divfax");
    $divID.html("");
    if ($fname.val() == "") {
        $divID.html("传真不能为空");
        return false;
    }
    return true;
}


//验证修改客户名称
function checkUpdateName() {
    var $fname = $("#updatename");
    var $divID = $("#remindername");
    $divID.html("");
    if ($fname.val() == "") {
        $divID.html("客户名称不能为空");
        return false;
    }
    return true;
}
//验证修改负责人名称
function checkUpdatePersonInCharge() {
    var $fname = $("#updatepersonInCharge");
    var $divID = $("#reminderpersonInCharge");
    $divID.html("");
    if ($fname.val() == "") {
        $divID.html("负责人名称不能为空");
        return false;
    }
    return true;
}
//验证修改负责人职称
function checkUpdatePost() {
    var $fname = $("#updatepost");
    var $divID = $("#reminderpost");
    $divID.html("");
    if ($fname.val() == "") {
        $divID.html("负责人职称不能为空");
        return false;
    }
    return true;
}
//验证修改客户地址
function checkUpdateAddress() {
    var $fname = $("#updateaddress");
    var $divID = $("#reminderaddress");
    $divID.html("");
    if ($fname.val() == "") {
        $divID.html("客户地址不能为空");
        return false;
    }
    return true;
}
//验证修改送货地址
function checkUpdateFactoryAddress() {
    var $fname = $("#updatefactoryAddress");
    var $divID = $("#reminderfactoryAddress");
    $divID.html("");
    if ($fname.val() == "") {
        $divID.html("送货地址不能为空");
        return false;
    }
    return true;
}
//验证修改移动电话
function checkUpdateMobilePhone() {
    var $fname = $("#updatemobilePhone");
    var $divID = $("#remindermobilePhone");
    $divID.html("");
    if ($fname.val() == "") {
        $divID.html("移动电话不能为空");
        return false;
    }
    return true;
}
//验证修改电话
function checkUpdatePhone() {
    var $fname = $("#updatephone");
    var $divID = $("#reminderphone");
    $divID.html("");
    if ($fname.val() == "") {
        $divID.html("电话不能为空");
        return false;
    }
    return true;
}
//验证修改传真
function checkUpdateFax() {
    var $fname = $("#updatefax");
    var $divID = $("#reminderfax");
    $divID.html("");
    if ($fname.val() == "") {
        $divID.html("传真不能为空");
        return false;
    }
    return true;
}

$(function () {
    //修改为不合作客户
    $("#btn-disable").click(function () {
        var clientList = new Array();
        $(".clients").each(function (index, date) {
            var checkbox = $(date).find(".k");
            if(checkbox.is(':checked')){
                //选中了
                var id = $(date).find(".k").val();
                var object = new Object();
                object.kk = id;
                clientList.push(object);
                var noncooperationClient = JSON.stringify(clientList);
                $.ajax({
                    type: "post",
                    url: "/client/noncooperationClient.do",
                    data: {
                        "noncooperationClient": noncooperationClient
                    },
                    dataType: "json",
                    success: function (data) {
                        if(data!=0){
                            for(i in data){
                                $("#"+data[i].clientId).remove();
                            }
                        }
                    },
                    error: function () {
                        alert("系统异常，请稍后重试！");
                    }
                })
            }
        });
    })
    //添加供应商信息
    $("#insert").click(function () {
        $("#addname").blur(checkAddName);
        $("#addpersonInCharge").blur(checkAddPersonInCharge);
        $("#addpost").blur(checkAddPost);
        $("#addaddress").blur(checkAddAddress);
        $("#addfactoryAddress").blur(checkAddFactoryAddress);
        $("#addmobilePhone").blur(checkAddMobilePhone);
        $("#addphone").blur(checkAddPhone);
        $("#addfax").blur(checkAddFax);
        var flag = true;
        if (!checkAddName()) flag = false;
        if (!checkAddPersonInCharge()) flag = false;
        if (!checkAddPost()) flag = false;
        if (!checkAddAddress()) flag = false;
        if (!checkAddFactoryAddress()) flag = false;
        if (!checkAddMobilePhone()) flag = false;
        if (!checkAddPhone()) flag = false;
        if (!checkAddFax()) flag = false;
        if(flag != false){
            var supplier = new Array();
            var object =new Object();
            object.supplierName= $("#addname").val();
            object.supplierPersonInCharge= $("#addpersonInCharge").val();
            object.supplierPost= $("#addpost").val();
            object.supplierPhone= $("#addphone").val();
            object.supplierMobilePhone= $("#addmobilePhone").val();
            object.supplierFax= $("#addfax").val();
            object.supplierAddress= $("#addaddress").val();
            object.supplierFactoryAddress= $("#addfactoryAddress").val();
            object.supplierState= $("#addstate").val();
            supplier.push(object);
            var supplierList = JSON.stringify(supplier);
            $.ajax({
                type: "post",
                url: "/supplier/addsupplier.do",
                data: {
                    "supplierList": supplierList
                },
                dataType: "json",
                success: function (data) {
                    $("#closeAdd").click();
                    var str = "";
                    if(data!=0){
                        var da = eval(data);
                        $("#tbod").html("");
                        alert("adsa");
                        $.each(da,function (i,item) {
                            str+="<tr id="+item.supplierId+" class='clients'>" +
                                "                <td><input name=\"client.kk\" class=\"k\"  runat=\"server\" type=\"checkbox\" value="+item.supplierId+" /></td>\n" +
                                "                <td id=\"supplierId\" style=\"display: none\">"+item.supplierId+"</td>\n" +
                                "                <td id=\"supplierName\">"+item.supplierName+"</td>\n" +
                                "                <td id=\"supplierPersonInCharge\">"+item.supplierPersonInCharge+"</td>\n" +
                                "                <td id=\"supplierPost\">"+item.supplierPost+"</td>\n" +
                                "                <td id=\"supplierPhone\">"+item.supplierPhone+"</td>\n" +
                                "                <td id=\"supplierMobilePhone\">"+item.supplierMobilePhone+"</td>\n" +
                                "                <td id=\"supplierFax\">"+item.supplierFax+"</td>\n" +
                                "                <td id=\"supplierAddress\">"+item.supplierAddress+"</td>\n" +
                                "                <td id=\"supplierFactoryAddress\">"+item.supplierFactoryAddress+"</td>\n" +
                                "                <td  id=\"State\">"+item.state+"</td>\n"+
                                "                <td  >\n" +
                                "                    <button type=\"button\" id=\""+item.supplierId+"\" data-target=\"#update\" name=\"updateClient\"   class=\"btn btn-info btn-sm\" data-toggle=\"modal\"  ><span class=\"up\">修改</span></button>\n" +
                                "                </td>\n" +
                                "            </tr>";
                        })
                        $("#tbod").append(str);
                    }
                    $("#addname").val("");
                    $("#addpersonInCharge").val("");
                    $("#addpost").val("");
                    $("#addphone").val("");
                    $("#addmobilePhone").val("");
                    $("#addfax").val("");
                    $("#addaddress").val("");
                    $("#addfactoryAddress").val("");
                    $("#addstate").val("");
                },
                error: function () {
                    alert("系统异常，请稍后重试！");
                }
            })
        }
    })
    //修改客户信息
    $("#updates").click(function () {
        $("#updatename").blur(checkUpdateName);
        $("#updatepersonInCharge").blur(checkUpdatePersonInCharge);
        $("#updatepost").blur(checkUpdatePost);
        $("#updateaddress").blur(checkUpdateAddress);
        $("#updatefactoryAddress").blur(checkUpdateFactoryAddress);
        $("#updatemobilePhone").blur(checkUpdateMobilePhone);
        $("#updatephone").blur(checkUpdatePhone);
        $("#updatefax").blur(checkUpdateFax);
        var flag = true;
        if (!checkUpdateName()) flag = false;
        if (!checkUpdatePersonInCharge()) flag = false;
        if (!checkUpdatePost()) flag = false;
        if (!checkUpdateAddress()) flag = false;
        if (!checkUpdateFactoryAddress()) flag = false;
        if (!checkUpdateMobilePhone()) flag = false;
        if (!checkUpdatePhone()) flag = false;
        if (!checkUpdateFax()) flag = false;
        if(flag != false){
            var clients = new Array();
            var object =new Object();
            object.clientId= $("#updateid").val();
            object.supplierName= $("#updatename").val();
            object.supplierPersonInCharge= $("#updatepersonInCharge").val();
            object.supplierPost= $("#updatepost").val();
            object.supplierAddress= $("#updateaddress").val();
            object.supplierFactoryAddress= $("#updatefactoryAddress").val();
            object.supplierMobilePhone= $("#updatemobilePhone").val();
            object.supplierPhone= $("#updatephone").val();
            object.supplierFax= $("#updatefax").val();
            clients.push(object);
            var clientList = JSON.stringify(clients);
            $.ajax({
                type: "post",
                url: "/client/updatesClient.do",
                data: {
                    "clientList": clientList
                },
                dataType: "json",
                success: function (data) {
                    $("#closeUpdate").click();
                    var str = "";
                    if(data!=0){
                        var da = eval(data);
                        $("#tbod").html("");
                        $.each(da,function (i, item) {
                            str+="<tr id="+item.supplierId+" class='clients'>" +
                                "                <td><input name=\"client.kk\" class=\"k\"  runat=\"server\" type=\"checkbox\" value="+item.supplierId+" /></td>\n" +
                                "                <td id=\"supplierId\" style=\"display: none\">"+item.supplierId+"</td>\n" +
                                "                <td id=\"supplierName\">"+item.supplierName+"</td>\n" +
                                "                <td id=\"supplierPersonInCharge\">"+item.supplierPersonInCharge+"</td>\n" +
                                "                <td id=\"supplierPost\">"+item.supplierPost+"</td>\n" +
                                "                <td id=\"supplierPhone\">"+item.supplierPhone+"</td>\n" +
                                "                <td id=\"supplierMobilePhone\">"+item.supplierMobilePhone+"</td>\n" +
                                "                <td id=\"supplierFax\">"+item.supplierFax+"</td>\n" +
                                "                <td id=\"supplierAddress\">"+item.supplierAddress+"</td>\n" +
                                "                <td id=\"supplierFactoryAddress\">"+item.supplierFactoryAddress+"</td>\n" +
                                "                <td  id=\"State\">"+item.state+"</td>\n"+
                                "                <td  >\n" +
                                "                    <button type=\"button\" id=\""+item.supplierId+"\" data-target=\"#update\" name=\"updateClient\"   class=\"btn btn-info btn-sm\" data-toggle=\"modal\"  ><span class=\"up\">修改</span></button>\n" +
                                "                </td>\n" +
                                "            </tr>";
                        })
                        $("#tbod").append(str);
                    }
                    $("#updatename").val("");
                    $("#updatepersonInCharge").val("");
                    $("#updatepost").val("");
                    $("#updatephone").val("");
                    $("#updatemobilePhone").val("");
                    $("#updatefax").val("");
                    $("#updateaddress").val("");
                    $("#updatefactoryAddress").val("");
                    $("#updatestate").val("");
                },
                error: function () {
                    alert("系统异常，请稍后重试！");
                }
            })
        }
    })
    //查看终止合作的客户
    $("#termination").click(function () {
        var clientState=this.name;
        document.getElementById("btn-disable").setAttribute("disabled",true);
        document.getElementById("addClient").setAttribute("disabled",true);
        $("#btn-enable").attr("disabled",false);
        $.ajax({
            type:"post",
            url:"/client/clientCooperation.do?clientState="+clientState,
            dataType: "json",
            success: function (data) {
                var str = "";
                if(data!=0){
                    var da = eval(data);
                    $("#tbod").html("");
                    $.each(da,function (i, item) {
                        str+="<tr id="+item.supplierId+" class='clients'>" +
                            "                <td><input name=\"client.kk\" class=\"k\"  runat=\"server\" type=\"checkbox\" value="+item.supplierId+" /></td>\n" +
                            "                <td id=\"supplierId\" style=\"display: none\">"+item.supplierId+"</td>\n" +
                            "                <td id=\"supplierName\">"+item.supplierName+"</td>\n" +
                            "                <td id=\"supplierPersonInCharge\">"+item.supplierPersonInCharge+"</td>\n" +
                            "                <td id=\"supplierPost\">"+item.supplierPost+"</td>\n" +
                            "                <td id=\"supplierPhone\">"+item.supplierPhone+"</td>\n" +
                            "                <td id=\"supplierMobilePhone\">"+item.supplierMobilePhone+"</td>\n" +
                            "                <td id=\"supplierFax\">"+item.supplierFax+"</td>\n" +
                            "                <td id=\"supplierAddress\">"+item.supplierAddress+"</td>\n" +
                            "                <td id=\"supplierFactoryAddress\">"+item.supplierFactoryAddress+"</td>\n" +
                            "                <td  id=\"State\">"+item.state+"</td>\n"+
                            "                <td  >\n" +
                            "                    <button type=\"button\" id=\""+item.supplierId+"\" data-target=\"#update\" name=\"updateClient\"   class=\"btn btn-info btn-sm\" data-toggle=\"modal\"  ><span class=\"up\">修改</span></button>\n" +
                            "                </td>\n" +
                            "            </tr>";
                    })
                    $("#tbod").append(str);
                }else {
                    alert("失败")
                }
            },
            error: function () {
                alert("系统异常，请稍后重试！");
            }
        })
    })
    //查看在合作客户
    $("#cooperation").click(function () {
        var clientState=this.name;
        document.getElementById("btn-enable").setAttribute("disabled",true);

        $("#addClient").attr("disabled",false);
        $("#btn-disable").attr("disabled",false);
        $.ajax({
            type:"post",
            url:"/client/clientCooperation.do?clientState="+clientState,
            dataType: "json",
            success: function (data) {
                var str = "";
                if(data!=0){
                    var da = eval(data);
                    $("#tbod").html("");
                    $.each(da,function (i, item) {
                        str+="<tr id="+item.supplierId+" class='clients'>" +
                            "                <td><input name=\"client.kk\" class=\"k\"  runat=\"server\" type=\"checkbox\" value="+item.supplierId+" /></td>\n" +
                            "                <td id=\"supplierId\" style=\"display: none\">"+item.supplierId+"</td>\n" +
                            "                <td id=\"supplierName\">"+item.supplierName+"</td>\n" +
                            "                <td id=\"supplierPersonInCharge\">"+item.supplierPersonInCharge+"</td>\n" +
                            "                <td id=\"supplierPost\">"+item.supplierPost+"</td>\n" +
                            "                <td id=\"supplierPhone\">"+item.supplierPhone+"</td>\n" +
                            "                <td id=\"supplierMobilePhone\">"+item.supplierMobilePhone+"</td>\n" +
                            "                <td id=\"supplierFax\">"+item.supplierFax+"</td>\n" +
                            "                <td id=\"supplierAddress\">"+item.supplierAddress+"</td>\n" +
                            "                <td id=\"supplierFactoryAddress\">"+item.supplierFactoryAddress+"</td>\n" +
                            "                <td  id=\"State\">"+item.state+"</td>\n"+
                            "                <td  >\n" +
                            "                    <button type=\"button\" id=\""+item.supplierId+"\" data-target=\"#update\" name=\"updateClient\"   class=\"btn btn-info btn-sm\" data-toggle=\"modal\"  ><span class=\"up\">修改</span></button>\n" +
                            "                </td>\n" +
                            "            </tr>";
                    })
                    $("#tbod").append(str);
                }else {
                    alert("失败")
                }
            },
            error: function () {
                alert("系统异常，请稍后重试！");
            }
        })
    })

    //获取要修改的信息
    function gainclient(val){
        alert(val)
        $.ajax({
            type: "post",
            url: "/client/clientId.do?clientId="+val,
            dataType: "json",
            success: function (data) {
                if(data!=0){
                    $.each(data, function(i,item){
                        $("#updateid").val(item.supplierId)
                        $("#updatename").val(item.supplierName)
                        $("#updatepersonInCharge").val(item.supplierPersonInCharge)
                        $("#updatepost").val(item.supplierPost)
                        $("#updateaddress").val(item.supplierAddress)
                        $("#updatefactoryAddress").val(item.supplierFactoryAddress)
                        $("#updatemobilePhone").val(item.supplierMobilePhone)
                        $("#updatephone").val(item.supplierPhone)
                        $("#updatefax").val(item.supplierFax)
                    });
                }
            },
            error: function () {
                alert("系统异常，请稍后重试！");
            }
        })
    }
})