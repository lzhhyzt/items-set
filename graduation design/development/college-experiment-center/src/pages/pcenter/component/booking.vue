<template>
  <div class="booking">
    <div class="booking-list">
      <!--
      <ul class="list-ul">
        <li v-for="(item, index) in list" :key="index">
          <div>
            <span>星期：</span> {{ item.week }} &nbsp;&nbsp;&nbsp;&nbsp;
            <span>节数：</span> {{ item.section }} &nbsp;&nbsp;&nbsp;&nbsp;
            <span>时间：</span> {{ item.time }} &nbsp;&nbsp;&nbsp;&nbsp;
            <span>实验室：</span> {{ item.labName }} &nbsp;&nbsp;&nbsp;&nbsp;
            <a href="javascript:void(0)" @click="unsubscribe(item.id,item.section,item.week)">退订</a>
          </div>
        </li>
      </ul>
      -->
      <el-table
        :data="list"
        style="width: 100%">
        <el-table-column
          prop="week"
          label="星期"
          width="100">
        </el-table-column>
        <el-table-column
          prop="section"
          label="节数"
          width="130">
        </el-table-column>
        <el-table-column
          prop="time"
          label="时间"
          width="150">
        </el-table-column>
        <el-table-column
          prop="labName"
          label="实验室名"
          width="130">
        </el-table-column>
        <el-table-column
        label="操作">
          <template slot-scope="scope">
            <a href="javascript:void(0)" @click="unsubscribe(scope.row.labName,scope.row.section,scope.row.week)">退订</a>
          </template>
        </el-table-column>
      </el-table>
    </div>
    <div class="booking-other">
      <a href="laboratory.html">继续预订</a>
    </div>
  </div>
</template>

<script>
import $http from '../../../modules/axios.js'
import { apis } from '../../../config/url.js'
import Cookie from '../../../modules/cookie.js'

export default {
  name: 'booking',
  data () {
    return {
      currentUser: '',    // 当前用户
      weekList: {},
      list: []        // 个人的基本信息
    }
  },
  created () {
    this.currentUser = Cookie.get('FUSER')
    this.getBaseInfo(this.currentUser)
  },
  methods: {
    /**
     * 获取列表
     */
    getBaseInfo (name) {
      var _that = this
      $http.post(apis.getPerBooking, {
        name: name
      })
      .then(res => {
        var list = res.data.list

        list.forEach(function (obj) {
          switch(obj.section) {
            case "section1":
              //obj.section = '第一节'
              obj.time = '09:00-10:20'
              break;
            case "section2":
              //obj.section = '第二节'
              obj.time = '10:40-12:00'
              break;
            case "section3":
              //obj.section = '第三节'
              obj.time = '14:00-15:20'
              break;
            case "section4":
              //obj.section = '第四节'
              obj.time = '15:30-16:50'
              break;
            case "section5":
              //obj.section = '第五节'
              obj.time = '17:00-18:20'
              break;
            case "section6":
              //obj.section = '第六节'
              obj.time = '19:00-20:20'
              break;
            case "section7":
              //obj.section = '第七节'
              obj.time = '20:40-22:00'
              break;
          }
        })

        _that.list = list
      })
    },

    /**
     * 实验室退订
     */
    unsubscribe (name,section,week) {
      var _that = this

      this.$confirm('是否取消预订该实验室?', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        // 退订第一步
        $http.post(apis.getLabBookingInfoByWeek, {
          id: week
        })
        .then(res => {
          var list = res.data.list[0]
          _that.weekList = list
          // 更新
          list[section] = ""
          $http.post(apis.updateLabBookingInfo,list)
          .then(res => {
          })
        })

        // 退订第二步
        $http.post(apis.removePerBooking, {
          section: section,
          week: week,
          labName: name
        })
        .then(res => {
          if (res.code == 1) {
            _that.getBaseInfo(_that.currentUser)

            this.$message({
              type: 'success',
              message: '退订成功',
              center: true
            })
          } else {
            this.$message({
              type: 'error',
              message: '退订失败',
              center: true
            })
          }

        })
      })
      .catch(() => {
        this.$message({
          type: 'info',
          center: true,
          message: '取消退订'
        });
      });
    }
  }
}
</script>

<style>

.booking ul {
  list-style: none;
  padding-left: 10px;
}

.booking ul li{
  list-style-type: none;
  margin-bottom: 8px;
}

.booking a,
.booking a:link {
  text-decoration: none;
  color: #409eff;
}

.booking a:hover {
  color: orange;
}

.booking-other {
  margin-top: 20px;
}
</style>
