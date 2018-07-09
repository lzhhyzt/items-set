<template>
  <div class="upload">
    <div class="upload__close" @click="closePanel">
      <i class="el-icon-close"></i>
    </div>
    <div class="upload__body">
      <p>上传文件</p>
      <div>
        <el-upload
          class="upload-pic"
          action="http://upload-z2.qiniup.com/"
          :on-success="handleAvatarSuccess"
          :on-error="handleError"
          :before-upload="beforeAvatarUpload"
          :data="postData"
          drag
          multiple>
          <i class="el-icon-upload"></i>
          <div class="el-upload__text">将文件拖到此处，或<em>点击上传</em></div>
          <div class="el-upload__tip" slot="tip">上传文件不能超过5000kb</div>
        </el-upload>
      </div>
    </div>
  </div>

</template>

<script>
import { apis } from '../../../config/url.js'
import $http from '../../../module/axios.js'

  export default {
    name: 'upload',
    data () {
      return {
        imageUrl: '',
        postData: {
          key: '',
          token: ''
        }
      }
    },
    mounted () {
      this.getAuthToken()
    },
    methods: {
      /**
       * 关闭面板
       */
      closePanel() {
        this.$emit('listenToChildEvent',false)
        this.showPanel = false
      },
      /**
       * 获取tooken
       */
      getAuthToken() {
        var _that = this
        $http.get(apis.authToken)
        .then(res => {
          _that.postData.token = res.data
        })
      },
      /**
      * 图片处理上传成功
      */
      handleAvatarSuccess(res, file) {   //上传成功后在图片框显示图片
        var _that = this
        this.imageUrl ='http://p40so5pwi.bkt.clouddn.com/'+ res.key
        $http.post(apis.addFileInfo, {
          filename: file.raw.name,
	        url: this.imageUrl,
	        size: file.raw.size,
	        type: file.raw.type,
	        download: 0
        })
        .then(res => {
          if(res.code== 1) {
            _that.$message({
              type: 'success',
              message: '上传成功！',
              center: true
            })
          }
        })
        .catch(err => {
          _that.$message({
            type: 'error',
            message: '上传失败！',
            center: true
          })
        })
      },
      /**
      * 图片处理上传失败
      */
      handleError(res) {
      },

      /**
      * 文件上传提交前做过滤验证
      */
      beforeAvatarUpload(file) {
        var isLt5M = file.size / 1024 / 1024 < 5  // 判断文件大小
        var filename = file.name                  // 获取用户名
        this.postData.key = filename

        // 图片上传设定
        // var style = false
        // var isjpeg = file.type == 'image/jpeg'? true : false
        // var ispng= file.type == 'image/png'? true : false
        // var isgif = file.type == 'image/gif'? true : false
        // if (isjpeg || ispng || isgif) {
        //   style = true
        // }

        if (!isLt5M) {
          this.$message.error('上传头像图片大小不能超过 5MB!')
        }
        return isLt5M //&& style
      }
    }
  }
</script>

<style scoped>
  .upload {
    position: fixed;
    z-index: 1000;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    display: block;
    background: rgba(0,0,0,0.5);
  }
  .upload__body {
    position: absolute;
    top: 50%;
    left: 50%;
    width: 500px;
    min-height: 300px;
    background: #ffffff;
    text-align: center;
    transform: translateX(-50%) translateY(-50%);
  }
  .upload__close {
    position: absolute;
    top: 30px;
    right: 30px;
    cursor: pointer;
    font-size: 40px;
    color: #ffffff;
  }
</style>
