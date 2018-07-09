package com.frame.service.Impl;

import java.util.List;
import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.frame.bean.ImageNews;
import com.frame.bean.News;
import com.frame.bean.Pagination;
import com.frame.bean.Time;
import com.frame.dao.NewsDao;
import com.frame.service.NewsService;

@Service("newsService") 
public class NewsServiceImpl implements NewsService {
	
	@Resource
	private NewsDao newsDao;
	
	// 新闻查询(根据ID)
	@Override
	public News getNewsInfoById(int id) {
		return newsDao.queryNewsInfoById(id);
	}
	
	// 新闻查询(根据用标题模糊查询)
	@Override
	public List<News> getNewsInfoByTitle(String title) {
		return newsDao.queryNewsInfoByTitle(title);
	}
	
	// 新闻查询(根据作者模糊查询)
	@Override
	public List<News> getNewsInfoByAuthor(String author) {
		return newsDao.queryNewsInfoByAuthor(author);
	}
	
	// 新闻查询(所有用户)
	@Override
	public List<News> getAllNewsInfo() {
		return newsDao.queryAllNewsInfo();
	}
	
	// 查询新闻的总用户数
	@Override
	public int getNewsNumber() {
		return newsDao.queryNewsNumber();
	}
	
	// 查询指定时间内的新闻数
	public int getNewsNumberInTime(Time time) {
		return newsDao.queryNewsNumberInTime(time);
	}
	
	// 分页查询
	@Override
	public List<News> getNewsByPaging(Pagination page) {
		return newsDao.queryNewsByPaging(page);
	}
	
	// 查询指定id的上一条新闻 
	@Override
	public News getPreviousNewsById(int id) {
		return newsDao.queryPreviousNewsById(id);
	}
	
	// 查询指定id的下一条新闻 
	@Override
	public News getNextNewsById(int id) {
		return newsDao.queryNextNewsById(id);
	}
	
	// 查询最后一条新闻
	public News getLastNews() {
		return newsDao.queryLastNews();
	}
	
	// 新增新闻
	@Override
	public int addNews(News news) {
		return newsDao.insertNews(news); // 返回受影响行数
	}
	
	// 删除新闻(根据ID)
	@Override
	public int removeNewsById(int id) {
		return newsDao.deleteNewsById(id);// 返回受影响行数
	}
	
	// 删除多条新闻
	@Override
	public int removeNewsByArray(List<Integer> map) {
		return newsDao.deleteNewsByArray(map);
	}
	
	// 更新新闻(根据ID)
	@Override
	public int updateNewsById(News news) {
		return newsDao.updateNewsById(news);// 返回受影响行数

	}
	
	// 更新新闻的访问点击次数
	@Override
	public int updateNewsVisits(int id) {
		return newsDao.updateNewsVisits(id);
	}
	
	// 查询图片新闻对应的图片信息
	public List<ImageNews> getImageNews() {
		return newsDao.queryImageNews();
	}
	
	// 根据新闻id查询轮播新闻对应的图片信息
	public ImageNews getImageNewsById(int nId) {
		return newsDao.queryImageNewsById(nId);
	}
	
	// 插入轮播新闻对应的信息
	public int addImageNews(ImageNews imageNews) {
		return newsDao.insertImageNews(imageNews);
	}
	
	// 更新轮播图片对应的信息
	public int updateImageNews(ImageNews imageNews) {
		return newsDao.updateImageNews(imageNews);
	}

}
