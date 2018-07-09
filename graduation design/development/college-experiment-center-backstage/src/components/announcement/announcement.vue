<template>
  <div class="announcement" :style="announcementNewStyle">
    <div class="announcement__head">
      您当前所在的位置：<a href="javascript:;"  @click="refleshList">公告管理</a>
    </div>
    <div class="announcement__body">
      <div class="announcement__body-options">
        <el-button type="primary" size="mini" plain icon="el-icon-delete" @click="deleteMulti">
          删除公告
        </el-button>
        <router-link to="/announcement/add">
          <el-button type="primary" size="mini" icon="el-icon-circle-plus-outline" plain @click="addAnnouncement()">
            新增公告
          </el-button>
        </router-link>
        &nbsp;&nbsp;
        <div class="announcement__body-options-search">
          <div @keyup.enter="searchAnnouncement">
            <!--<el-button type="primary" size="mini" icon="el-icon-search" plain @click="searchAnnouncement">搜索</el-button>-->
            <el-input placeholder="请输入查找内容" v-model="searchInfo" class="input-with-select"
            suffix-icon="el-icon-edit" size="mini" >
              <el-select v-model="searchType" slot="prepend" placeholder="请选择">
                <el-option label="标题" value="1"></el-option>
                <el-option label="作者" value="2"></el-option>
              </el-select>
              <el-button slot="append" icon="el-icon-search" @click="searchAnnouncement">搜索</el-button>
            </el-input>

          </div>
        </div>
      </div>
      <div class="announcement__body-content">
        <div class="content__table">
          <el-table ref="multipleTable" :data="getAnnouncementListPaging" tooltip-effect="dark"
          style="width: 100%" @selection-change="handleSelectionChange" stripe
          border :default-sort = "{prop: 'id', order: 'ascending'}" >

            <el-table-column type="selection" prop="id" width="55">
            </el-table-column>
            <el-table-column label="日期" width="140" prop="date" sortable >
              <template slot-scope="scope">
              {{ new Date(scope.row.date).format('yyyy-MM-dd', false) }}
              </template>
            </el-table-column>
            <el-table-column prop="author" label="作者" width="140">
            </el-table-column>
            <el-table-column prop="title" label="标题" show-overflow-tooltip>
            </el-table-column>
            <el-table-column prop="state" label="类型" width="120">
              <template slot-scope="scope">
                {{ scope.row.state == 1? "已发布":"草稿"}}
              </template>
            </el-table-column>
            <el-table-column  label="操作" width="120">
              <template slot-scope="scope">
                <router-link :to="{path:'/announcement/edit',query: {id: scope.row.id}}">
                  <i class="el-icon-edit" @click="editAnnouncement(scope.row.id)"></i>
                </router-link>
                &nbsp;&nbsp;
                <i class="el-icon-delete" @click="deleteSinple(scope.row.id)"></i>
              </template>
            </el-table-column>
          </el-table>
        </div>
        <div class="content__pagination">
          <el-pagination
            background
            @size-change="handleSizeChange"
            @current-change="handleCurrentChange"
            :current-page="currentPage"
            :page-sizes="[6, 8]"
            :page-size="pageSize"
            layout="total, sizes, prev, pager, next, jumper"
            :total="announcementNumber">
          </el-pagination>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import Vue from 'vue'
import { apis } from '../../config/url.js'
import $http from '../../module/axios.js'
import { mapGetters, mapMutations } from 'vuex'

