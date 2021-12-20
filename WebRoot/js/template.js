/**
 * @author: Aiden Connor (YuMingC233@gmail.com)
 * @date: 2020-08-14 11:48:45
 * @version: 1.0
 */
$(".footer").load("template/Foot.jsp .footer > *", "data", function (response, status, request) {
    this; // dom element
});

$(".nav-bar-holder").load("template/navBar.jsp .nav-bar-holder > *", "data", function (response, status,
    request) {

});

$("#banner").load("template/index_Banner.jsp", "data", function (response, status, request) {
    this; // dom element
});