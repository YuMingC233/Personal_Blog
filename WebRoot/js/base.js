$(".footer").load("template/Foot.jsp .footer > *", "", function (response, status, request) {
    this; // dom element
});

$(".nav-bar-holder").load("template/navBar.jsp .nav-bar-holder > *", "", function (response, status, request) {
    
    // 导航栏搜索框回车事件
    $('#search-input').bind('keypress', function (event) {
        if (event.keyCode === 13) {
            search_by_key();
        }
    });

    // 导航栏搜索栏聚焦事件
    $("#search-input").focus(function () {
        $(".search-s").addClass("search-on"); //改变边框和icon的颜色
        $(".search-icon").addClass("icon-on");
    });

    // 导航栏搜索栏失去焦点事件
    $("#search-input").blur(function () {
        $(".search-s").removeClass("search-on"); //恢复边框和icon的颜色
        $(".search-icon").removeClass("icon-on");
    });

    // 导航栏搜索栏聚焦事件
    $("#search-input-m").focus(function () {
        $(".search-s").addClass("search-on"); //改变边框和icon的颜色
        $(".search-icon").addClass("icon-on");
    });

    // 导航栏搜索栏失去焦点事件
    $("#search-input-m").blur(function () {
        $(".search-s").removeClass("search-on"); //恢复边框和icon的颜色
        $(".search-icon").removeClass("icon-on");
    });

    $(".nb-a").hover(
        function () { // 鼠标移入显示下拉栏
            $(this).next(".nav-ul").stop(true, false).show();
            $(this).addClass('nb-a-hover');
        },
        function () { // 鼠标移出隐藏下拉栏
            $(this).next(".nav-ul").stop(true, false).hide();
            $(this).removeClass('nb-a-hover');
        }
    );

    $(".nav-li").hover(
        function () { // 鼠标移入下拉栏显示下拉栏，并改变下拉栏背景色和字体色
            $(this).parent(".nav-ul").stop(true, false).show();
            $(this).parent(".nav-ul").prev('.nb-a').addClass('nb-a-hover');
            $(this).addClass('li-hover');
        },
        function () { // 鼠标移出下拉栏隐藏下拉栏
            $(this).parent(".nav-ul").stop(true, false).hide();
            $(this).parent(".nav-ul").prev('.nb-a').removeClass('nb-a-hover');
            $(this).removeClass('li-hover');
        }
    );

    // 隐藏/显示移动端侧边栏
    $("#mobile_cate").click(function (event) {
        $("#nav-m-list").delay(100).animate({
            right: '0'
        }, 500);
        $(document).one("click", function () { //对document绑定一个影藏Div方法
            $("#nav-m-list").delay(100).animate({
                right: '-250px'
            }, 500);
        });
        event.stopPropagation(); //阻止事件向上冒泡
        $("#nav-m-list").click(function (event) {
            event.stopPropagation(); //阻止事件向上冒泡
        });
    });

    $("#cancel").click(function () {
        $("#nav-m-list").delay(100).animate({
            right: '-250px'
        }, 500);
    });
});

$("#banner").load("template/index_Banner.jsp", "data", function (response, status, request) {
    this; // dom element
});

$(function () {
    // getParentSort();

    border_change($("#self-Tilte"), 10);
    border_change($("#TopClickTitle"), 10);

    //加载进度条
    paceOptions = {
        ajax: false, // disabled
        document: false, // disabled
        eventLag: false, // disabled
        elements: {
            selectors: ['body']
        }
    };
});

//注销
function logout() {
    $.ajax({
        url: "/admin/login",
        type: 'DELETE',
        headers: {
            'X-CSRFToken': getCsrfToken()
        },
        success: function (data) {
            if (data.code === 1) {
                window.location.href = 'register.html';
            }
        },
        error: function (data) {
            console.log(data);
        }
    });
}

