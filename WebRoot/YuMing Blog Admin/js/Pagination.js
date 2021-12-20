/**
 * @author: Aiden Connor (YuMingC233@gmail.com)
 * @date: 2020-08-17 09:20:58
 * @version: 1.0
 */

 $(function () {
    var march = $(".pagination > #march");
    var rewind = $(".pagination > #rewind");
    
    /**
     * 
     */
    $.ajax({
        type: "post",
        url: "tagControl",
        data: {
            "sendMode": "pageBar"
        },
        dataType: "json",
        success: function (response) {
            for (let i = 2; i <= response[0].MaxTagPage; i++) {
                var tempStr = 
                "<li class='page-item normal'>"+
                    "<a class='page-link' href='javascript:void(0)'>"+
				    	i
                    +"</a>"+
                "</li>";
                $(".page-item.normal:last").after(tempStr);
            }
            $(".pagination .normal a").click(function (e) {
                // 获取被选中的页
                if (!$(this).hasClass("active")) {
                    normalPageClick(this);
                }
            });
            initFuncEvent();
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
    
    function normalPageClick(self) {
        // 获取所有的li集合
        var liList = $(".pagination > li");
        
        var currPageLi = $(".pagination").find(".active");
        var currPageA = $(".pagination").find(".active > a ");
        $.ajax({
            type: "post",
            url: "tagControl",
            data: {
                "sendMode": "jumpPage",
                "currPage": $(self).html()
            },
            dataType: "json",
            success: function (response) {
                $(".table > tbody").html("");
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
                $($(self).parent()).addClass("active");
                $(currPageLi).removeClass("active");

                if ($(currPageA).html() == $($(liList[1]).find("a")).html()) {
                    rewind.addClass("disabled");
                    march.removeClass("disabled");
                } else if ($(currPageA).html() == $($(liList[liList.length - 2]).find("a")).html()) {
                    march.addClass("disabled");
                    rewind.removeClass("disabled");
                }
                initFuncEvent();
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
     * 上一页按钮被点击时
     */
    march.click(function (e) {
        // 获取所有的li集合
        var liList = $(".pagination > li");
        // 获取被选中的页
        var currPageA = $(".pagination").find(".active > a ");
        var currPageLi = $(".pagination").find(".active");
        var currPagePrev = $(currPageLi).prev();
        
        if (!$(this).hasClass("disabled")) {
            $.ajax({
                type: "post",
                url: "tagControl",
                data: {
                    "sendMode": "prevPage",
                    "currPage": parseInt($(currPageA).html()) - 1
                },
                dataType: "json",
                success: function (response) {
                    $(".table > tbody").html("");
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
                    $(currPagePrev).addClass("active");
                    $(currPageLi).removeClass("active");

                    currPageA = $(".pagination").find(".active > a ");
                    if ($(currPageA).html() == $($(liList[1]).find("a")).html()) {
                    	march.addClass("disabled");
                    	rewind.removeClass("disabled");
                    }
                    initFuncEvent();
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
    });

    /**
     * 下一页按钮被点击时
     */
    rewind.click(function (e) { 
        // 获取所有的li集合
        var liList = $(".pagination > li");
        // 获取被选中的页
        var currPageA = $(".pagination").find(".active > a ");
        var currPageLi = $(".pagination").find(".active");
        var currPageNext = $(currPageLi).next();
    	
        if (!$(this).hasClass("disabled")) {
            $.ajax({
                type: "post",
                url: "tagControl",
                data: {
                    "sendMode": "nextPage",
                    "currPage": parseInt($(currPageA).html()) + 1
                },
                dataType: "json",
                success: function (response) {
                    $(".table > tbody").html("");
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
                    $(currPageNext).addClass("active");
                    $(currPageLi).removeClass("active");
                    currPageA = $(".pagination").find(".active > a ");
                    if ($(currPageA).html() == $($(liList[liList.length - 2]).find("a")).html()) {
                        rewind.addClass("disabled");
                        march.removeClass("disabled");
                    }
                    initFuncEvent();
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
    });
    
//  if ($(currPageA).html() == "1") {
//  march.addClass("disabled");
//  rewind.removeClass("disabled");
//} else if ($(currPageA).html() == $(liList[liList.length - 1]).html()) {
//  rewind.addClass("disabled");
//  march.removeClass("disabled");
//}
 });


var initFuncEvent = function () {
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
}