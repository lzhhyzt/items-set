package com.frame.dao;

import java.util.List;

import com.frame.bean.Announcement;
import com.frame.bean.Pagination;
import com.frame.bean.Time;

public interface AnnouncementDao {
	
	// 公告查询(根据ID)
	public Announcement queryAnnouncementInfoById(int id);
	
	// 公告查询(根据用标题模糊查询)
	public List<Announcement> queryAnnouncementInfoByTitle(String title);
	
	// 公告查询(根据作者模糊查询)
	public List<Announcement> queryAnnouncementInfoByAuthor(String author);
	
	// 公告查询(所有用户)
	public List<Announcement> queryAllAnnouncementInfo();
	
	// 查询所有公告数目
	public int queryAnnouncementNumber();
	
	// 查询指定时间内的新增公告数目
	public int queryAnnouncementNumberInTime(Time time);
	
	// 分页查询公告
	public List<Announcement> queryAnnouncementByPaging(Pagination page);
	
	// 查询指定id的上一条新闻 
	public Announcement queryPreviousAnnouncementById(int id);
	
	// 查询指定id的下一条新闻 
	public Announcement queryNextAnnouncementById(int id);
	
	// 新增公告
	public int insertAnnouncement(Announcement announcement);
	
	// 删除公告(根据ID)
	public int deleteAnnouncementById(int id);
	
	// 删除多条公告
	public int deleteAnnouncementByArray(List<Integer> map);
	
	// 更新公告(根据ID)
	public int updateAnnouncementById(Announcement announcement);
	
	// 更新公告的访问次数
	public int updateAnnouncementVisits(int id);
}
