<template>
  <div class="slb">
    <div class="slb__title">
      <span>常用教学实验室</span>
    </div>
    <div class="slb__body">
      <div class="slb__body-filter">
        <div class="filter1">
          <el-select v-model="floor" size="mini" clearable placeholder="请选择层数">
            <el-option
              v-for="item in floors"
              :key="item.value"
              :label="item.label"
              :value="item.value">
            </el-option>
          </el-select>
        </div>
        <div class="filter2">
          <el-select v-model="usage" size="mini" clearable placeholder="请选择用途">
            <el-option
              v-for="item in usages"
              :key="item.value"
              :label="item.label"
              :value="item.value">
            </el-option>
          </el-select>
        </div>
        <div class="filter3">
          <el-select v-model="vacant" size="mini" clearable placeholder="请选择空置情况">
            <el-option
              v-for="item in vacants"
              :key="item.value"
              :label="item.label"
              :value="item.value">
            </el-option>
          </el-select>
        </div>
        <div class="filter-search">
          <el-button type="success" icon="el-icon-search" size="mini" round @click="searchByCondition">搜索</el-button>
        </div>
      </div>
      <div class="slb__body-list">
        <ul class="list-ul">
          <li class="list-ul-li" v-for="item in labList" :key="item.id">
            <div class="li-div1">
              <a href="javascript:void(0)" @click="lbdetail(item.id)">{{ item.name }}</a>
            </div>
            <div class="li-div2">{{ item.floor }}</div>
            <div class="li-div3">{{ item.usage == 1? '教学': '实验'}}</div>
            <div class="li-div4">
              {{ item.vacant == 1? '空闲': '不可预订' }}
            </div>
            <div class="li-div5">
              <img src="../image/free.png" v-if="item.vacant == 1">
              <img src="../image/busy.png" v-else>
            </div>
          </li>
        </ul>
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
      </div>
    </div>
  </div>
</template>

<script>
import { apis } from '../../../config/url.js'
import $http from '../../../modules/axios.js'
import Cookie from '../../../modules/cookie.js'

export default {
  name: 'slb',
  data () {
    return {
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
      labList: []        // 实验室列表

    }
  },
  created () {
    this.getList()
    this.getTotal()
  },
  methods: {
    /**
     * 条件搜索
     */
    searchByCondition () {
      var _that = this
      var param = {}
      var floor = this.floor    // 楼层
      var usage = this.usage    // 用途
      var vacant = this.vacant  // 空置情况

      if (floor != null && floor != '全部') {
        param.floor = floor
      }

      if (usage != null && usage != '全部') {
        param.usage = usage
      }

      if (vacant != null && vacant != '全部') {
        param.vacant = vacant
      }

      if (param != null) {
        // 按条件搜索
        $http.post(apis.getLaboratoryByCondition, param)
        .then(res => {
          _that.labList = res.data.list
          _that.isShow = false
        })
      } else {
        _that.isShow = true
        this.getList()
      }
    },
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
     * 路由跳转
     */
    lbdetail(id) {
      if (Cookie.get('FUSER') == null) {
        window.location.href = "login.html"   // 未登录的跳转至登录页面
      } else {
        this.$router.push({path: '/detail', query: {index: id}})
      }
    }
  }
}

</script>

<style scoped>
  .slb a,
  .slb a:link,
  .slb a:visited {
    text-decoration: none;
  }
  .slb a:hover {
    color: red;
  }
  .slb__title {
    padding: 8px 0;
    background: #F4FCFF;
    text-align: center;
    border: 1px solid #B4D8F0;
  }
  .slb__title span{
    font-size: 18px;
    font-family: "宋体";
    font-weight: bold;
  }
  .slb__body {
    padding: 20px 0;
  }
  .el-icon-warning {
    color: #106f00;
  }

  /* 列表筛选 */
  .slb__body-filter {
    padding-bottom: 20px;
    margin-bottom: 10px;
    border-bottom: 1px solid #ffa500;
  }
  .slb__body-filter > div {
    display: inline-block;
    margin-right: 10px;
    margin-bottom: 5px;
  }

  /* 列表 */
  .list-ul-li {
    padding-top: 3px;
    padding-bottom: 1px;
    border-bottom: 1px dotted #dcdcdc;
  }
  .list-ul-li > div {
    display: inline-block;
  }
  .list-ul-li > div:first-child {
    width: 50%;
  }
  .list-ul-li > div:nth-child(2) {
    width: 10%;
  }
  .list-ul-li > div:nth-child(3) {
    width: 10%;
  }
  .list-ul-li > div:nth-child(4) {
    width: 12%;
  }
  .list-ul-li > div:last-child {
    width: 10%;
  }

  /*分页*/
  .slb-pagination {
    position: relative;
    width: 100%;
    height: 100%;
    margin-top: 20px;
  }
  .slb-pagination-block {
    position: relative;
    width: auto;
    padding: 5px 8px;
    text-align: center;
  }

</style>
