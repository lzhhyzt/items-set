<template>
  <div class="userList" :style="userListNewStyle">
    <div class="userList__head">
      您当前所在的位置：实验室管理 > 用户预订列表
    </div>
    <div class="userList__body">
      <div class="userList__body-left">
        <div class="userList__body-search">
          <input type="text" placeholder="请输入用户名" v-model="searchValue">
          &nbsp;
          <el-button type="primary" size="mini" icon="el-icon-search">搜索</el-button>
        </div>
        <!-- 用户预订列表 -->
        <ul class="list-ul">
          <li class="list-ul-li" v-for="item in labList" :key="item">
            <div class="li-div1">
              <router-link :to="{ path: '/laboratory/userList/bookingDetail', query:{ name: item} }" @click="labdetail(item)">{{ item }}</router-link>
            </div>
          </li>
        </ul>

        <!-- 分页 -->
        <!--
        <div class="slb-pagination" v-show="isShow">
          <div class="slb-pagination-block">
            <el-pagination
              @size-change="handleSizeChange"
              @current-change="handleCurrentChange"
              :current-page="currentPage"
              :page-sizes="paseSizeAll"
              :page-size="pageSize"
              layout="total, sizes, prev, pager, next, jumper"
              :total="listNumber">
            </el-pagination>
          </div>
        </div>
        -->

      </div>
      <div class="userList__body-right" v-if="$route.query.name">
        <router-view></router-view>
      </div>
      <div class="userList__body-right" v-else>
        <nothing></nothing>
      </div>
    </div>
  </div>
</template>

<script>
import { apis } from '../../../config/url.js'
import $http from '../../../module/axios.js'
import Nothing from './nothing.vue'
import Cookie from '../../../module/cookie.js'
import { mapGetters, mapMutations } from 'vuex'

export default {
  name: 'userList',
  components: {
    Nothing
  },
  data () {
    return {
      userListNewStyle: {}, // 类元素新增样式
      activeNames: ['1'],
      labList: [],        // 实验室列表
      isShow: true,
      searchValue: '',
      floor: '',
      usage: '',
      vacant: '',
      currentPage: 1,     // 默认的当前页码
      pageSize: 10,       // 每页显示的记录数，默认为10个
      listNumber: 40,     // 列表总数
      paseSizeAll: [8, 10, 12, 14],
      floors: [       // 层数
        { value: 'all', label: '全部' },
        { value: '1', label: '1' },
        { value: '2', label: '2' },
        { value: '3', label: '3' }
      ],
      usages: [        // 用途
        { value: 'all', label: '全部' },
        { value: '1', label: '教学' },
        { value: '2', label: '实验' },
        { value: '3', label: '其他用途' }
      ],
      vacants: [       // 空置情况
        { value: 'all', label: '全部' },
        { value: '1', label: '空闲' },
        { value: '2', label: '不可预订' },
      ],

    }
  },
  created () {
    let sh = document.documentElement.scrollHeight
    this.userListNewStyle = {
      height: sh + 'px'
    }
    this.changePageStyle(this.getIsCollapse) // 改变当前页的宽度等样式

    // 判断用户权限,权限不够跳转首页不能访问
    if (!Cookie.get('CURRENTUSER') || Cookie.get('USERTYPE') != '1') {
      this.$router.push('/home')
      return false
    }

    // 获取实验室列表
    this.getList()
  },
  computed: {
    ...mapGetters ([
      'getIsCollapse'
    ])
  },
  methods: {
    /**
     * vuex之mutation修改值
     */
    ...mapMutations([
      'setIsCollapse'
    ]),

    /**
     * 获取列表数据
     */
    getList (current = this.currentPage, size = this.pageSize) {
      var _that = this
      $http.post(apis.getAllBookingUsers,{})
      .then(res => {
        _that.labList = res.data.list
        _that.isShow = true
      })
    },

    /**
     * 分页事件:处理当数值改变事件
     */
    handleSizeChange(size) {
      if (size != null && size > 0) {
        this.pageSize = size
        // 重新获取新闻列表数据
        this.getList(1, size)
      }
    },
    /**
     * 分页事件:当前页改变事件
     */
    handleCurrentChange(currentPage) {
      if (currentPage != null && currentPage > 0) {
        this.currentPage = currentPage
        // 重新获取新闻列表数据
        this.getList(currentPage)
      }
    },

    /**
     * 改变当前页的宽度等样式
     */
    changePageStyle (val) {
      let sh = document.documentElement.scrollHeight
      if (val == true) {
        this.userListNewStyle = {
          left: '64px',
          width: 'calc(100% - 64px)',
          height: sh  + 'px',
          transition: 'width 0.35s, left 0.35s',
          MozTransition: 'width 0.35s, left 0.35s',
          WebkitTransition: 'width 0.35s, left 0.35s',
          OTransition: 'width 0.35s, left 0.35s'
        }
      } else {
        this.userListNewStyle = {
          left: '200px',
          width: 'calc(100% - 200px)',
          height: sh + 'px',
          transition: 'width 0.6s, left 0.6s',
          MozTransition: 'width 0.6s, left 0.6s',
          WebkitTransition: 'width 0.6s, left 0.6s',
          OTransition: 'width 0.6s, left 0.6s'
        }
      }
    }
  },

  watch: {
    getIsCollapse: {
      handler (val, oldVal) {
        this.changePageStyle(val)
      }
    }
  }
}
</script>

