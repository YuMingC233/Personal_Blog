/**
 * @author: Aiden Connor (YuMingC233@gmail.com)
 * @date: 2020-08-23 16:55:00
 * @version: 1.0
 */
$(function () {  
    var dataLength = 0;

    /**
     * 初始化列表
     * 从两个json文件中获取信息
     */
    $.ajax({
        type: "post",
        url: "YuMing Blog Admin/blogControl",
        data: {
            "sendMode": "findAll"
        },
        dataType: "text",
        async: false,
        success: function (resp) {
            /**
             * 获取博文基本信息
             * （标题、Tag、阅读数、评论数、作者、发布时间）
             */
            $.ajax({
                url: "YuMing Blog Admin/data/BlogInfo.json",
                data: null,
                async: false,
                dataType: "json",
                success: function (dataInfo) {
                    dataLength = dataInfo.data.length;
                    $("#article-holder").html("");
                    self.dataTotal = dataInfo.data.length;
                    for (let i = 0; i < 10; i++) {
                        const temp = dataInfo.data[i];

                        // 当dataInfo.data[i]中没有数据时，返回
                        if (temp == undefined) 
                            return;

                        getItemToHtml(temp);
                    }
                }
            });
        }
    });

    /**
     * 依据上面获取的json数组长度
     * 设置全局变量以便分页器调用
     * 该变量为总页数
     */
    var pageAmount = (dataLength % 10) == 0 ?
        Math.ceil(dataLength / 10) : parseInt(dataLength / 10) + 1;

    /**
     * 分页器
     */
    const pagination = new myPagination({
        id: 'pagination',
        curPage: 1, //初始页码
        pageTotal: pageAmount, //总页数
        pageAmount: 10, //每页多少条
        dataTotal: dataLength, //总共多少条数据
        pageSize: 6, //可选,分页个数
        //showPageTotalFlag: true, //是否显示数据统计
        //showSkipInputFlag: true, //是否支持跳转
        getPage: function (page) {}
    });

    /**
     * 对日期格式化为yyyy-mm-dd格式
     * @param {传入的日期对象参数} date 
     */
    function formatDate(date) {
        var d = new Date(date),
            month = '' + (d.getMonth() + 1),
            day = '' + d.getDate(),
            year = d.getFullYear();

        if (month.length < 2)
            month = '0' + month;
        if (day.length < 2)
            day = '0' + day;

        return [year, month, day].join('-');
    }

    /**
     * 动态获取点击量排行榜
     */
    $.ajax({
        type: "post",
        url: "YuMing Blog Admin/blogControl",
        data: {
            "sendMode": "getTop10",
        },
        dataType: "json",
        success: function (respTopObj) {
            for (const key in respTopObj) {
                const temp = respTopObj[key];
                var HTMLstr = 
                "<li class='column-category'>"+
                    "<a href='article.jsp?PublishTime="+temp.PublishTime+"'"+
                    " target='_blank'>" + temp.Title + "</a>" +
                "</li>";
                $("#like-box").append(HTMLstr);
            }
        }
    });


    /**
     * 通过传入的json对象对页进行附加
     * @param {传入的json对象} temp 
     */
    function getItemToHtml(temp) {
        var modal = "<div class='article-box'>" +
            "<div class='ab-content'>";

        var tempText = null;

        /**
         * 通过PublishTime获取对应图片
         */
        $.ajax({
            url: "YuMing Blog Admin/data/BlogArticle.json",
            data: null,
            async: false,
            dataType: "json",
            success: function (dataArticle) {
                for (const keyArticle in dataArticle.data) {
                    if (dataArticle.data[keyArticle].PublishTime == temp.PublishTime) {
                        modal += "<a href='article.jsp?PublishTime=" + temp.PublishTime + "' class='article-img-box' target='_blank'>" +
                            "<img class='lazy-image article-img' " +
                            " data-src='img/" + dataArticle.data[keyArticle].BlogImageName + "' alt=''" +
                            " src='img/" + dataArticle.data[keyArticle].BlogImageName + "'>" +
                            // 文章图片
                            "</a>";
                            tempText = dataArticle.data[keyArticle].BlogContent;
                    }
                }
            }
        });

        modal +=
            "<div class='article-title'>" +
            "<a href='article.jsp?PublishTime=" + temp.PublishTime + "' target='_blank'>" + temp.Title + "</a>" + // 文章标题
            "</div>" +
            "<div class='article-cate'>"; // 文章tag

        var insideData = temp.TagsID.split(",");

        /**
         * 通过TagID获取对应Tag名称
         */
        $.ajax({
            type: "post",
            url: "YuMing Blog Admin/data/Tag.json",
            data: null,
            dataType: "json",
            async: false,
            success: function (respTag) {
                for (const keyTag in respTag) {

                    for (const keyTemp in insideData) {

                        if (respTag[keyTag].ID == insideData[keyTemp]) {
                            modal += "<a href='tag.jsp?ID=" + respTag[keyTag].ID + "'>" + respTag[keyTag].Name + "</a>";
                        }
                    }
                }
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

        var d = new Date(temp.PublishTime);
        modal += "</div>";
        if (temp.Description == "" || temp.Description == null) {
            modal += "<div class='article-detail-box c-666'>" +
                tempText +
                "</div>";
        } else {
            modal += "<div class='article-detail-box c-666'>" +
                temp.Description +
                "</div>";
        }
            
        modal +=
            "<span class='article-tail-box'>" +
            "<i class='fl' style='background-image: url(https://zhaoyangkun.gitee.io/blog-static/img/read-index.svg)'></i>" +
            "<span class='read-number c-999 fl'>" + temp.ReadNum + "</span>" + // 阅读数量
            "<i class='fl' style='background-image: url(https://zhaoyangkun.gitee.io/blog-static/img/comment-index.svg)'></i>" +
            "<span class='comment-number c-999 fl'>" + temp.CommentNum + "</span>" + // 评论数量
            "<span class='article-date c-999'>" + formatDate(d) + "</span>" + //文章发布时间
            "<span class='article-author one-line-overflow c-999'>" + temp.Writer + "</span>" + // 文章作者
            "</span>" +
            "</div>" +
            "</div>";
        $("#article-holder").append(modal);
    }
});