export default {
  name: 'announcement',
  data () {
    return {
      announcementNewStyle: {},       // announcement类元素新增样式
      currentPage: 1,         // 默认的当前页码
      pageSize: 8,            // 每页显示的记录数，默认为8个
      multipleSelection: [],  // 表格中选择的checkbox的项
      searchInfo: '',         // 输入的查找信息
      searchType: '',         // 搜索类型
      selectIndexs: [],       // 选中状态的索引
      editIndex: -1,          // 正在编辑公告的索引
      announcementList: [],           // 公告列表
      announcementNumber: 0           // 公告列表总数
    }
  },
  created() {
    let sh = document.documentElement.clientHeight
    this.announcementNewStyle = {
      height: sh + 'px'
    }

    this.changePageStyle(this.getIsCollapse) // 改变当前页的宽度等样式

    // 更新公告列表和获取数量
    this.updateList()
    this.countAnnouncementNumber()
  },
  computed: {
    ...mapGetters ([
      'getIsCollapse',         // 导航栏收缩展开状态
      'getOperationAnnouncementIndex', // 获取当前正在操作的公告索引：1-新增/2-编辑
      'getAnnouncementListPaging'
    ])
  },
  methods: {
    /**
     * vuex之mutation修改值
     */
    ...mapMutations([
      'setIsCollapse',          // 设置导航栏展开收缩状态
      'setOperationAnnouncementIndex',  // 设置当前正在编辑的公告索引：1-新增/2-编辑
      'setAnnouncementList'
    ]),
    /**
     * 改变当前页的宽度等样式
     */
    changePageStyle (val) {
      let sh = document.documentElement.scrollHeight
      if (val == true) {
        this.announcementNewStyle = {
          left: '64px',
          width: 'calc(100% - 64px)',
          height: sh  + 'px',
          transition: 'width 0.35s, left 0.35s',
          MozTransition: 'width 0.35s, left 0.35s',
          WebkitTransition: 'width 0.35s, left 0.35s',
          OTransition: 'width 0.35s, left 0.35s'
        }
      } else {
        this.announcementNewStyle = {
          left: '200px',
          width: 'calc(100% - 200px)',
          height: sh + 'px',
          transition: 'width 0.6s, left 0.6s',
          MozTransition: 'width 0.6s, left 0.6s',
          WebkitTransition: 'width 0.6s, left 0.6s',
          OTransition: 'width 0.6s, left 0.6s'
        }
      }
    },

    /**
     * 更新和显示列表
     */
    updateList (current = this.currentPage, size = this.pageSize) {
      var _that = this
      /**
      * 向服务器请求公告列表
      */
      $http.post(apis.getAnnouncementByPaging, {
        currentPage: current,  // 当前页码
        pageSize: size         // 每页显示的数量
      })
      .then(res => {
        var datas = res.data.list
        // 调用mutation的方法存进store仓库中
        _that.setAnnouncementList(datas)
      })
    },
    /**
     * 获取当前的公告总数量
     */
    countAnnouncementNumber () {
      var _that = this
      /**
      * 向服务器请求公告总数
      */
      $http.post(apis.getAnnouncementNumber,{})
      .then(res => {
        // 获取返回的公告总数量
        _that.announcementNumber = res.number
      })
    },

    /**
     * 重新刷新数据列表
     */
    refleshList () {
      this.updateList()
      this.countAnnouncementNumber()
    },
    /**
     * 表格项勾选事件:
     */
    toggleSelection(rows) {
      if (rows) {
        rows.forEach(row => {
          this.$refs.multipleTable.toggleRowSelection(row);
        });
      } else {
        this.$refs.multipleTable.clearSelection();
      }
    },
    /**
     * 表格项勾选事件:当选择项发生变化时会触发该事件
     */
    handleSelectionChange(selection) {
      this.multipleSelection = selection;
    },
    /**
     * 表格事件:删除单条公告
     */
    deleteSinple(id) {
      if (id != null) {
        this.$confirm('是否要删除这条公告?', '提示', {
          confirmButtonText: '确定',
          cancelButtonText: '取消',
          type: 'warning'
        }).then(() => {
          // 执行异步请求删除公告
          $http.post(apis.deleteAnnouncementById, {
            id: id,
          })
          .then(res => {
            if (res.code== 1) {
              this.$message({
                type: 'success',
                message: '删除成功!',
                center: true
              })

              // 更新公告列表和总数
              this.updateList()
              this.countAnnouncementNumber()
            } else {
              this.$message({
                type: 'error',
                message: '删除失败!',
                center: true
              })
            }
          })
        })
        .catch((err) => {
        this.$message({
          type: 'info',
          message: '已取消删除',
          center: true
        })
      })
      } else {
        this.$message({
          type: 'error',
          message: '索引值不能为空!',
          center: true
        })
      }
    },
    /**
     * 表格事件:删除多条公告
     */
    deleteMulti() {
      // 获取选择项的值
      var arr = this.multipleSelection

      if (arr.length === 0) {
        this.$message({
          type: 'warning',
          message: '至少选择一条公告!',
          center: true
        })
        return;
      } else {
        var list = []
        // 循环获取ID值，另存为数组
        for (var i =0; i < arr.length; i++) {
          list.push(arr[i].id)
        }

        this.$confirm('是否要删除这些公告?', '提示', {
          confirmButtonText: '确定',
          cancelButtonText: '取消',
          type: 'warning'
        }).then(() => {
          // 请求删除多条公告
          $http.post(apis.deleteMultiAnnouncement, {
            idList: list,
          })
          .then(res => {
            if (res.code== 1) {
              this.$message({
                type: 'success',
                message: '删除成功!',
                center: true
              })

              // 更新公告列表和总数
              this.updateList()
              this.countAnnouncementNumber()
            } else {
              this.$message({
                type: 'error',
                message: '删除失败!',
                center: true
              })
            }
          })
        })
        .catch((err) => {
          this.$message({
            type: 'info',
            message: '已取消删除',
            center: true
          })
        })
      }
    },
    /**
     * 表格事件:根据条件模糊查找符合的公告
     */
    searchAnnouncement() {
      var value = this.searchInfo // 获取输入的内容
      var type = this.searchType  // 得到需要查询的类型：1-标题和副标题/2-作者

      if (value == null || value == '') {
        this.$message({
          type: 'warning',
          message: '请输入查询内容',
          center: true
        })
        return;
      } else {
        var _that = this
        if (type == 1) {        // 搜索类型为标题匹配字
          // 发送搜索请求
          $http.post(apis.getAnnouncementByTitle, {
            title: value
          })
          .then(res => {
            if (res.code== 1) {
              var datas = res.data.list
              // 调用mutation的方法存进store仓库中
              _that.setAnnouncementList(datas)
              // 分页设置
              _that.announcementNumber = datas.length
            }
          })

        } else if (type == 2) {  // 搜索类型为作者匹配字
          $http.post(apis.getAnnouncementByAuthor, {
            author: value
          })
          .then(res => {
            if (res.code== 1) {
              var datas = res.data.list
              // 调用mutation的方法存进store仓库中
              _that.setAnnouncementList(datas)
              // 分页设置
              _that.announcementNumber = datas.length
            }
          })

        } else {
          this.$message({
            type: 'warning',
            message: '请选择查询的类型',
            center: true
          })
          return;
        }
      }
    },
    /**
     * 表格事件:新增公告
     */
    addAnnouncement() {
      this.setOperationAnnouncementIndex({
        operationType: 1,        // 操作类型：1-新增/2-修改
        operationAnnouncementIndex: -1   // 需要被操作的数据记录ID，新增操作，不用理会该字段，值为-1
      })
    },
    /**
     * 表格事件:编辑公告
     */
    editAnnouncement(id) {
      this.setOperationAnnouncementIndex({
        operationType: 2,    // 操作类型：1-新增/2-修改
        operationAnnouncementIndex: id   // 需要被操作的数据记录ID,编辑操作该值为需要操作的索引
      })
    },
    /**
     * 分页事件:处理当数值改变事件
     */
    handleSizeChange(size) {
      if (size != null && size > 0) {
        this.pageSize = size
        // 重新获取公告列表数据
        this.updateList(1, size)
      }
    },
    /**
     * 分页事件:当前页改变事件
     */
    handleCurrentChange(currentPage) {
      if (currentPage != null && currentPage > 0) {
        // 重新获取公告列表数据
        this.updateList(currentPage)
      }
    }
  },

  watch: {
    getIsCollapse: {
      handler (val, oldVal) {
        this.changePageStyle(val);
      }
    }
  }
}
</script>

