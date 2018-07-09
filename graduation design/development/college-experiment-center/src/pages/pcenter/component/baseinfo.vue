<template>
  <div class="baseinfo">
    <!-- 用户基本信息 -->
    <div v-if="!isUpdate">
      <div class="baseinfo-list">
        <ul class="list-ul">
          <li><span>性别：</span>{{ baseInfo.sex }}</li>
          <li><span>年龄：</span>{{ baseInfo.age }}</li>
          <li><span>电话：</span>{{ baseInfo.phone }}</li>
          <li><span>邮箱：</span>{{ baseInfo.email }}</li>
          <li><span>地址：</span>{{ baseInfo.address }}</li>
        </ul>
      </div>
      <div class="baseinfo-editor">
        <i class="el-icon-edit" @click="toUpdate">修改信息</i>
        &nbsp;&nbsp;
        <i class="el-icon-edit-outline" @click="toUpdateRealname">用户实名制</i>
      </div>
    </div>
    <!-- 更新用户信息 -->
    <div class="baseinfo-update" v-else>
      <div class="updateInfo__body">
        <el-form ref="form" :model="form" label-width="80px" :rules="rules">
          <el-form-item label="昵称" prop="username">
            <el-input v-model="form.nickname" size="small" placeholder="请输入昵称" clearable></el-input>
          </el-form-item>
          <el-form-item label="性别">
            <el-radio-group v-model="form.sex">
              <el-radio label="男"></el-radio>
              <el-radio label="女"></el-radio>
            </el-radio-group>
          </el-form-item>
          <el-form-item label="年龄">
            <el-input-number v-model="form.age" :min="1" :max="100" size="small"/>
          </el-form-item>
          <el-form-item label="电话">
            <el-input v-model="form.phone" size="small" placeholder="请输入电话" clearable></el-input>
          </el-form-item>
          <el-form-item label="邮箱">
            <el-input v-model="form.email" size="small" placeholder="请输入邮箱" clearable></el-input>
          </el-form-item>
          <el-form-item label="地址">
            <el-input v-model="form.address" size="small" placeholder="请输入地址" clearable></el-input>
          </el-form-item>
          <el-form-item label="签名">
            <el-input type="textarea" v-model="form.autograph" placeholder="请输入签名" clearable></el-input>
          </el-form-item>
          <el-form-item>
            <el-button type="primary" @click="updateOperator('form')" size="small">立即修改</el-button>
            <el-button size="small">取消</el-button>
          </el-form-item>
        </el-form>
        <div class="updateInfo__body-return">
          <a href="javascript:void(0)" @click="toUpdate">返回</a>
        </div>
      </div>
    </div>
    <!-- 用户实名制 -->
    <div class="baseinfo__realname" v-show="isRealname">
      真实姓名：
      <span v-if="isEditorRealname">
      <input
       type="text"
        placeholder="请输入你的真实姓名"
        v-model="realname"
      >
      <el-button type="primary" size="mini" plain @click="updateRealname">确定</el-button>
      </span>
      <span v-else>
      {{ realname }}
      </span>
    </div>
  </div>
</template>

<script>
import $http from '../../../modules/axios.js'
import { apis } from '../../../config/url.js'
import Cookie from '../../../modules/cookie.js'

