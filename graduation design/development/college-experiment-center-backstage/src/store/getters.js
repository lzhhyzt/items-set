/**
 * 获取state的数据
 */
export default {
  /*函数名: state => state[types.NAV_SELECTED]*/

  /* xxx: state => {      // state 为函数的参数
    return state[types.NAV_SELECTED]
  }
  ||
  xxx: function (state) {
    return state[types.NAV_SELECTED]
  }
  */
  getIsCollapse: state => state.navIsCollapse,       // 获取导航栏收起或者展开状态

  /**
   * 新闻操作管理
   */
  getNewsListPaging: state => state.newsPagingList,          // 获取查询出来的分页新闻列表
  getOperationNewsIndex: state => state.operationIndex,      // 获取正在操作的新闻的索引ID
  getNewsPrevieDatas: state => state.newsPreviewDatas,    // 获取需要预览的新闻数据

  /**
   * 公告操作管理
   */
  getAnnouncementListPaging: state => state.announcementPagingList,         // 获取分页公告列表
  getOperationAnnouncementIndex: state => state.operationAnnouncementIndex, // 获取正在操作的公告的索引ID
  getAnnouncementPrevieDatas: state => state.announcementPreviewDatas,    // 获取需要预览的新闻数据

  /**
   * 文件资源管理
   */
  getFileListPaging: state => state.FilePagingList,    // 获取获取分页文件列表

  /**
   * 个人中心
   */
  getBaseInfoEditor: state => state.baseInfoEditor,    // 获取个人信息的编辑状态
  getBaseInfoAdd: state => state.baseInfoAdd,    // 获取个人信息的编辑状态

  /**
   * 用户管理
   */
  getFBaseInfoEditor: state => state.fBaseInfoEditor,    // 获取个人信息的编辑状态
  getFBaseInfoAdd: state => state.fBaseInfoAdd,    // 获取个人信息的编辑状态
}
