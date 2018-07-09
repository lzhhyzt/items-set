<template>
  <div class="list">
    <div class="list-reflesh">
      <i class="el-icon-refresh" @click="getUserList"></i>
      &nbsp;
      <i class="el-icon-circle-plus-outline" @click="setFBaseInfoAdd('0')"></i>
    </div>
    <ul class="list__ul">
      <li class="list__li" v-for="item in userList" :key="item.id">
        <span>{{ item.username }}</span>
        <span class="list__li-type" v-show="item.type == 1">
          <i class="el-icon-view" @click="setFBaseInfoAdd(item.username)"></i>
          &nbsp;
          <i class="el-icon-delete" @click="deleteUser(item.id,item.username)"></i>
        </span>
      </li>
    </ul>
  </div>
</template>

<script>
import { apis } from '../../../config/url.js'
import $http from '../../../module/axios.js'
import { mapGetters, mapMutations } from 'vuex'

export default {
  name: 'list',
  data () {
    return {
      userList: []
    }
  },
  created () {
    // 获取用户列表
    this.getUserList()
  },
  methods: {
    /**
     * vuex之mutation修改值
     */
    ...mapMutations([
      'setFBaseInfoAdd'
    ]),
    /**
     * 获取用户列表
     */
    getUserList () {
      var _that = this
      $http.post(apis.getAllFUsers, {})
      .then(res => {
        _that.userList = res.data.list
      })
    },
    /**
     * 删除用户
     */
    deleteUser (id,name) {
      this.$confirm('是否删除该用户?', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        $http.post(apis.deleteFUser, {
          userId: id,
          username: name
        })
        .then(res => {
          if (res.code== 1) {
            this.$message({
              type: 'success',
              message: '删除成功!',
              center: true
            })
            // 刷新列表
            this.getUserList()
          }
        })
      }).catch(() => {
        this.$message({
          type: 'info',
          message: '已取消删除',
          center: true
        })
      })
    },
  }
}
</script>

<style scoped>
  .list {
    position: relative;
    width: 100%;
    height: inherit;
    font-size: 16px;
  }
  .list-reflesh {
    text-align: right;
    margin: 5px 10px 0 0;
  }
  .el-icon-refresh,
  .el-icon-circle-plus-outline {
    font-size: 16px;
    color: #409eff;
    cursor: pointer;
  }
  .el-icon-refresh:hover,
  .el-icon-circle-plus-outline:hover {
    color: orange;
  }
  .list__ul {
    padding-left: 0;
    list-style: none;
    padding: 0 10px;
  }
  .list__li {
    padding: 10px 0 10px 10px;
    font-size: 14px;
    border-bottom: 1px dotted #D8D8D8;
  }
  .list__li:hover {
    background: #ededed;
  }
  .list__li-type {
    display: none;
    margin-right: 20px;
    float: right;
    cursor: pointer;
  }
  .el-icon-delete,
  .el-icon-view {
    cursor: pointer;
    color: #409eff;
  }
  .el-icon-view:hover,
  .el-icon-delete:hover {
    color: orange;
  }
  .list__li:hover .list__li-type  {
    display: inline-block;
  }
</style>
