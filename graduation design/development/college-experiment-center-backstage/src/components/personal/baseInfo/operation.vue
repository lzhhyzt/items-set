<template>
  <div class="operation">
    <div class="operation__div">
      <img class="operation__img" src="http://p4t7xi97p.bkt.clouddn.com/nothing.png" v-if="!getBaseInfoEditor"/>
      <div class="operation__editor" v-else>
        <el-form ref="form" :model="form" label-width="80px" :rules="rules" >
          <el-form-item label="昵称" prop="username">
            <el-input v-model="form.username" size="small" placeholder="请输入昵称" clearable></el-input>
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
            <el-button type="primary" @click="addOperator('form')" size="small">立即修改</el-button>
            <el-button size="small">取消</el-button>
          </el-form-item>
        </el-form>
      </div>
    </div>
  </div>
</template>

<script>
import $http from '../../../module/axios.js'
import { apis } from '../../../config/url.js'
import Cookie from '../../../module/cookie.js'
import { mapGetters, mapMutations } from 'vuex'

export default {
  name: 'operation',
  data () {
    return {
      currentUser: '',    // 当前用户
      form: {
        username: '',
        sex: '',
        age: '',
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
      }
    }
  },
  created () {
    this.setBaseInfoEditor(false)    // 初始化编辑状态
    this.currentUser = Cookie.get('CURRENTUSER')
    this.getBaseInfo(this.currentUser)
  },
  computed: {
    ...mapGetters ([
      'getBaseInfoEditor'
    ])
  },
  methods: {
    ...mapMutations([
      'setBaseInfoEditor'
    ]),
    /**
     * 获取个人的基本信息
     */
    getBaseInfo (name) {
      var _that = this
      $http.post(apis.getUserDetail, {
        username: name
      })
      .then(res => {
        _that.form = res.data.detail
      })
    },
    /**
     * 添加用户
     */
    addOperator (formName) {
      this.$refs[formName].validate((valid) => {
        if (valid) {
          this.$confirm('是否修改个人信息?', '提示', {
            confirmButtonText: '确定',
            cancelButtonText: '取消',
            type: 'warning'
          }).then(() => {
            $http.post(apis.updateUserDetail, this.form)
            .then(res => {
              if (res.code== 1) {
                this.$message({
                  type: 'success',
                  message: '修改成功，请手动刷新页面!',
                  center: true
                })
              }
            })

          }).catch(() => {
            this.$message({
              type: 'info',
              message: '已取消修改',
              center: true
            })
          })
        } else {
          return false;
        }
      })
    }
  }
}
</script>

<style scoped>
  .operation {
    position: relative;
    height: 100%;
    width: 100%;
  }
  .operation__div {
    position: relative;
    top: 50%;
    left: 50%;
    width: 400px;
    height: auto;
    text-align: center;
    transform: translateX(-50%) translateY(-50%);
  }
  .operation__img {
    width: 200px;
    height: 230px;
  }
  .operation__editor {
    width: 400px;
    height: auto;
    padding-right: 20px;
    text-align: left;
  }
</style>
