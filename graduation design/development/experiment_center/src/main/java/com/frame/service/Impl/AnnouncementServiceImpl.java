package com.frame.service.Impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.frame.bean.Announcement;
import com.frame.bean.Pagination;
import com.frame.bean.Time;
import com.frame.dao.AnnouncementDao;
import com.frame.service.AnnouncementService;

@Service("announcementService") 
public class AnnouncementServiceImpl implements AnnouncementService {
	
	@Resource
	private AnnouncementDao announcementDao; 
	
	// 公告查询(根据ID)
	@Override
	public Announcement getAnnouncementInfoById(int id) {
		return announcementDao.queryAnnouncementInfoById(id);
	}
	
	// 公告查询(根据用标题模糊查询)
	@Override
	public List<Announcement> getAnnouncementInfoByTitle(String title) {
		return announcementDao.queryAnnouncementInfoByTitle(title);
	}
	
	// 公告查询(根据作者模糊查询)
	@Override
	public List<Announcement> getAnnouncementInfoByAuthor(String author) {
		return announcementDao.queryAnnouncementInfoByAuthor(author);
	}
	
	// 公告查询(所有用户)
	@Override
	public List<Announcement> getAllAnnouncementInfo() {
		return announcementDao.queryAllAnnouncementInfo();
	}
	
	// 查询新闻的总用户数
	@Override
	public int getAnnouncementNumber() {
		return announcementDao.queryAnnouncementNumber();
	}
	
	// 查询指定时间内的新增公告数目
	public int getAnnouncementNumberInTime(Time time) {
		return announcementDao.queryAnnouncementNumberInTime(time);
	}
	
	// 分页查询
	@Override
	public List<Announcement> getAnnouncementByPaging(Pagination page) {
		return announcementDao.queryAnnouncementByPaging(page);
	}
	
	// 查询指定id的上一条新闻 
	public Announcement getPreviousAnnouncementById(int id) {
		return announcementDao.queryPreviousAnnouncementById(id);
	}
	
	// 查询指定id的下一条新闻 
	public Announcement getNextAnnouncementById(int id) {
		return announcementDao.queryNextAnnouncementById(id);
	}

	// 新增公告
	@Override
	public int addAnnouncement(Announcement announcement) {
		return announcementDao.insertAnnouncement(announcement);
	}
	
	// 删除公告(根据ID)
	@Override
	public int removeAnnouncementById(int id) {
		return announcementDao.deleteAnnouncementById(id);
	}
	
	// 更新公告(根据ID)
	@Override
	public int updateAnnouncementById(Announcement announcement) {
		return announcementDao.updateAnnouncementById(announcement);
	}
	
	// 移除多条记录
	@Override
	public int removeAnnouncementByArray(List<Integer> map) {
		return announcementDao.deleteAnnouncementByArray(map);
	}

	// 更新公告的访问次数
	@Override
	public int updateAnnouncementVisits(int id) {
		return announcementDao.updateAnnouncementVisits(id);
	}

}