// 关键字搜索
function search_by_key() {
    if ($("#search-input").val() === "" || $("#search-input").val() == null) {
        swal("请输入关键词！");
        return;
    } else {
        if (window.location.pathname != "/MainProject/index.jsp") {
            location.href = "index.jsp";

            var searchKey = $("#search-input").val();

            $.ajax({
                type: "post",
                url: "YuMing Blog Admin/blogControl",
                data: {
                    "sendMode": "search",
                    "data": searchKey
                },
                dataType: "json",
                success: function (resp) {
                    for (const dataKey in resp.data) {
                        var respArr = resp.data[dataKey];
                        getItemToHtml(respArr);
                    }
                    swal("查询完成，结果已经显示在下方列表中！");
                }
            });
        }

        var searchKey = $("#search-input").val();

        $.ajax({
            type: "post",
            url: "YuMing Blog Admin/blogControl",
            data: {
                "sendMode" : "search",
                "data" : searchKey
            },
            dataType: "json",
            success: function (resp) {
                $("#article-holder").html("");
                for (const dataKey in resp) {
                    var respArr = resp[dataKey];
                    getItemToHtml(respArr);
                }
                swal("查询完成，结果已经显示在下方列表中！");
            }
        });
    }
}

function m_search() {
    if ($("#search-input-m").val() === "" || $("#search-input-m").val() == null) {
        swal("请输入关键词！");
        return;
    }
    swal($("#search-input-m").val());
}


/**
 * 标题栏底部边框长度变化动画
 **/
function border_change(obj, length) {
    const old_width = $(obj).width() + 5;
    const changed_width = old_width + length;
    //鼠标移入底部边框增大
    $(obj).mouseenter(
        function () {
            $(this).animate({
                width: changed_width
            });
        });
    //鼠标移出恢复原长度
    $(obj).mouseleave(function () {
        $(this).animate({
            width: old_width
        });
    })
}

/*//获取主类和子类
function getParentSort() {
    $.getJSON('/front/getParentCategory', function (data) {
        $.each(data.parent, function (i, val) {
            $("#category-ul").append('<li class="nav-li ta-c">' +
                '<a href="category.html/' + val.category_name + '">' + val.category_name + '</a>' +
                '</li>');
        });

        $(".nb-a").hover(
            function () {   //鼠标移入显示下拉栏
                $(this).next(".nav-ul").stop(true, false).show();
                $(this).addClass('nb-a-hover');
            }, function () {    //鼠标移出隐藏下拉栏
                $(this).next(".nav-ul").stop(true, false).hide();
                $(this).removeClass('nb-a-hover');
            }
        );

        $(".nav-li").hover(
            function () {   //鼠标移入下拉栏显示下拉栏，并改变下拉栏背景色和字体色
                $(this).parent(".nav-ul").stop(true, false).show();
                $(this).parent(".nav-ul").prev('.nb-a').addClass('nb-a-hover');
                $(this).addClass('li-hover');
            }, function () {    //鼠标移出下拉栏隐藏下拉栏
                $(this).parent(".nav-ul").stop(true, false).hide();
                $(this).parent(".nav-ul").prev('.nb-a').removeClass('nb-a-hover');
                $(this).removeClass('li-hover');
            }
        );

    })
}*/

class LazyImage {
    constructor(selector) {
        // 懒记载图片列表，将伪数组转为数组，以便可以使用数组的api
        this.lazyImages = Array.prototype.slice.call(document.querySelectorAll(selector));
        this.init()
    }

    inViewShow() {
        // 不支持IntersectionObserver api的情况下判断图片是否出现在可视区域内
        let len = this.lazyImages.length;
        for (let i = 0; i < len; i++) {
            let lazyImage = this.lazyImages[i];
            const rect = lazyImage.getBoundingClientRect();
            // 出现在视野的时候加载图片
            if (rect.top < document.documentElement.clientHeight) {
                lazyImage.src = lazyImage.dataset.src;
                // 移除掉已经显示的
                this.lazyImages.splice(i, 1);
                len--;
                i--;
                if (this.lazyImages.length === 0) {
                    // 如果全部都加载完 则去掉滚动事件监听
                    document.removeEventListener('scroll', this._throttleFn)
                }
            }
        }
    }

