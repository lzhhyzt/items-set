<template>
  <div class="more">
    <div class="more__title">
      <span>实验室详情</span>
    </div>
    <div class="more__body">
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
            @cell-click="booking">
            <el-table-column
              prop="wid"
              label="星期"
              width="50">
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
              width="46">
            </el-table-column>
          </el-table>
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
  name: 'more',
  data () {
    return {
      baseInfo: {},     // 实验室基本信息
      bookingInfo: {},  // 实验室预订信息
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
     * 预订实验室
     */
    booking (row, column, cell, event) {
      var section = column.property
      var value = cell.innerText

      if (value == null || value == "") {
        this.$confirm('是否预订该实验室?', '提示', {
          confirmButtonText: '确定',
          cancelButtonText: '取消',
          type: 'warning'
        }).then(() => {
          var user = Cookie.get('FUSER')

          // 获取用户的真实信息
          $http.post(apis.getFUserInfoByName, {
            username: user
          })
          .then(res => {

            // 如果用户没有实名认证不可以预订实验室
            if (res.realname == "" || res.realname == null) {
              this.$message({
                  type: 'error',
                  center: true,
                  message: '亲，请实名之后再来预订！'
                });

                return false;
            }

            row[section] = res.realname

            // 获取实验室信息
            $http.post(apis.getLaboratoryById, {
              id: row.lid
            })
            .then(res => {
              var labName = res.data.laboratory.name

              // 插入个人预订信息
              $http.post(apis.addPerBooking, {
                name: Cookie.get('FUSER'),
                labId: row.lid,
                section: section,
                week: row.wid,
                labName: labName
              })
              .then(res => {
              })
            })

            // 向服务器更新预订信息
            $http.post(apis.updateLabBookingInfo, row)
            .then(res => {
              if (res.code === 1) {
                this.$message({
                  type: 'success',
                  center: true,
                  message: '预订成功!'
                });
              }
            })

          })
        }).catch(() => {
          this.$message({
            type: 'info',
            center: true,
            message: '取消预订'
          });
        });
      }

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
  }
}

</script>

<style scoped>
  .more__title {
    padding: 8px 0;
    background: #F4FCFF;
    text-align: center;
    border: 1px solid #B4D8F0;
  }
  .more__title span{
    font-size: 18px;
    font-family: "宋体";
    font-weight: bold;
  }
  .more__body {
    padding: 20px 0;
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
