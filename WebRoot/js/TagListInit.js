/**
 * @author: Aiden Connor (YuMingC233@gmail.com)
 * @date: 2020-08-24 10:19:24
 * @version: 1.0
 */

var itemArr;
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
                    $("#article-holder").html("");
                    self.dataTotal = dataInfo.data.length;
                    itemArr = sendItemArr(dataInfo);
                    dataLength = itemArr.length;
                }
            });
        }
    });
    

    /**
     * 初始化标签列表
     */
    $.ajax({
        type: "post",
        url: "YuMing Blog Admin/data/Tag.json",
        data: null,
        dataType: "text",
        async: false,
        success: function (resp) {
            var jsonData = JSON.parse(resp);
            for (const key in jsonData) {
                const obj = jsonData[key];
                var tempHTML = "<li class='column-category'>" +
                    "<a class='' href='tag.jsp?ID=" + obj.ID + "'>" +
                    obj.Name + " " + obj.HaveBlogNum + "篇" +
                    "</a>" +
                    "</li>";
                $("#like-box").append(tempHTML);
            }
            $("#like-box > li:first-child > a").addClass("tagListHover");
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
        itemArr: itemArr,
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


    function GetQueryString(name) {
        var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
        var r = window.location.search.substr(1).match(reg);
        if (r != null) return unescape(r[2]);
        return null;
    }
    

    function sendItemArr(dataInfo) {
        var arr = [];
        var TagID = GetQueryString("ID") == null ? "1" : GetQueryString("ID");
        for (let i = 0; i < dataInfo.data.length; i++) {
            const temp = dataInfo.data[i];

            // 当dataInfo.data[i]中没有数据时，返回
            if (temp == null || temp == undefined)
                return;

            // 当单个博文中有出现传入的ID的值时，附加。
            var tempTagID = temp.TagsID.split(",");
            for (const key in tempTagID) {
                var hadID = TagID == tempTagID[key] ? true : false;
                if (hadID) {
                    arr.push(temp);
                    break;
                } else
                    continue;
            }
            continue;
        }
        return arr;
    }
});
// const pagination = new myPagination({
//     id: 'pagination',
//     curPage: 1, //初始页码
//     pageTotal: 199, //总页数
//     pageAmount: 10, //每页多少条
//     dataTotal: 29, //总共多少条数据
//     pageSize: 6, //可选,分页个数
//     //showPageTotalFlag: true, //是否显示数据统计
//     getPage: function (page) {
//         let url = window.location.href;
//         let index = url.indexOf('?');
//         if (index !== -1) {
//             url = url.substring(0, index);
//         }
//         console.log("current page: ", page);
//     }
// });
