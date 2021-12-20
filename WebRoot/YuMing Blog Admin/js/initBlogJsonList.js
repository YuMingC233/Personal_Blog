/**
 * @author: Aiden Connor (YuMingC233@gmail.com)
 * @date: 2020-08-19 17:03:49
 * @version: 1.0
 */
$(function () {
  /**
   * 初始化网页中表格的内容以及所有事件
   * init模式中， 查找到的 Blog Info
   * JSON字符串将会放置在被部署的webapp文件下指定的项目文件中
   */
    $.ajax({
        type: "post",
        url: "blogControl",
        data: {
            "sendMode": "init"
        },
        success: function (response) {
          $('#testTable').DataTable({
            ajax: 'data/BlogInfo.json', // 从一个ajax数据源读取数据给表格内容
            dataType: 'json',
            lengthMenu: [10, 20, 30, 60], // 定义在每页显示记录数的select中显示的选项
            // displayLength: 20, //
            // displayStart: 1, //初始化显示时从第几条数据开始显示(一开始显示第几页)
            // lengthChange: false, // 是否允许用户改变表格每页显示的记录数
            searching: false,
            responsive: false,
            // info: false,
            processing: true, // 是否显示处理状态
            // serverSide: true, // 是否开启服务器模式
            autoWidth: true, // 控制Datatables是否自适应宽度
            deferRender: true, // 控制Datatables的延迟渲染，可以提高初始化的速度
            stateSave: true, //保存状态 - 在页面重新加载的时候恢复状态（页码等内容）
            // dom: '<"top"i>rt<ip>',
            dom: '<"row"<"col-md-12"<"float-left"l><"#topPlugin.float-right">>>irt<"mt-3 pagination-sm"p>',
            initComplete: renderTopPlugin, // 初始化结束后的回调函数
            ordering: false,
            columns: [
              {
                data: "ID",
                render: function (data, type, row, meta) {
                  return '<input type="checkbox" value="' + data + '" name="id"/>';
                }
              },
              {
                data: "Title"
              },
              {
                data: "TagsID",
                render: function (data, type, row, meta) {
                    var insideData = data.split(",");
                    var tempStr = "";
                    for (var i in insideData) {
                        $.ajax({
                            type: "post",
                            url: "tagControl",
                            data: {
                                "sendMode": "getTagByID",
                                "ID": insideData[i]
                            },
                            dataType: "json",
                            async: false,
                            success: function (resp) {
                                tempStr += resp.Name + ",";
                            }
                        });
                    }
                    return tempStr.substring(0, tempStr.length - 1);;
                }
              },
              {
                data: "ReadNum"
              },
              {
                data: "CommentNum"
              },
              {
                data: "PublishTime",
                render: function (data, type, row, meta) {
                    var d = new Date(data);
                    var strDate = formatDate(d);
                  return strDate;
                }
              },
              {
                data: "LastUpdateTime",
                render: function (data, type, row, meta) {
                  var d = new Date(data);
                  var strDate = formatDate(d);
                  return strDate;
                }
              },
              {
                render: function (data, type, row, meta) {
                  return '<button class="btn btn-danger btn-xs" data-toggle="modal" data-target="#deleteBlogModal">删除</button> <button class="btn btn-success btn-xs">修改</button>'
                }
              }
            ],
            language: { // 国际化配置
              decimal: "",
              emptyTable: "表格为空",
              info: "显示从_START_到_END_条记录 (总记录数为_TOTAL_条)",
              infoEmpty: "记录数为0",
              infoFiltered: "(从_MAX_条记录过滤)",
              infoPostFix: "",
              thousands: ",",
              lengthMenu: "显示 _MENU_ 条",
              loadingRecords: "Loading...",
              processing: "正在获取数据，请稍后...",
              sSearch: "搜索",
              zeroRecords: "没有找到数据",
              paginate: {
                previous: "上一页",
                first: "第一页",
                next: "下一页",
                last: "最后一页"
              }
            },
            drawCallback: delModBtnTrigger
          });

          /**
           * 表格加载渲染完毕后执行的方法
           * @param data
           */
          function renderTopPlugin(data) {
            //上方topPlugin DIV中追加HTML
            //var topPlugin='<button id="addButton" class="btn btn-success btn-sm" data-toggle="modal" data-target="#addUser" style="display:block;">' +
            // '<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>添加用户</button>';
            //删除按钮的HTMLDOM
            var topPlugin =
              '<button class="btn btn-danger btn-sm" data-toggle="modal" data-target="#deleteManyBlogModal">批量删除</button> <button class="btn btn-primary btn-sm">新增</button>';
            $("#topPlugin").append(topPlugin); //在表格上方topPlugin DIV中追加HTML
            //$("#expCsv").on("click", exp1);//给下方按钮绑定事件

            // 全选多选框选中事件
            $($("#testTable tr").find("th:eq(0) > input")).click(function (e) {
              var manyBox = $("tbody tr").find("td:eq(0) > input");
              if ($(manyBox).is(':checked')) {
                manyBox.prop("checked", false);
              } else {
                manyBox.prop("checked", true);
              }
            });

            // 新增按钮点击事件
            $(".btn-primary").click(function (e) {
              location.href = "edit.jsp";
            });
          }

          /**
           * 删除，修改按钮事件绑定
           */
          function delModBtnTrigger() {
            /**
             * 批量删除按钮点击事件
             */
            var manyID = "";
            $(".btn-danger.btn-sm").click(function (e) {
              var manyBox = $("tbody tr").find("td:eq(0) > input");
              var j = 0;
              for (let i = 0; i < manyBox.length; i++) {
                // 找到所有被选中的博客并保存被选中的ID
                if ($(manyBox[i]).is(':checked')) {
                  j++;
                  manyID += $(manyBox[i]).val() + ",";
                }
              }
              if (j == 0) {
                $(this).attr("data-target", "");
              } else {
                $(this).attr("data-target", "#deleteManyBlogModal");
              }
            });

            $("#deleteManyBlogModal #deleteTagBtn").click(function (e) {
              $.ajax({
                type: "post",
                url: "blogControl",
                data: {
                  "sendMode": "delMany",
                  "manyID": manyID
                },
                dataType: 'text',
                success: function (data) {
                  if (data == "true") {
                    $('#delComplete').modal('show');
                  } else {
                    $('#delFailed').modal('show');
                  }
                  $('#deleteBlogModal').modal('hide');
                },
              });
              manyID = "";
            });

            /**
             * 删除按钮点击事件
             */
            var ID;
            $("button.btn.btn-danger.btn-xs").click(function (e) {
              var temp = $($(this).parent().parent()).find("td:first");
              ID = $($(temp).find("input")).val();
            });

            $("#deleteTagBtn").click(function (e) {
              $.ajax({
                type: "post",
                url: "blogControl",
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
                  $('#deleteBlogModal').modal('hide');
                }
              });
              ID = null;
            });

            /**
             * 修改按钮点击事件
             */
            $("button.btn.btn-success.btn-xs").click(function (e) {
              var temp = $($(this).parent().parent()).find("td:first");
              ID = $($(temp).find("input")).val();
              location.href = "edit.jsp?ID=" + ID;
            })
          }
        }
    });
});

/**
 * 对日期格式化为yyyy-mm-dd格式
 * @param {传入的日期对象参数} date 
 */
function formatDate(date) {
  var d = new Date(date),
      month = '' + (d.getMonth() + 1),
      day = '' + d.getDate(),
      year = d.getFullYear(),
      hh = d.getHours(),
      mm = d.getMinutes(),
      ss = d.getSeconds();

  if (month.length < 2)
    month = '0' + month;
  if (day.length < 2)
    day = '0' + day;

  return [year, month, day].join('-') +" "+ [hh, mm, ss].join(":");
}