<style scoped>
  .userList {
    position: relative;
    top: 62px;
    left: 200px;
    width: calc(100% - 200px);
    min-width: 560px;
    overflow: hidden;
    overflow-y: scroll;
    font-size: 14px;
  }
  .userList a {
    text-decoration: none;
    color: #409eff;
  }
  .userList a:hover {
    text-decoration: none;
    color: orange;
  }
  .userList__head {
    position: relative;
    width: 100%;
    height: 30px;
    color: #999999;
    padding: 3px 0 3px 10px;
  }
  .userList__body {
    position: relative;
    width: 100%;
    height: auto;
    padding: 5px 0 5px 10px;
  }
  .userList__body::after {
    display: block;
    content: '';
    clear: both;
  }
  .userList__body-search input {
    line-height: 24px;
    padding-left: 5px;
    border: 1px solid grey;
    border-radius: 4px;

  }
  .userList__body-left,
  .userList__body-right {
    float: left;
  }
  .userList__body-left {
    width: 25%;
    height: auto;
  }
  .userList__body-right {
    width: 74%;
    height: 550px;
    border-left: 1px solid #D8D8D8 ;
  }
  /*基本设置*/
  .basicList {
    padding-left: 0;
  }
  /*基本设置选项*/
  .basicList__item {
    position: relative;
    display: flex;
    width: 100%;
    height: 48px;
    line-height: 48px;
    padding-left: 10px;
    cursor: pointer;
  }
  /*鼠标悬浮在上面的样式*/
  .basicList__item:hover {
    background-color: #ecebec;
  }
  /*鼠标点击时的样式*/
  .basicList__item.active {
    background-color: #ecebec;
  }

  /*
   *  实验室列表样式
  */
  .list-ul {
    padding-left: 10px;
    list-style: none;
  }
  .list-ul-li {
    padding-top: 6px;
    padding-bottom: 5px;
    border-bottom: 1px dotted #dcdcdc;
    list-style-type: none;
  }
  .list-ul-li > div {
    display: inline-block;
  }
  .list-ul-li > div:first-child {
    width: 40%;
  }
  .list-ul-li > div:nth-child(2) {
    width: 20%;
  }
  .list-ul-li > div:nth-child(3) {
    width: 20%;
  }


</style>
<style>
  /*拖动条的样式*/
  ::-webkit-scrollbar {
    color: #ecebec;
    background-color: #ecebec 100%;
  }
  /*折叠面板项标题*/
  .el-collapse-item__header {
    height: 48px !important;
    font-size: 15px !important;
    color: #3a3a53 !important;
    font-weight: 500 !important;
    border-bottom: 1px solid #ecebec;
  }
  /*折叠面板内容包裹区*/
  .el-collapse-item__wrap {
    background-color: #ffffff !important;
    border-bottom: 1px solid #ecebec;
  }
  /*折叠面板选项*/
  .el-collapse-item__content {
    padding: 0 !important;
  }
</style>
