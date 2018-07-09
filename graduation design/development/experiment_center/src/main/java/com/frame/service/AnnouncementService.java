package com.frame.service;

import java.util.List;

import com.frame.bean.Announcement;
import com.frame.bean.Pagination;
import com.frame.bean.Time;

public interface AnnouncementService {
	
	// 公告查询(根据ID)
	public Announcement getAnnouncementInfoById(int id);
	
	// 新闻查询(根据用标题模糊查询)
	public List<Announcement> getAnnouncementInfoByTitle(String title);
	
	// 新闻查询(根据作者模糊查询)
	public List<Announcement> getAnnouncementInfoByAuthor(String author);
	
	// 公告查询(所有用户)
	public List<Announcement> getAllAnnouncementInfo();
	
	// 查询所有新闻数目
	public int getAnnouncementNumber();
	
	// 查询指定时间内的新增公告数目
	public int getAnnouncementNumberInTime(Time time);
	
	// 分页查询新闻
	public List<Announcement> getAnnouncementByPaging(Pagination page);
	
	// 查询指定id的上一条新闻 
	public Announcement getPreviousAnnouncementById(int id);
	
	// 查询指定id的下一条新闻 
	public Announcement getNextAnnouncementById(int id);
	
	// 新增公告
	public int addAnnouncement(Announcement announcement);
	
	// 删除公告(根据ID)
	public int removeAnnouncementById(int id);
	
	// 删除多条新闻
	public int removeAnnouncementByArray(List<Integer> map);
	
	// 更新公告(根据ID)
	public int updateAnnouncementById(Announcement announcement);
	
	// 更新公告的访问次数
	public int updateAnnouncementVisits(int id);
}
