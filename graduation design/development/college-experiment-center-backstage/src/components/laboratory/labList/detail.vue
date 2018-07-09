<template>
  <div class="detail">
    <!--基本信息-->
    <div class="base-info">
      名称：<span>{{ baseInfo.name }}</span> &nbsp;
      楼层：<span>第{{ baseInfo.floor}}层</span> &nbsp;
      用途：<span>{{ baseInfo.usage == 1? '教学':'实验' }}</span> &nbsp;
      空闲状态：<span>{{ baseInfo.vacant == 1? '空闲':'已预订' }}</span>&nbsp;
      实验楼位置：<span>{{ baseInfo.building }}</span>
    </div>
    <!--预订信息-->
    <div class="booking-info">
      <p>预订信息：</p>
      <!--选择星期几-->
      <div class="booking-info-week">
        <el-select v-model="week" size="mini" placeholder="请选择星期几" @change="selectWeek">
          <el-option
            v-for="item in weeks"
            :key="item.value"
            :label="item.label"
            :value="item.value"
          >
          </el-option>
        </el-select>
      </div>
      <div class="booking-info-table">
        <el-table
          :data="bookList"
          border
          size="mini"
          style="width: 100%"
          >
          <el-table-column
            prop="wid"
            label="星期"
            width="60">
          </el-table-column>
          <el-table-column
            prop="section1"
            label="9:00-10:20"
            width="86">
          </el-table-column>
          <el-table-column
            prop="section2"
            label="10:40-12:00"
            width="86">
          </el-table-column>
          <el-table-column
            prop="section3"
            label="14:00-15:20"
            width="86">
          </el-table-column>
          <el-table-column
            prop="section4"
            label="15:30-16:50"
            width="86">
          </el-table-column>
          <el-table-column
            prop="section5"
            label="17:00-18:20"
            width="86">
          </el-table-column>
          <el-table-column
            prop="section6"
            label="19:00-20:20"
            width="86">
          </el-table-column>
          <el-table-column
            prop="section7"
            label="20:40-22:00"
            width="86">
          </el-table-column>
          <el-table-column
            prop="status"
            label="状态"
           >
          </el-table-column>
        </el-table>
      </div>
    </div>
  </div>
</template>

<script>
import { apis } from '../../../config/url.js'
import $http from '../../../module/axios.js'
import Cookie from '../../../module/cookie.js'

export default {
  name: 'detail',
  data () {
    return {
      baseInfo: {},     // 实验室基本信息
      week: 0,
      weeks: [
        { value: 0, label: '全部'},
        { value: 1, label: '星期一' },
        { value: 2, label: '星期二' },
        { value: 3, label: '星期三' },
        { value: 4, label: '星期四' },
        { value: 5, label: '星期五' }
      ],
      bookList: [],      // 预订信息
      labName: '',       // 实验室名

    }
  },
  created () {
    this.getIndex()
    this.getBookList()
  },
  methods: {
    /**
     * 获取索引
     */
    getIndex () {
      var query = this.$route.query
      var index = query.index
      var _that = this

      if (index != null) {
        $http.post(apis.getLaboratoryById, {
          id: index
        })
        .then(res => {
          _that.baseInfo = res.data.laboratory
        })
      }
    },

    /**
     * 获取预订信息
     */
    getBookList () {
      var query = this.$route.query
      var index = query.index
      var _that = this

      $http.post(apis.getLabBookingInfo, {
        id: index
      })
      .then(res => {
        _that.bookList = res.data.list
      })
    },

    /**
     * 条件查询,根据星期
     */
    selectWeek (val) {
      var index = this.$route.query.index
      var _that = this

      if (val == 0) {
        this.getBookList()
      } else {
        $http.post(apis.getLabBookingInfoByWeek, {
          lId: index,
          wId: val
        })
        .then(res => {
          _that.bookList = res.data.list
        })
      }
    }
  },

  // 监听路由变化
  watch: {
    // 如果路由有变化，会再次执行该方法
    "$route": function(newValue,oldValue){
        this.getIndex()
        this.getBookList()

    }
  }
}

</script>

<style scoped>
 .detail {
   padding: 20px 30px;
 }
  .el-icon-warning {
    color: #106f00;
  }

  /*基本信息*/
  .base-info > span {
    color: #67c23a;
  }

  /*预订信息*/
  .booking-info {
    margin: 20px 0;
  }
  .booking-info-week {
    margin-bottom: 20px;
  }
</style>
