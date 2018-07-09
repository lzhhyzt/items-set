// 定义统一请求配置
var requestConfig = {
  baseURL: process.env.API_ROOT,   // 根地址
  timeout: 5000,                   // 超时时间
  responseType: 'json',            // 返回的数据类型
  headers: {                       // 请求头设置
    contentType: 'appliction/json' // 请求提交的数据格式为json
  }
}

let apis = {
  /**
   * 退出登录
   */
  logout: 'user/logout',    // 退出登录

  /**
   * 后台用户管理
   */
  getAllUsers: 'user/getAllUsers',              // 获取所有用户
  getUserDetail: 'user/getUserDetail',          // 获取用户详细信息
  addUserDetail: 'user/addUserDetail',          // 添加新用户及详情
  updateUserDetail: 'user/updateUserDetail',    // 更新用户详细信息
  deleteUserDetail: 'user/deleteUserDetail',    // 删除用户详细信息
  getAllUserSum: 'user/getAllUserSum',          // 获取用户总数

  /**
   * 前台用户管理
   */
  getAllFUsers: 'fuser/getAllFUsers',           // 获取所有前台用户信息
  getAllFUserSum: 'fuser/getAllFUserSum',       // 获取前台用户总数
  deleteFUser: 'fuser/deleteFUser',             // 删除前台用户
  getFUserDetail: 'fuser/getFUserDetail',       // 查询前台用户的详细信息
  addFUserDetail: 'fuser/addFUserDetail',       // 添加用户的详细信息

  /**
   * 新闻管理接口
   */
  getNewsById: 'news/getNewsById',          // 根据ID查询新闻
  getNewsByTitle: 'news/getNewsByTitle',    // 根据标题或者副标题模糊查询新闻
  getNewsByAuthor: 'news/getNewsByAuthor',  // 根据作者模糊查询新闻
  getAllNews: 'news/getAllNews',            // 查询所有新闻
  getNewsNumber: 'news/newsCount',          // 查询新闻总数目
  getNewsCountInTime: 'news/getNewsCountInTime', // 获取指定时间内的新闻数目
  getNewsByPaging: 'news/newsPagination',   // 分页查询新闻
  addNews: 'news/addNews',                  // 添加新闻
  deleteNewsById: 'news/removeNews',        // 删除新闻
  deleteMultiNews: 'news/removeMultiNews',  // 删除多条新闻
  updateNewsById: 'news/updateNews',        // 更新新闻内容
  getImageNews: 'news/getImageNews',        // 查询轮播新闻列表
  getImageNewsById: 'news/getImageNewsById',// 根据id查询轮播新闻信息
  addImageNews: 'news/addImageNews',        // 新增轮播新闻信息

  /**
   * 公告管理接口
   */
  getAnnouncementById: 'announcement/getAnnouncementById',          // 根据ID查询公告
  getAnnouncementByTitle: 'announcement/getAnnouncementByTitle',    // 根据标题模糊查询公告
  getAnnouncementByAuthor: 'announcement/getAnnouncementByAuthor', // 根据作者模糊查询公告
  getAllAnnouncement: 'announcement/getAllAnnouncement',            // 查询所有公告
  getAnnouncementNumber: 'announcement/announcementCount',          // 查询公告总数目
  getAnnouncementsCountInTime: 'announcement/getAnnouncementsCountInTime', // 获取指定时间内的公告数目
  getAnnouncementByPaging: 'announcement/announcementPagination',   // 分页查询公告
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

  /**
   * 实验室管理接口
   */
  getAllLaboratorys: 'laboratory/getAllLaboratorys',                  // 获取所有实验室信息
  getLaboratoryById: 'laboratory/getLaboratoryById',                  // 根据id获取实验室信息
  getLaboratoryByCondition: 'laboratory/getLaboratoryByCondition',    // 根据各种条件获取实验室信息
  getLaboratorysNumber: 'laboratory/getLaboratorysNumber',            // 获取实验室总数
  getLaboratorysByPaging: 'laboratory/getLaboratorysByPaging',        // 获取单个实验室信息
  getLabBookingInfo: 'laboratory/getLabBookingInfo',                  // 获取预订信息
  updateLabBookingInfo: 'laboratory/updateLabBookingInfo',            // 更新预订信息
  getLabBookingInfoByWeek: 'laboratory/getLabBookingInfoByWeek',      // 根据星期查询
  addLaboratory: 'laboratory/addLaboratory',                          // 添加实验室
  removeLaboratoryById: 'laboratory/removeLaboratoryById',            // 删除实验室
  updateLaboratoryById: 'laboratory/updateLaboratoryById',            // 更新实验室
  addPerBooking: 'laboratory/addPerBooking',                          // 插入个人的预订记录
  getPerBooking: 'laboratory/getPerBooking',                          // 查询个人的预订记录
  removePerBooking: 'laboratory/removePerBooking',                    // 删除个人的预订记录
  getAllBookingUsers: 'laboratory/getAllBookingUsers',                // 查询所有有预订实验室的用户

  /**
   * 系统设置
   */
  getThemeById: 'setting/getThemeById',     // 获取主题色
  updateTheme: 'setting/updateTheme',        // 更新主题色



}

export {requestConfig, apis}
