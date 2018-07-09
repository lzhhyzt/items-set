
const mutations = {
  /**
   * 修改tooken等信息
   */
  setUserinfo (state, payload) {
    state.accessToken = payload.accessToken
    state.csUserId = payload.csUserId
    state.username = payload.username
    state.name = payload.name
  },

  /**
   * 修改导航框收起展开的状态
   * @param {any} state
   */
  setIsCollapse (state, value) {
    if (value == true) {
      state.navIsCollapse = false
    } else {
      state.navIsCollapse = true
    }
  },

  /**
   * 新闻操作：修改当前正在操作的新闻的索引：1-新增/2-编辑
   */
  setOperationNewsIndex (state, payload) {
    state.operationNewsIndex = payload
  },
  /**
   * 新闻操作：修改新闻列表
   */
  setNewsList (state, list) {
    state.newsPagingList = list
  },
  /**
   * 新闻操作：新闻预览
   */
  setNewsPreviewDatas (state, payload) {
    state.newsPreviewDatas = payload
  },

  /**
   * 公告操作：修改当前正在操作的公告的索引：1-新增/2-编辑
   */
  setOperationAnnouncementIndex (state, payload) {
    state.operationAnnouncementIndex = payload
  },
  /**
   * 公告操作：修改公告列表
   */
  setAnnouncementList (state, list) {
    state.announcementPagingList = list
  },
  /**
   * 公告操作：公告预览
   */
  setAnnouncementPreviewDatas (state, payload) {
    state.announcementPreviewDatas = payload
  },

  /**
   * 文件资源操作：修改文件资源列表
   */
  setFileList (state, list) {
    state.FilePagingList = list
  },

  /**
   * 个人中心操作：允许修改个人信息
   */
  setBaseInfoEditor (state, status) {
    state.baseInfoEditor = status
  },

  /**
   * 个人中心操作：显示添加或者查看面板
   */
  setBaseInfoAdd (state, val) {
    state.baseInfoAdd = val
  },

  /**
   * 用户管理：允许修改个人信息
   */
  setFBaseInfoEditor (state, status) {
    state.fBaseInfoEditor = status
  },

  /**
   * 用户管理：显示添加或者查看面板
   */
  setFBaseInfoAdd (state, val) {
    state.fBaseInfoAdd = val
  }
}

export default mutations
