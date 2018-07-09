package com.frame.service;

import java.util.List;

import com.frame.bean.ImageNews;
import com.frame.bean.News;
import com.frame.bean.Pagination;
import com.frame.bean.Time;

public interface NewsService {
	
	// 新闻查询(根据ID)
	public News getNewsInfoById(int id);
	
	// 新闻查询(根据用标题模糊查询)
	public List<News> getNewsInfoByTitle(String title);
	
	// 新闻查询(根据作者模糊查询)
	public List<News> getNewsInfoByAuthor(String author);
	
	// 新闻查询(所有用户)
	public List<News> getAllNewsInfo();
	
	// 查询所有新闻数目
	public int getNewsNumber();
	
	// 查询指定时间内的新闻数
	public int getNewsNumberInTime(Time time);
	
	// 分页查询新闻
	public List<News> getNewsByPaging(Pagination page);
	
	// 查询指定id的上一条新闻 
	public News getPreviousNewsById(int id);
	
	// 查询指定id的下一条新闻 
	public News getNextNewsById(int id);
	
	// 查询最后一条新闻
	public News getLastNews();
	
	// 新增新闻
	public int addNews(News news);
	
	// 删除新闻(根据ID)
	public int removeNewsById(int id);
	
	// 删除多条新闻
	public int removeNewsByArray(List<Integer> map);
	
	// 更新新闻(根据ID)
	public int updateNewsById(News news);
	
	// 更新新闻的访问点击次数
	public int updateNewsVisits(int id);
	
	// 查询图片新闻对应的图片信息
	public List<ImageNews> getImageNews();
	
	// 根据新闻id查询轮播新闻对应的图片信息
	public ImageNews getImageNewsById(int nId);
	
	// 插入轮播新闻对应的信息
	public int addImageNews(ImageNews imageNews);
	
	// 更新轮播图片对应的信息
	public int updateImageNews(ImageNews imageNews);
}
