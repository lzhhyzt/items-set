<template>
  <div class="booking">
    <div class="booking-list">
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
            <a href="javascript:void(0)" @click="unsubscribe(scope.row.id,scope.row.section,scope.row.week)">退订</a>
          </template>
        </el-table-column>
      </el-table>
    </div>
  </div>
</template>

<script>
import $http from '../../../module/axios.js'
import { apis } from '../../../config/url.js'
import Cookie from '../../../module/cookie.js'

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
    this.currentUser = this.$route.query.name
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
    unsubscribe (id,section,week) {
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
          week: week
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
  },
  // 监听路由变化
  watch: {
    // 如果路由有变化，会再次执行该方法
    "$route": function(newValue,oldValue){
        this.currentUser = this.$route.query.name
        this.getBaseInfo(this.currentUser)
    }
  }
}
</script>

<style>
.booking {
  padding: 20px 20px;
}

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
