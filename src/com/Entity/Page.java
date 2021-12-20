/**  
 * @Title: Page.java
 * @Package com.Entity
 * @Description: TODO(分页JavaBean)
 * @author Connor YuMingC233@gmail.com
 * @date 2020年8月17日 下午5:40:08
 * @version V1.0  
 * */
package com.Entity;

/**
 * @ClassName: Page
 * @Description: TODO(分页实体类)
 * @author Connor YuMingC233@gmail.com
 * @date 2020年8月17日 下午5:40:08
 *
 * */
public class Page {
    private int currPage = 1;   		// 当前页码，默认为1,但需要减去1
    private int pageSize;    	  		// 每页显示数
    private int totalCount;       		// 记录总数
    private int totalPageCount;   		// 总页数
    
//  private List<News> newsList;             每页新闻集合
//  private List<NewsTopic> newsTopicList;   每页新闻集合
	
	public Page() {}

	/**
	 * @param currPage
	 * @param pageSize
	 * @param totalCount
	 * @param totalPageCount
	 */
	public Page(int currPage, int pageSize, int totalCount) {
		this.currPage = currPage;
		this.pageSize = pageSize;
		setTotalCount(totalCount);
	}

	/**
	 * @return the currPageNo
	 */
	public int getCurrPage() {
		return currPage;
	}

	/**
	 * @param currPageNo the currPageNo to set
	 */
	public void setCurrPage(int currPageNo) {
		this.currPage = currPageNo;
	}

	/**
	 * @return the pageSize
	 */
	public int getPageSize() {
		return pageSize;
	}

	/**
	 * @param pageSize the pageSize to set
	 */
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	/**
	 * @return the totalCount
	 */
	public int getTotalCount() {
		return totalCount;
	}

	/**
	 * @param totalCount the totalCount to set
	 */
	public void setTotalCount(int totalCount) {
		if (totalCount > 0) {
			this.totalCount = totalCount;
			this.totalPageCount =
				(totalCount % pageSize) == 0 ?	
					(totalCount / pageSize) // 如果信息总条数 / pageSize 的余数为0，将总页数设置为相除的商
				:
					(totalCount / pageSize) + 1 // 反之则将总页数加1
			;
		}
	}

	/**
	 * @return the totalPageCount
	 */
	public int getTotalPageCount() {
		return totalPageCount;
	}

	/**
	 * @param totalPageCount the totalPageCount to set
	 */
	public void setTotalPageCount(int totalPageCount) {
		this.totalPageCount = totalPageCount;
	}

	
}
