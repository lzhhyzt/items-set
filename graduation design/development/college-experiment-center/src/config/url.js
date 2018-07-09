// 定义统一请求配置
var requestConfig = {
  baseURL: process.env.API_ROOT,   // 根地址
  timeout: 8000,                                         // 超时时间
  responseType: 'json',                                  // 返回的数据类型
  headers: {                                             // 请求头设置
    contentType: 'appliction/json'                    // 请求提交的数据格式为json
  }
}

let apis = {
  /**
   * 登录接口
   */
  getIdentifyCode: 'user/fGetIdentifyCode',         // 获取验证码
  login: 'user/flogin',                             // 用户登录
  logout: 'user/flogout',                           // 用户退出登录
  getFUserInfoByName: 'fuser/getFUserInfoByName',   // 查询用户详情
  getFUserDetail: 'fuser/getFUserDetail',           // 查询用户的详细信息
  updateFUserDetails: 'fuser/updateFUserDetails',   // 更新个人信息详情
  updateFUserRealname: 'fuser/updateFUserRealname', // 更改用户的真实姓名


  /**
   * 新闻管理接口
   */
  getNewsById: 'news/getNewsById',                    // 根据ID查询新闻
  getNewsByTitle: 'news/getNewsByTitle',              // 根据标题或者副标题模糊查询新闻
  getNewsByAuthor: 'news/getNewsByAuthor',            // 根据作者模糊查询新闻
  getAllNews: 'news/getAllNews',                      // 查询所有新闻
  getNewsNumber: 'news/newsCount',                    // 查询新闻总数目
  getNewsByPaging: 'news/newsPagination',             // 分页查询新闻
  getPreviousOrNextNews: 'news/getPreviousOrNextNews',// 根据id查询上一条或者是下一条新闻
  addNews: 'news/addNews',                            // 添加新闻
  deleteNewsById: 'news/removeNews',                  // 删除新闻
  deleteMultiNews: 'news/removeMultiNews',            // 删除多条新闻
  updateNewsById: 'news/updateNews',                  // 更新新闻内容
  getImageNews: 'news/getImageNews',                  // 图片新闻信息

  /**
   * 公告管理接口
   */
  getAnnouncementById: 'announcement/getAnnouncementById',          // 根据ID查询公告
  getAnnouncementByTitle: 'announcement/getAnnouncementByTitle',    // 根据标题模糊查询公告
  getAnnouncementByAuthor: 'announcement/getAnnouncementByAuthor', // 根据作者模糊查询公告
  getAllAnnouncement: 'announcement/getAllAnnouncement',            // 查询所有公告
  getAnnouncementNumber: 'announcement/announcementCount',          // 查询公告总数目
  getAnnouncementByPaging: 'announcement/announcementPagination',   // 分页查询公告
  getPreviousOrNextAnnouncement: 'announcement/getPreviousOrNextAnnouncement',
  addAnnouncement: 'announcement/addAnnouncement',                  // 添加公告
  deleteAnnouncementById: 'announcement/removeAnnouncement',        // 删除公告
  deleteMultiAnnouncement: 'announcement/removeMultiAnnouncement',  // 删除多条公告
  updateAnnouncementById: 'announcement/updateAnnouncement',        // 更新公告内容

  /**
   * 文档管理接口
   */
  authToken: 'file/authToken',                      // 获取验证码
  getAllFiles: 'file/getAllFiles',                  // 获取所有文件信息
  getFileById: 'file/getFileById',                  // 根据ID查询文件信息
  addFileInfo: 'file/addFileInfo',                  // 上传文件时添加文件信息
  getFileByName: 'file/getFileByName',              // 根据文件名模糊查询
  getFilesNumber: 'file/getFilesNumber',            // 获取文件总数
  getFilesByPaging: 'file/getFilesByPaging',        // 分页获取文件列表
  removeFileById: 'file/removeFileById',            // 移除数据库指定id的文件资源
  removeMultiFiles: 'file/removeMultiFiles',        // 批量删除指定id的文件资源
  updateFileDownload: 'file/updateFileDownload',    // 更新文件的下载次数

  /**
   * 浏览记录接口
   */
  getAllRecords: 'record/getAllRecords',          // 查询所有的浏览记录
  addRecord: 'record/addRecord',                  // 增加浏览历史记录

  /**
   * 系统设置接口
   */
  getThemeById: 'setting/getThemeById',           // 获取主题色

  /**
   * 实验室
   */
  getAllLaboratorys: 'laboratory/getAllLaboratorys',                  // 获取所有实验室信息
  getLaboratoryById: 'laboratory/getLaboratoryById',                  // 根据id获取实验室信息
  getLaboratoryByCondition: 'laboratory/getLaboratoryByCondition',    // 根据各种条件获取实验室信息
  getLaboratorysNumber: 'laboratory/getLaboratorysNumber',            // 获取实验室总数
  getLaboratorysByPaging: 'laboratory/getLaboratorysByPaging',        // 获取单个实验室信息
  getLabBookingInfo: 'laboratory/getLabBookingInfo',                  // 获取预订信息
  updateLabBookingInfo: 'laboratory/updateLabBookingInfo',            // 更新预订信息
  getLabBookingInfoByWeek: 'laboratory/getLabBookingInfoByWeek',      // 根据星期查询
  addPerBooking: 'laboratory/addPerBooking',                          // 插入个人的预订记录
  getPerBooking: 'laboratory/getPerBooking',                          // 查询个人的预订记录
  removePerBooking: 'laboratory/removePerBooking',                    // 删除个人的预订记录


}

export {requestConfig, apis}
