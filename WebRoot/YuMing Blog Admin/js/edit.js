$(function () {
  /**
   * Initialize Select2
   */
  $('.select2').select2();

  /**
   * Initialize SweetAlert2
   */
  const Toast = Swal.mixin({
    toast: true,
    position: 'top-end',
    showConfirmButton: true,
    timer: 3000
  });
  
  /**
   * Initialize editor.md
   */
  var blogEditor = editormd("editormd", {
    width: "100%",
    height: 580,
    htmlDecode: true,
    saveHTMLToTextarea: true,
    // taskList: true,
    toolbarIcons: function () {
      // Using "||" set icons align right.
      return [
        "undo", "redo", "|",
        "bold", "del", "italic", "quote", "ucwords", "uppercase", "lowercase", "|",
        "h1", "h2", "h3", "h4", "h5", "h6", "|",
        "list-ul", "list-ol", "hr", "|",
        "link", "reference-link", "image", "code", "preformatted-text", "code-block", "table", "datetime", "html-entities", "pagebreak", "|",
        "goto-line", "watch", "preview", "clear", "search", "|",
        "help", "info"
      ];
    },
    path: './plugins/editor.md/lib/',
    disabledKeyMaps: [
      "F11"  // disable some default keyboard shortcuts handle
    ],
    onload: function () {
      var keyMap = {
        "Ctrl-S": function (cm) {
          $('#isPublish').val(false);
          if (validateBlogForm()) {
            $.ajax({
              url: '',
              type: 'POST',
              data: $('#blogForm').serialize(),
              dataType: 'json',
              success: function (data) {

              },
              error: function (error) {

              }
            });
          }
        },
      };
      this.addKeyMap(keyMap);
      /**
       * 加载select2插件
       * 获取所有选项
       */
      $.ajax({
        type: "post",
        url: "tagControl",
        data: {
          "sendMode": "getAllTag"
        },
        dataType: "json",
        success: function (response) {
          var tagSelect = $(tagId);
          for (var i in response) {
            $(tagSelect).append(
              "<option value='" +
              response[i].ID +
              "'>" +
              response[i].Name +
              "</option>"
            );
          }
          /**
           * 在MarkDown富文本插件
           * 与select2插件加载完毕时
           * 判断url是否有？符号且有ID属性
           */
          if (location.href.indexOf("?") != -1 && GetQueryString("ID") != "") {
            /**
             * 获取该博文的所有信息
             */
            $.ajax({
              async: false,
              type: "post",
              url: "blogControl",
              data: {
                "sendMode": "getSelfBlog",
                "ID": GetQueryString("ID")
              },
              dataType: "json",
              success: function (resp) {
                /**
                 * 获取完成后，对内容依次赋值
                 */
                $("#title").val(resp[0].Title);
                $("#Writter").val(resp[0].Writer);
                if (resp[0].isOriginal) {
                  $("#original").attr("checked", "checked");
                  $("#reprinted").removeAttr("checked");
                } else {
                  $("#reprinted").attr("checked", "checked");
                  $("#original").removeAttr("checked");
                }

                var tagsID = resp[0].TagsID.split(",");
                $('#tagId').val(tagsID);
                $('#tagId').trigger('change');

                $("#description").val(resp[0].Description);

                blogEditor.setValue(resp[1].BlogContent);
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
        }
      })
    }
  });

  /**
   * 校验博客表单，标题、标签、描述、内容不能为空
   * @returns {boolean}
   */
  function validateBlogForm() {
    var blogTitle = $('#title').val();
    var blogWritter = $('#Writter').val();
    var BlogImage = $('#sideImage').val();
    var blogContent = blogEditor.getHTML();

    if (isNull(blogTitle)) {
      Toast.fire({
        icon: 'error',
        title: '博客标题不能为空！'
      });
      return false;
    }

    if (isNull(blogWritter)) {
      Toast.fire({
        icon: 'error',
        title: '博客内容作者不能为空！'
      });
      return false;
    }

    if (location.href.indexOf("?") == -1 && GetQueryString("ID") == "") {
      if (isNull(BlogImage) ) {
        Toast.fire({
          icon: 'error',
          title: '博客侧边栏图片不可为空！'
        });
        return false;
      }
    }

    if (isNull(blogContent)) {
      Toast.fire({
        icon: 'error',
        title: '博客内容不能为空！'
      });
      return false;
    }

    return true;
  }

  /**
   * 发布按钮事件
   */
  $('#publishBtn').on('click', function () {
    if (validateBlogForm()) {
      $('#isPublish').val(true);
      $('#blogForm').submit();
    }
    return false;
  });

  /**
   * 保存按钮事件
   */
  // $('#saveBtn').on('click', function () {
  //   if (validateBlogForm()) {
  //     $('#isPublish').val(false);
  //     $('#blogForm').submit();
  //   }
  //   return false;
  // });
  
  
  /**
   * 标题输入框失焦事件
   * 当失焦时，判断是否输入了内容
   * 如果有内容
   * 在#editormd中追加标题
   */
  $("#title").blur(function (e) {
    // 当不是修改模式时
    if (location.href.indexOf("?") == -1 && GetQueryString("ID") == null) {
      if (!isNull($(this).val()) && blogEditor.getValue() == "") {
        blogEditor.insertValue("#" + $(this).val());
      } else if (blogEditor.getValue() != $(this).val()) {
        blogEditor.setValue("");
        blogEditor.insertValue("#" + $(this).val());
      }
    }
  });
  
  /**
   * 判断字符串是否为空
   * @param str
   * @returns {boolean}
   */
  function isNull(str) {
    return str === null || str === undefined || str.trim() === '';
  }

  $("#blogForm").submit(function(e) {
    if (location.href.indexOf("?") != -1 && GetQueryString("ID") != null) {
      $("#ID").val(GetQueryString("ID"));
      var form = new FormData(document.getElementById("blogForm"));
      $.ajax({
        type: "post",
        processData: false,
        contentType: false,
        url: "blogControl?sendMode=mod",
        data: form,
        dataType: "text",
        success: function (resp) {
          if (resp == "true") {
            $('#updComplete').modal('show');
            $('#updComplete').on('hidden.bs.modal', function () {
              location.href = "blog-mgr.jsp";
            })
          } else {
            $('#updFailed').modal('show');
          }
        }
      });
    } else {
      if ($("#sideImage").val() == "") {
          Toast.fire({
              icon: 'error',
              title: '请选择一张图片!'
            });
    	  return false;    	  
      }
      var form = new FormData(document.getElementById("blogForm"));
      $.ajax({
        type: "post",
        processData: false,
        contentType: false,
        url: "blogControl?sendMode=add",
        data: form,
        dataType: "text",
        success: function (response) {
            location.href = "blog-mgr.jsp";
        }
      });
    }
  });

  $("#sideImage").change(function (e) {
    // 获取文件的 HTML5 js 对象
    var files = event.target.files, file;        
    if (files && files.length > 0) {
        // 获取目前上传的文件
        file = files[0];
        // 文件大小校验的操作
        if (file.size > 1024 * 1024 * 16) {
          Toast.fire({
            icon: 'error',
            title: '图片大小不能超过 16 MB!'
          });
          $(this).val('');
          return false;
        }
    }
  });

  // $('#blogForm').submit(function () {
  //   $.ajax({
  //     type: "post",
  //     url: "BlogControl",
  //     data: ,
  //     dataType: "dataType",
  //     success: function (response) {

  //     }
  //   });
  // });


  /**
   * 新增标签按钮事件
   */
  $('#addTagBtn').on('click', function () {
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

  function GetQueryString(name) {
    var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
    var r = window.location.search.substr(1).match(reg);
    if (r != null) return unescape(r[2]);
    return null;
  }
});

