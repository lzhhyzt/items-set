<template>
  <div class="classify">
    <div class="classify__body">
      <ul class="file__list">
        <li v-for="item in fileList" :key="item.id">
          <a :href="item.url" @click="increaseDownload(item.id)" target="_blank">{{ item.filename }}</a>
          &nbsp;
          <span class="file__list-size">[ {{ (item.size / 1024).toFixed(2) + 'KB' }} ]</span>
          <span class="file__list-count">{{item.download}}&nbsp;</span>
        </li>
      </ul>
      <!--分页-->
      <div class="file-pagination">
        <div class="file-pagination-block">
          <el-pagination
            @size-change="handleSizeChange"
            @current-change="handleCurrentChange"
            :current-page="currentPage"
            :page-sizes="[8, 10, 12, 14]"
            :page-size="pageSize"
            layout="total, sizes, prev, pager, next, jumper"
            :total="fileNumber">
          </el-pagination>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import { apis } from '../../../config/url.js'
import $http from '../../../modules/axios.js'

export default {
  name: 'classify',
  data () {
    return {
      fileList: [],
      currentPage: 1,    // 默认的当前页码
      pageSize: 10,      // 每页显示的记录数，默认为10个
      fileNumber: 0,     // 新闻列表总数
    }
  },
  created () {
    this.getfileList()      // 获取文件列表
    this.countFileNumber()  // 计算文件数量
  },
  methods: {
    /**
     * 获取文件列表
     */
    getfileList (current = this.currentPage, size = this.pageSize) {
      var _that = this
      // 向服务器请求新闻列表
      $http.post(apis.getFilesByPaging, {
        currentPage: current,  // 当前页码
        pageSize: size         // 每页显示的数量
      })
      .then(res => {
        var datas = res.data.list
        _that.fileList = datas
      })
    },
    /**
     * 获取当前的新闻总数量
     */
    countFileNumber () {
      var _that = this
      $http.get(apis.getFilesNumber)
      .then(res => {
        // 获取返回的新闻总数量
        _that.fileNumber = res.number
      })
    },
    /**
     * 下载数量+1
     */
    increaseDownload (id) {
      $http.post(apis.updateFileDownload,{
        id: id
      })
      .then(res => {
      })

      // 更新列表
      this.getfileList(this.currentPage,this.pageSize)
    },
    /**
     * 分页事件:处理当数值改变事件
     */
    handleSizeChange(size) {
      if (size != null && size > 0) {
        this.pageSize = size
        // 重新获取新闻列表数据
        this.getfileList(1, size)
      }
    },
    /**
     * 分页事件:当前页改变事件
     */
    handleCurrentChange(currentPage) {
      if (currentPage != null && currentPage > 0) {
        this.currentPage = currentPage
        // 重新获取新闻列表数据
        this.getfileList(currentPage)
      }
    }
  }
}

</script>

<style scoped>
  .classify a {
    color: #07519A;
  }
  .classify a:link {
    color: #07519A;
    text-decoration: none;
  }
  .classify a:active {
    color: red;
    text-decoration: none;
  }
  .classify a:visited {
    color: #07519A;
    text-decoration: none;
  }
  .classify a:hover {
    color: red;
    text-decoration: none;
  }
  .classify__body {
    padding-bottom: 20px;
    font-family: "宋体";
    font-size: 12px;
  }

  /*分页*/
  .file-pagination {
    position: relative;
    width: 100%;
    height: 100%;
  }
  .file-pagination-block {
    position: relative;
    width: auto;
    padding: 5px 8px;
    text-align: center;
  }
  /*文件列表*/
  .file__list {
    padding: 0;
    list-style: none;
  }
  .file__list li {
    display: block;
    padding: 5px 8px;
    list-style-type: none;
    border-bottom: 1px dotted #cccccc;
  }
  .file__list-size {
    color: #808080;
  }
  .file__list-count {
    float: right;
    text-align: right;
  }
  .file__list-count::after {
    display: block;
    content: '';
    clear: both;
  }
</style>