export default {
  name: 'baseinfo',
  data () {
    return {
      isUpdate: false,
      isRealname: false,   // 是否实名制
      isEditorRealname: false,
      currentUser: '',    // 当前用户
      realname: '',       // 真实姓名
      baseInfo: {},       // 个人的基本信息
      form: {
        userId: 0,
        nickname: '',
        sex: '',
        age: 0,
        phone: '',
        email: '',
        address: '',
        autograph: ''
      },
      rules: {
        username: [
          { required: true, message: '请输入昵称', trigger: 'blur' },
          { min: 3, max: 15, message: '长度在 3 到 15 个字符', trigger: 'blur' }
        ]
      },
    }
  },
  created () {
    this.currentUser = Cookie.get('FUSER')
    this.getBaseInfo(this.currentUser)
    this.getFUserInfoByName(this.currentUser)
  },
  methods: {
    /**
     * 查询个人的账户信息
     */
    getFUserInfoByName (name) {
      $http.post(apis.getFUserInfoByName, {
        username: name
      })
      .then(res => {
        if (res.realname != "") {
         this.realname = res.realname
         this.isEditorRealname = false
        } else {
          this.realname = ""
          this.isEditorRealname = true
        }
      })
    },
    /**
     * 获取个人的基本信息
     */
    getBaseInfo (name) {
      var _that = this
      $http.post(apis.getFUserDetail, {
        username: name
      })
      .then(res => {
        if (res.code == 1) {
          _that.baseInfo = res.data.detail
          _that.form = res.data.detail
        } else {
          this.$message({
            type: 'error',
            message: name + '的个人信息为空',
            center: true
          })
        }
      })
    },

    /**
     * 更新个人信息
     */
    toUpdate () {
      var isUpdate = this.isUpdate
      // 标记更新状态为true
      this.isUpdate = !isUpdate
      this.isRealname = false
    },

    /**
     * 个人实名制
     */
    toUpdateRealname () {
      var isRealname = this.isRealname
      // 标记更新状态为true
      this.isRealname = !isRealname
    },

    /**
     * 修改用户
     */
    updateOperator (formName) {
      this.$refs[formName].validate((valid) => {
        if (valid) {
          this.$confirm('请确定是否要修改个人信息?', '提示', {
            confirmButtonText: '确定',
            cancelButtonText: '取消',
            type: 'warning'
          }).then(() => {
            $http.post(apis.updateFUserDetails, this.form)
            .then(res => {
              if (res.code== 1) {
                this.$message({
                  type: 'success',
                  message: '修改成功!请手动刷新!',
                  center: true
                })

                this.getBaseInfo(this.currentUser) // 重新查询信息

                this.form = {
                  username: '',
                  sex: '',
                  age: 0,
                  phone: '',
                  email: '',
                  address: '',
                  autograph: ''
                }
              }
            })
          }).catch(() => {
            this.$message({
              type: 'info',
              message: '已取消添加',
              center: true
            })
          })
        } else {
          return false;
        }
      })
    },

    /**
     * 实名验证
     */
    updateRealname () {
      if (this.realname != "" || this.realname != null) {

        this.$confirm('请确定是否要修改真实姓名，只能修改一次?', '提示', {
          confirmButtonText: '确定',
          cancelButtonText: '取消',
          type: 'warning'
        }).then(() => {
          $http.post(apis.updateFUserRealname, {
            username: this.currentUser,
            realname: this.realname
          })
          .then(res => {
            if (res.code== 1) {
              this.getFUserInfoByName(this.currentUser)
              this.$message({
                type: 'success',
                message: '修改成功',
                center: true
              })
            }
          })
        }).catch(() => {
          this.$message({
            type: 'info',
            message: '已取消添加',
            center: true
          })
        })
      } else {
        this.$message({
          type: 'error',
          message: '真实姓名不能为空',
          center: true
        })
      }
    },
  }
}
</script>

<style>
.baseinfo ul {
  list-style: none;
  padding-left: 10px;
}

.baseinfo ul li{
  list-style-type: none;
  margin-bottom: 8px;
}
.list-ul li > span {
  color: #67c23a;
}
.baseinfo-editor {
  margin-top: 20px;
  padding-left: 10px;
}
.el-icon-edit,
.el-icon-edit-outline {
  font-size: 14px;
  color: #409eff;
  cursor: pointer;
}
.el-icon-edit:hover,
.el-icon-edit-outline:hover {
  color: red;
}

.baseinfo-update {
  position: relative;
  height: 600px;
  width: 100%;
  padding: 8px 0 3px 10px;
}
.updateInfo__body-return {
  margin-left: 40px;
  font-size: 16px;
}
.updateInfo__body-return a,
.updateInfo__body-return a:link {
  color: #409eff;
}
.updateInfo__body-return a:hover {
  color: red;
}

.updateInfo__body {
  position: absolute;
  top: 5%;
  width: 400px;
  height: auto;
  padding-right: 20px;
}
.baseinfo__realname {
  margin-top: 20px;
  padding-left: 10px;
}
.baseinfo__realname input {
  height: 22px;
  padding-left: 5px;
  border-radius: 2px;
  border: 1px solid #b5b0b0b5;
}
</style>
