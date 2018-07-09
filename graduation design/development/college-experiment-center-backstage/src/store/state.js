const state = {
  /**
   * 导航栏
   */
  navIsCollapse: false,

  /**
   * 新闻操作
   */
  newsPagingList: [],          // 新闻列表
  operationNewsIndex: {},      // 正在编辑新闻的索引ID
  newsPreviewDatas: {},        // 需要预览的新闻内容

  /**
   * 公告操作
   */
  announcementPagingList: [],      // 公告列表
  operationAnnouncementIndex: {},  // 正在编辑公告的索引ID
  announcementPreviewDatas: {},             // 需要预览的公告内容

  /**
   * 资源管理
   */
  FilePagingList: [],

  /**
   * 个人中心
   */
  baseInfoEditor: false,
  baseInfoAdd: '0',

  /**
   * 用户管理
   */
  fBaseInfoEditor: false,
  fBaseInfoAdd: '0'


  /*
  appKey: 'e21c13e0-b57a-49f1-985b-01af30232e1a',
  ticket: 'DC601D83-872A-4242-A0E2-95AFA42444486',
  source: '65514',
  sign: 'nosign',
  */
}

/*let userInfo = JSON.parse(sessionStorage.getItem('userinfo'))
state.accessToken = userInfo ? userInfo.accessToken : 'T0ebbcfa630574166a884a392aac91526'
state.name = userInfo ? userInfo.name : ''
state.csUserId = userInfo ? userInfo.csUserId : ''
state.username = userInfo ? userInfo.username : ''*/

export default state