    throttle(fn, delay = 600, mustRun = 1200) {
        let t_start = null;
        let timer = null;
        let context = this;
        return function () {
            let t_current = +(new Date());
            let args = Array.prototype.slice.call(arguments);
            clearTimeout(timer);
            if (!t_start) {
                t_start = t_current
            }
            if (t_current - t_start > mustRun) {
                fn.apply(context, args);
                t_start = t_current
            } else {
                timer = setTimeout(() => {
                    fn.apply(context, args)
                }, delay)
            }
        }
    }

    init() {
        // 通过IntersectionObserver api判断图片是否出现在可视区域内，不需要监听Scroll来判断
        if ("IntersectionObserver" in window) {
            let lazyImageObserver = new IntersectionObserver((entries, observer) => {
                entries.forEach((entry, index) => {
                    // 如果元素可见
                    if (entry.isIntersecting) {
                        let lazyImage = entry.target;
                        lazyImage.src = lazyImage.dataset.src;
                        lazyImageObserver.unobserve(lazyImage)
                        // this.lazyImages.splice(index, 1)
                    }
                })
            });
            this.lazyImages.forEach(function (lazyImage) {
                lazyImageObserver.observe(lazyImage);
            })
        } else {
            this.inViewShow();
            this._throttleFn = this.throttle(this.inViewShow);
            document.addEventListener('scroll', this._throttleFn)
        }

    }
}

(function (window) {
    var a = function (as) {
        // default value
        var ps = {
            w: 40,
            h: 40,
            dImg: "http://olv6wm3nj.bkt.clouddn.com/18-3-22/16215533.jpg",
            hImg: "http://olv6wm3nj.bkt.clouddn.com/18-3-22/74337023.jpg",
            bt: 40,
            rg: 30,
            s: 300,
            th: 300
        }
        // merge value 
        if (as !== "undefined") {
            for (var key in as) {
                ps[key] = as[key];
            }
        }

        this.as = ps;
        this.init();
    }
    a.prototype.init = function () {
        var data = this.as;
        var d = document.createElement("div");
        d.style.width = data.w + "px";
        d.style.height = data.h + "px";
        d.style.position = "fixed";
        d.style.bottom = data.bt + "px"
        d.style.right = data.rg + "px"
        d.style.cursor = "pointer";
        d.style.backgroundImage = "url(" + data.dImg + ")";
        d.style.backgroundSize = "100%";
        d.style.display = "none";
        d.onmouseenter = function () {
            d.style.backgroundImage = "url(" + data.hImg + ")";
        }
        d.onmouseout = function () {
            d.style.backgroundImage = "url(" + data.dImg + ")";
        }
        document.body.onscroll = function () {
            if (document.documentElement.scrollTop >= data.th) {
                d.style.display = "inline-block";
            } else {
                d.style.display = "none";
            }
        }

        d.onclick = function () {
            var timer = requestAnimationFrame(function fn() {
                var oTop = document.body.scrollTop || document.documentElement.scrollTop;
                if (oTop > 0) {
                    document.body.scrollTop = document.documentElement.scrollTop = oTop - data.s;
                    timer = requestAnimationFrame(fn);
                } else {
                    d.style.display = "none";
                    d.style.backgroundImage = "url(" + data.dImg + ")";
                    cancelAnimationFrame(timer);
                }
            });
        }
        document.body.appendChild(d);
    }
    return window.Top = a;
})(window);

//返回顶部
const top_to = new Top({
    dImg: "./img/up.svg",
    hImg: "./img/up-on.svg"
});

/**
 * 通过传入的BlogInfo json对象对页进行附加
 * @param {传入的BlogInfo json对象} temp 
 */
function getItemToHtml(temp) {
    var modal = "<div class='article-box'>" +
        "<div class='ab-content'>";

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
    modal += "</div>" +
        "<div class='article-detail-box c-666'>" +
        temp.Description +
        "</div>" +
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