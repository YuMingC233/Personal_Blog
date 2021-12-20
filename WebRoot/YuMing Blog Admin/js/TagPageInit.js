/**
 * @author: Aiden Connor (YuMingC233@gmail.com)
 * @date: 2020-08-18 19:48:57
 * @version: 1.0
 */
$(function () {
    initFunc();
});

var initFunc = function () {
    $.ajax({
        type: "post",
        url: "tagControl",
        data: {
            "sendMode": "init",
        },
        dataType: "json",
        success: function (response) {
            for (var i of response) {
                var tempStr =
                    "<tr><td class='text-center'>" +
                    i.ID +
                    "</td><td>" +
                    i.Name +
                    "</td><td class='text-center'><button class='btn btn-xs btn-success' data-toggle='modal' data-target='#updateTagModal'>" +
                    "<i class='fa fa-edit'></i> 修改</button>" +
                    "<button class='btn btn-xs btn-danger ml-2' data-toggle='modal' data-target='#deleteTagModal'>" +
                    "<i class='fa fa-trash'></i> 删除" +
                    "</button>" +
                    "</td>" +
                    "</tr>"
                $(".table > tbody").append(tempStr);
            }
            /**
             * 删除按钮点击事件
             */
            var ID = null;
            $("button.btn.btn-xs.btn-danger.ml-2").click(function () {
                var temp = $($(this).parent().parent()).find("td:first");
                ID = temp.html();
            });


            $("#deleteTagBtn").click(function () {
                $.ajax({
                    type: "post",
                    url: "tagControl",
                    data: {
                        "sendMode": "del",
                        "ID": ID
                    },
                    dataType: 'text',
                    success: function (data) {
                        if (data == "true") {
                            $('#delComplete').modal('show');
                        } else {
                            $('#delFailed').modal('show');
                        }
                        $('#deleteTagModal').modal('hide');
                    }
                });
                ID = null;
            });

            /**
             * 修改按钮点击事件
             */
            var Name = null;
            $("button.btn.btn-xs.btn-success").click(function () {
                var temp = $($(this).parent().parent()).find("td:first");
                ID = temp.html();
                var temp2 = $($(this).parent().parent()).find("td:eq(1)");
                Name = temp2.html();
                $("#updateTagModal .form-control").val(Name);
                ID = null;
                Name = null;
            });

            $("#updateTagBtn").click(function (e) {
                var newName = $("#updateTagModal .form-control").val();
                $.ajax({
                    type: "post",
                    url: "tagControl",
                    data: {
                        "sendMode": "update",
                        "ID": ID,
                        "TagName": newName
                    },
                    dataType: 'text',
                    success: function (data) {
                        if (data == "true") {
                            $('#updComplete').modal('show');
                        } else {
                            $('#updFailed').modal('show');
                        }
                        $('#updateTagModal').modal('hide');
                    }
                });
                ID = null;
            });
        },
        error: function (jqXHR, textStatus, errorThrown) {
            /*弹出jqXHR对象的信息*/
            alert(jqXHR.responseText);
            alert(jqXHR.status);
            alert(jqXHR.readyState);
            alert(jqXHR.statusText);

            /*弹出其他两个参数的信息*/
            alert(textStatus);
            alert(errorThrown);
        }
    });
}


/**
 * .新增标签按钮事件
 */
$('#addTagBtn').click(function () {
    var temp = $("#tagInput").val();
    $.ajax({
        type: "post",
        url: "tagControl",
        data: {
            "sendMode": "add",
            "TagName": temp
        },
        dataType: 'text',
        success: function (data) {
            if (data == "true") {
                // 显示ID为addComplete的bootstrap提示框
                $('#addComplete').modal('show');
            } else if (data == "null") {
                $('#addFaild_Null').modal('show');
            } else {
                $('#addFaild').modal('show');
            }
            $('#addTagModal').modal('hide');
        }
    });
});