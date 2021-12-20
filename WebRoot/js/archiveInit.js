/**
 * @author: Aiden Connor (YuMingC233@gmail.com)
 * @date: 2020-08-24 15:27:41
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
             * 找到对应的时间并附加
             * （标题、Tag、阅读数、评论数、作者、发布时间）
             */
            $.ajax({
                url: "YuMing Blog Admin/data/BlogInfo.json",
                data: null,
                async: false,
                dataType: "json",
                success: function (dataInfo) {
                    $(".achieve-box").html("");
                    for (let i = 0; i < dataInfo.data.length; i++) {
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
 * 通过传入的json对象对页进行附加
 * @param {传入的json对象} temp 
 */
var year = null;
var month = null;
var item = null;
var account = 0; 
function getItemToHtml(temp) {
    var d = new Date(temp.PublishTime);
    var strDate = formatDate(d);
    var dateArr = strDate.split("-");

    if (dateArr[0] != year || dateArr[1] != month) {
        year = dateArr[0];
        month = dateArr[1];
        var titleHTML =
            "<li class='year'>" +
                year + "年 " + month + "月 <span style='color: #3aa4ff'>" + getYMCount(year, month) + "</span> 篇" +
            "</li>";
        item = 
        "<li class='detail-item'>"+
            "<span class='date'>" + (dateArr[1] + "-" + dateArr[2]) + "</span>" +
            "<a href='article.jsp?PublishTime=" + temp.PublishTime + "' target='_blank' class='title'>" + temp.Title + "</a>" +
        "</li>";
        $(".achieve-box").prepend(titleHTML);
        $(".achieve-box").append(item);
        return true;
    } else {
        item =
        "<li class='detail-item'>" +
            "<span class='date'>" + (dateArr[1] + "-" + dateArr[2]) + "</span>" +
            "<a href='article.jsp?PublishTime=" + temp.PublishTime + "' target='_blank' class='title'>" + temp.Title + "</a>" +
        "</li>";
        $(".achieve-box").append(item);
        return false;
    }
}

/**
 * 根据传入的年份与月份确认当月文章数量
 * @param {需确认的年份} year 
 * @param {需确认的月份} month 
 */
function getYMCount(yearParam, monthParam) {
    var count = 0;
    /**
     * 获取博文基本信息
     * 找到对应的时间并附加
     * （标题、Tag、阅读数、评论数、作者、发布时间）
     */
    $.ajax({
        url: "YuMing Blog Admin/data/BlogInfo.json",
        data: null,
        async: false,
        dataType: "json",
        success: function (dataInfo) {
            for (let i = 0; i < dataInfo.data.length; i++) {
                const temp = dataInfo.data[i];
                var d = new Date(temp.PublishTime);
                var strDate = formatDate(d);
                var dateArr = strDate.split("-");
                
                if (dateArr[0] == yearParam && dateArr[1] == monthParam) {
                    count++;
                }
            }
        }
    });
    return count;
}