<template>
  <div class="resource" :style="resourceNewStyle">
    <div class="resource__head">
      您当前所在的位置：<a href="javascript:;">资源管理</a> >>
      <a href="javascript:;" @click="refleshList">文档管理</a>
    </div>
    <div class="resource__body">
      <div class="resource__body-options">
        <el-button type="success" size="mini" plain icon="el-icon-delete" @click="deleteMulti">
          批量删除文件
        </el-button>
        <el-button type="success" size="mini" icon="el-icon-upload" plain @click="changeUpload">
          上传文件
        </el-button>
        &nbsp;&nbsp;
        <i class="el-icon-refresh" @click="refleshList"></i>
        &nbsp;&nbsp;
        <div class="resource__body-options-search">
          <div @keyup.enter="searchResource">
            <el-input placeholder="请输入查找内容" v-model="searchInfo" class="input-with-select"
            suffix-icon="el-icon-edit" size="mini" >
              <span slot="prepend">文件名</span>
              <el-button type="success" slot="append" icon="el-icon-search" @click="searchResource">搜索</el-button>
            </el-input>
          </div>
        </div>
      </div>
      <div class="resource__body-content">
        <div class="content__table">
          <el-table ref="multipleTable" :data="getFileListPaging" tooltip-effect="dark"
          style="width: 100%" @selection-change="handleSelectionChange"
          :default-sort = "{prop: 'id', order: 'ascending'}" >

            <el-table-column type="selection" prop="id" width="55">
            </el-table-column>
            <el-table-column label="文件名" width="220" prop="filename" >
            </el-table-column>
            <el-table-column prop="url" label="地址" show-overflow-tooltip>
            </el-table-column>
            <el-table-column prop="type" label="存储类型" width="200">
            </el-table-column>
            <el-table-column prop="size" label="文件大小" width="100">
              <template slot-scope="scope">
                {{ (scope.row.size / 1024).toFixed(2) + 'KB'}}
              </template>
            </el-table-column>
            <el-table-column prop="download" label="下载次数" width="50">
            </el-table-column>
            <el-table-column  label="操作" width="80">
              <template slot-scope="scope">
                <i class="el-icon-delete" @click="deleteSinple(scope.row.id)"></i>
                &nbsp;&nbsp;
                <a :href="scope.row.url" target="_blank"><i class="el-icon-download"></i></a>
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
            :page-sizes="[5, 6]"
            :page-size="pageSize"
            layout="total, sizes, prev, pager, next, jumper"
            :total="resourceNumber">
          </el-pagination>
        </div>
      </div>
    </div>
    <!--上传文件-->
    <div v-show="showUpload">
      <upload v-on:listenToChildEvent="changeUploadStatus"></upload>
    </div>
  </div>
</template>

<script>
import Upload from './component/upload.vue'
import { apis } from '../../config/url.js'
import $http from '../../module/axios.js'
import { mapGetters, mapMutations } from 'vuex'

