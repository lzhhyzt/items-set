package com.frame.dao;

import java.util.List;

import com.frame.bean.ImageNews;
import com.frame.bean.News;
import com.frame.bean.Pagination;
import com.frame.bean.Time;

public interface NewsDao {
	
	// 新闻查询(根据ID)
	public News queryNewsInfoById(int id);
	
	// 新闻查询(根据用标题模糊查询)
	public List<News> queryNewsInfoByTitle(String title);
	
	// 新闻查询(根据作者模糊查询)
	public List<News> queryNewsInfoByAuthor(String author);
	
	// 新闻查询(所有用户)
	public List<News> queryAllNewsInfo();
	
	// 查询所有新闻数目
	public int queryNewsNumber();
	
	// 查询指定时间内的新闻数
	public int queryNewsNumberInTime(Time time);
	
	// 分页查询新闻
	public List<News> queryNewsByPaging(Pagination page);
	
	// 查询指定id的上一条新闻 
	public News queryPreviousNewsById(int id);
	
	// 查询指定id的下一条新闻 
	public News queryNextNewsById(int id);
	
	// 查询最后一条新闻
	public News queryLastNews();
	
	// 新增新闻
	public int insertNews(News news);
	
	// 删除新闻(根据ID)
	public int deleteNewsById(int id);
	
	// 删除多条新闻
	public int deleteNewsByArray(List<Integer> map);
	
	// 更新新闻(根据ID)
	public int updateNewsById(News news);
	
	// 更新新闻的访问点击次数
	public int updateNewsVisits(int id);
	
	// 查询轮播新闻对应的图片信息
	public List<ImageNews> queryImageNews();
	
	// 根据新闻id查询轮播新闻对应的图片信息
	public ImageNews queryImageNewsById(int nId);
	
	// 插入轮播新闻对应的信息
	public int insertImageNews(ImageNews imageNews);
	
	// 更新轮播图片对应的信息
	public int updateImageNews(ImageNews imageNews);
}
