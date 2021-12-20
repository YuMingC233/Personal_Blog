$(function () {
  /**
   * 初始化标签输入框
   */
  $('#tagInput').selectize({
    create: true,
    createOnBlur: true,
    maxItems: 10
  });
});