export default {
  name: 'resource',
  components: {
    Upload
  },
  data () {
    return {
      resourceNewStyle: {},       // resource类元素新增样式
      currentPage: 1,             // 默认的当前页码
      pageSize: 6,                // 每页显示的记录数，默认为8个
      multipleSelection: [],      // 表格中选择的checkbox的项
      searchInfo: '',             // 输入的查找信息
      searchType: '',             // 搜索类型
      selectIndexs: [],           // 选中状态的索引
      editIndex: -1,              // 正在编辑文件的索引
      resourceList: [],           // 文件列表
      resourceNumber: 0,          // 文件列表总数,
      showUpload: false,          // 上传是否显示
    }
  },
  created() {
    let sh = document.documentElement.clientHeight
    this.resourceNewStyle = {
      height: sh + 'px'
    }

    this.changePageStyle(this.getIsCollapse) // 改变当前页的宽度等样式

    // 更新文件列表和获取数量
    this.updateList()
    this.countResourceNumber()
  },
  computed: {
    ...mapGetters ([
      'getIsCollapse',         // 导航栏收缩展开状态
      'getFileListPaging'
    ])
  },
  methods: {
    /**
     * vuex之mutation修改值
     */
    ...mapMutations([
      'setIsCollapse',          // 设置导航栏展开收缩状态
      'setFileList'
    ]),
    /**
     * 改变当前页的宽度等样式
     */
    changePageStyle (val) {
      let sh = document.documentElement.scrollHeight
      if (val == true) {
        this.resourceNewStyle = {
          left: '64px',
          width: 'calc(100% - 64px)',
          height: sh  + 'px',
          transition: 'width 0.35s, left 0.35s',
          MozTransition: 'width 0.35s, left 0.35s',
          WebkitTransition: 'width 0.35s, left 0.35s',
          OTransition: 'width 0.35s, left 0.35s'
        }
      } else {
        this.resourceNewStyle = {
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
     * 改变上传面板显示状态
     */
    changeUpload () {
      if (this.showUpload == false) {
        this.showUpload = true
      } else {
        this.showUpload = false
      }
    },
    /**
     * 改变上传面板显示状态，由子组件传值
     */
    changeUploadStatus (data) {
      this.showUpload = data
      // 刷新列表
      this.refleshList()
    },
    /**
     * 更新和显示列表
     */
    updateList (current = this.currentPage, size = this.pageSize) {
      var _that = this
      /**
      * 向服务器请求文件列表
      */
      $http.post(apis.getFilesByPaging, {
        currentPage: current,  // 当前页码
        pageSize: size         // 每页显示的数量
      })
      .then(res => {
        var datas = res.data.list
        // 调用mutation的方法存进store仓库中
        _that.setFileList(datas)
      })
    },
    /**
     * 获取当前的文件总数量
     */
    countResourceNumber () {
      var _that = this
      /**
      * 向服务器请求文件总数
      */
      $http.post(apis.getFilesNumber,{})
      .then(res => {
        // 获取返回的文件总数量
        _that.resourceNumber = res.number
      })
    },

    /**
     * 重新刷新数据列表
     */
    refleshList () {
      this.updateList()
      this.countResourceNumber()
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
     * 表格事件:删除单条文件
     */
    deleteSinple(id) {
      if (id != null) {
        this.$confirm('是否要删除这条文件?', '提示', {
          confirmButtonText: '确定',
          cancelButtonText: '取消',
          type: 'warning'
        }).then(() => {
          // 执行异步请求删除文件
          $http.post(apis.removeFileById, {
            id: id,
          })
          .then(res => {
            if (res.code== 1) {
              this.$message({
                type: 'success',
                message: '删除成功!',
                center: true
              })

              // 更新文件列表和总数
              this.updateList()
              this.countResourceNumber()
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
     * 表格事件:删除多条文件
     */
    deleteMulti() {
      // 获取选择项的值
      var arr = this.multipleSelection

      if (arr.length === 0) {
        this.$message({
          type: 'warning',
          message: '至少选择一条文件!',
          center: true
        })
        return;
      } else {
        var list = []
        // 循环获取ID值，另存为数组
        for (var i =0; i < arr.length; i++) {
          list.push(arr[i].id)
        }

        this.$confirm('是否要删除这些文件?', '提示', {
          confirmButtonText: '确定',
          cancelButtonText: '取消',
          type: 'warning'
        }).then(() => {
          // 请求删除多条文件
          $http.post(apis.removeMultiFiles, {
            idList: list,
          })
          .then(res => {
            if (res.code== 1) {
              this.$message({
                type: 'success',
                message: '删除成功!',
                center: true
              })

              // 更新文件列表和总数
              this.updateList()
              this.countResourceNumber()
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
     * 表格事件：下载文件
     */
    downloadFile(url) {
      $http.download(url, {})
      .then(res => {
      })
    },
    /**
     * 表格事件:根据条件模糊查找符合的文件
     */
    searchResource() {
      var value = this.searchInfo // 获取输入的内容

      if (value == null || value == '') {
        this.$message({
          type: 'warning',
          message: '请输入查询内容',
          center: true
        })
        return;
      } else {
        var _that = this
        // 发送搜索请求
        $http.post(apis.getFileByName, {
          filename: value
        })
        .then(res => {
          if (res.code== 1) {
            var datas = res.data.list
            // 调用mutation的方法存进store仓库中
            _that.setFileList(datas)
            // 分页设置
            _that.resourceNumber = datas.length
          }
        })
      }
    },
    /**
     * 表格事件:新增文件
     */
    addResource() {
      this.setOperationResourceIndex({
        operationType: 1,        // 操作类型：1-新增/2-修改
        operationResourceIndex: -1   // 需要被操作的数据记录ID，新增操作，不用理会该字段，值为-1
      })
    },
    /**
     * 表格事件:编辑文件
     */
    editResource(id) {
      this.setOperationResourceIndex({
        operationType: 2,    // 操作类型：1-新增/2-修改
        operationResourceIndex: id   // 需要被操作的数据记录ID,编辑操作该值为需要操作的索引
      })
    },
    /**
     * 分页事件:处理当数值改变事件
     */
    handleSizeChange(size) {
      if (size != null && size > 0) {
        this.pageSize = size
        // 重新获取文件列表数据
        this.updateList(1, size)
      }
    },
    /**
     * 分页事件:当前页改变事件
     */
    handleCurrentChange(currentPage) {
      if (currentPage != null && currentPage > 0) {
        // 重新获取文件列表数据
        this.updateList(currentPage)
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
  .resource {
    position: relative;
    top: 62px;
    left: 200px;
    width: calc(100% - 200px);
    min-width: 560px;
    overflow: hidden;
    overflow-y: scroll;
    font-size: 14px;
  }
  .resource__head {
    position: relative;
    width: 100%;
    height: 30px;
    color: #999999;
    padding: 3px 0 3px 10px;
  }
  .resource__head a {
    color: #409eff;
    text-decoration: none;
  }
  .resource__body {
    position: relative;
    width: 100%;
    height: auto;
  }
  .resource__body-options {
    position: relative;
    margin: 8px 10px;
  }
  /*----搜索----*/
  .resource__body-options-search {
    position: absolute;
    right: 0;
    display: inline-block;
    margin-bottom: 15px;
  }
  .resource__body-options-search > div {
    margin: 0;
    float: left;
  }
  .resource__body-options-search .el-button--mini {
    border-radius: 0 3px 3px 0;
  }
  .resource__body-options-search::after {
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

  .resource__body-content {
    width: 100%;
  }

  /*----表格----*/
  .content__table {
    margin: 5px 10px;
    border-top: 1px solid #ebeef5;
  }
  .el-icon-delete,
  .el-icon-download {
    color: #67c23a;
    font-size: 18px;
    cursor: pointer;
  }
  .el-icon-delete:hover,
  .el-icon-download:hover {
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
  .el-icon-refresh {
    color: #67c23a;
    font-size: 18px;
    cursor: pointer;
  }
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
  .resource__body-options-search .el-select
  .el-input.is-focus .el-input__inner {
    width: 160px;
  }
  .el-input-group>.el-input__inner {
    width: 210px;
  }
</style>