<style scoped>
  .announcement {
    position: relative;
    top: 62px;
    left: 200px;
    width: calc(100% - 200px);
    min-width: 560px;
    overflow: hidden;
    overflow-y: scroll;
    font-size: 14px;
  }
  .announcement__head {
    position: relative;
    width: 100%;
    height: 30px;
    color: #999999;
    padding: 3px 0 3px 10px;
  }
  .announcement__head a {
    color: #409eff;
    text-decoration: none;
  }
  .announcement__body {
    position: relative;
    width: 100%;
    height: auto;
  }
  .announcement__body-options {
    position: relative;
    margin: 8px 10px;
  }
  /*----搜索----*/
  .announcement__body-options-search {
    position: absolute;
    right: 0;
    display: inline-block;
    margin-bottom: 15px;
  }
  .announcement__body-options-search > div {
    margin: 0;
    float: left;
  }
  .announcement__body-options-search .el-button--mini {
    border-radius: 0 3px 3px 0;
  }
  .announcement__body-options-search::after {
    display: block;
    content: '';
    clear: both;
  }
  .search__input {
    width: 250px;
    border-radius: 3px 0 0 3px;
  }
  .search__input > input {
    border-radius: 3px 0 0 3px;
  }
  /*----搜索----*/

  .announcement__body-content {
    width: 100%;
  }

  /*----表格----*/
  .content__table {
    margin: 5px 10px;
    border: 1px solid #ebeef5;
  }
  .el-icon-edit,
  .el-icon-delete {
    color: #409eff;
    font-size: 18px;
    cursor: pointer;
  }
  .el-icon-edit:hover,
  .el-icon-delete:hover {
    color: orange;
  }
  /*----表格----*/

  /*分页*/
  .content__pagination {
    margin-top: 20px;
    text-align: center;
  }

</style>
<style>
  .el-select .el-input {
    width: 100px;
  }
  .input-with-select .el-input-group__prepend {
    background-color: #ffffff;
  }
  .el-input-group__append,
  .el-input-group__prepend {
    padding: 0 15px;
  }
  .el-input-group__append button.el-button {
    color: #409eff;
  }
  .el-input-group__append button.el-button:hover {
    color: 	#ffa500;
  }
  .announcement__body-options-search .el-select
  .el-input.is-focus .el-input__inner {
    width: 160px;
  }
  .el-input-group>.el-input__inner {
    width: 210px;
  }
</style>
