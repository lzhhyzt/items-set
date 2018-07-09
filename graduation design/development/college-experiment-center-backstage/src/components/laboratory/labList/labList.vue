<template>
  <div class="labList" :style="laboratoryNewStyle">
    <div class="labList__head">
      您当前所在的位置：实验室管理 > 实验室列表
    </div>
    <div class="labList__body">
      <div class="labList__body-left">
        <div class="labList__body-operation">
          <i class="el-icon-refresh" @click="fleshList"></i>
          &nbsp;&nbsp;
          <router-link :to="{ path: '/laboratory/labList/addLab', query:{ index: 0 } }"><i class="el-icon-circle-plus-outline"></i></router-link>
        </div>
        <!-- 实验室列表 -->
        <ul class="list-ul">
          <li class="list-ul-li" v-for="item in labList" :key="item.id">
            <div class="li-div1">
              <router-link :to="{ path: '/laboratory/labList/labDetail', query:{ index: item.id} }" @click="labdetail(item.id)">{{ item.name }}</router-link>
            </div>
            <div class="li-div2">
              <img src="../assets/free.png" v-if="item.vacant == 1">
              <img src="../assets/busy.png" v-else>
            </div>
            <div class="li-div3">
            <router-link :to="{ path: '/laboratory/labList/editorLab', query:{ index: item.id } }">
            <i class="el-icon-edit-outline"></i>
            </router-link>
            </div>
            <div class="li-div4"><i class="el-icon-delete" @click="deleteLab(item.id)"></i></div>
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
      <div class="labList__body-right" v-if="$route.query.index == undefined">
        <nothing></nothing>
      </div>
      <div class="labList__body-right" v-else>
        <router-view></router-view>
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
  name: 'laboratory',
  components: {
    Nothing
  },
  data () {
    return {
      laboratoryNewStyle: {}, // 类元素新增样式
      activeNames: ['1'],
      labList: [],        // 实验室列表
      isShow: true,
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
    this.laboratoryNewStyle = {
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
      $http.post(apis.getLaboratorysByPaging, {
        currentPage: current,
        pageSize: size
      })
      .then(res => {
        _that.labList = res.data.list
        _that.isShow = true
      })
    },
    /**
    * 获取总数量
    */
    getTotal () {
      var _that = this
      $http.get(apis.getLaboratorysNumber)
      .then(res => {
        // 获取返回的总数量
        _that.listNumber = res.number
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
     * 刷新实验室列表
     */
    fleshList () {
      this.getList()
    },

    /**
     * 删除实验室
     */
    deleteLab (id) {
      this.$confirm('此操作将移除该实验室, 是否继续?', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        $http.post(apis.removeLaboratoryById, {
          id: id
        })
        .then(res => {
          if (res.code == 1) {
            // 重新刷新列表
            this.getList()
          }
        })

        this.$message({
          type: 'success',
          center: true,
          message: '删除成功!'
        });
      }).catch(() => {
        this.$message({
          type: 'info',
          center: true,
          message: '已取消删除'
        });
      });
    },

    /**
     * 改变当前页的宽度等样式
     */
    changePageStyle (val) {
      let sh = document.documentElement.scrollHeight
      if (val == true) {
        this.laboratoryNewStyle = {
          left: '64px',
          width: 'calc(100% - 64px)',
          height: sh  + 'px',
          transition: 'width 0.35s, left 0.35s',
          MozTransition: 'width 0.35s, left 0.35s',
          WebkitTransition: 'width 0.35s, left 0.35s',
          OTransition: 'width 0.35s, left 0.35s'
        }
      } else {
        this.laboratoryNewStyle = {
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
  .labList {
    position: relative;
    top: 62px;
    left: 200px;
    width: calc(100% - 200px);
    min-width: 560px;
    overflow: hidden;
    overflow-y: scroll;
    font-size: 14px;
  }
  .labList a {
    text-decoration: none;
    color: #409eff;
  }
  .labList a:hover {
    text-decoration: none;
    color: orange;
  }
  .labList__head {
    position: relative;
    width: 100%;
    height: 30px;
    color: #999999;
    padding: 3px 0 3px 10px;
  }
  .labList__body {
    position: relative;
    width: 100%;
    height: auto;
    padding: 5px 0 5px 10px;
  }
  .labList__body::after {
    display: block;
    content: '';
    clear: both;
  }
  .labList__body-left,
  .labList__body-right {
    float: left;
  }
  .labList__body-left {
    width: 25%;
    height: auto;
  }
   .labList__body-operation {
    margin-bottom: 20px;
  }

  .labList__body-right {
    width: 74%;
    height: 550px;
    border-left: 1px solid #D8D8D8;
    border-top: 1px solid #D8D8D8;
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
    width: 30%;
  }
  .list-ul-li > div:nth-child(3) {
    width: 10%;
  }
  .list-ul-li > div:nth-child(4) {
    width: 10%;
  }


  /*图标样式*/
  .el-icon-refresh,
  .el-icon-circle-plus-outline,
  .el-icon-delete,
  .el-icon-edit-outline {
    font-size: 16px;
    color: #409eff;
    cursor: pointer;
  }

  .el-icon-refresh:hover,
  .el-icon-circle-plus-outline:hover,
  .el-icon-delete:hover,
  .el-icon-edit-outline:hover {
    color: #FF8C00;
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
