<template>
  <div class="addAdmin">
    <div class="addAdmin__body">
      <div v-if="getBaseInfoAdd == '0'">
      <el-form ref="form" :model="form" label-width="80px" :rules="rules">
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
          <el-input type="textarea" v-model="form.desc" placeholder="请输入签名" clearable></el-input>
        </el-form-item>
        <el-form-item>
          <el-button type="primary" @click="addOperator('form')" size="small">立即添加</el-button>
          <el-button size="small">取消</el-button>
        </el-form-item>
      </el-form>
      </div>
      <!--信息查看-->
      <div v-else="getBaseInfoAdd != '0'">
        <person-info :base="baseInfo"></person-info>
      </div>
    </div>
  </div>
</template>

<script>
import { apis } from '../../../config/url.js'
import $http from '../../../module/axios.js'
import { mapGetters, mapMutations } from 'vuex'
import PersonInfo from './personInfo.vue'


export default {
  name: 'addAdmin',
  components: {
    PersonInfo
  },
  data () {
    return {
      form: {
        username: '',
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
      baseInfo: {}      // 个人的基本信息
    }
  },
  computed: {
    ...mapGetters ([
      'getBaseInfoAdd'
    ])
  },
  methods: {
    /**
     * 添加用户
     */
    addOperator (formName) {
      this.$refs[formName].validate((valid) => {
        if (valid) {
          this.$confirm('是否添加该管理员?', '提示', {
            confirmButtonText: '确定',
            cancelButtonText: '取消',
            type: 'warning'
          }).then(() => {
            $http.post(apis.addUserDetail, this.form)
            .then(res => {
              if (res.code== 1) {
                this.$message({
                  type: 'success',
                  message: '添加成功!请手动刷新!',
                  center: true
                })
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
     * 获取个人的基本信息
     */
    getBaseInfo (name) {
      var _that = this
      $http.post(apis.getUserDetail, {
        username: name
      })
      .then(res => {
        if (res.code == 1) {
          _that.baseInfo = res.data.detail
        } else {
          this.$message({
            type: 'error',
            message: name + '的个人信息为空',
            center: true
          })
        }
      })
    }
  },
  watch: {
    getBaseInfoAdd: function(newVal,oldVal) {
      if (newVal != '0') {
        this.getBaseInfo(newVal)
      }
    }
  }
}
</script>

<style scoped>
  .addAdmin {
    position: relative;
    width: 100%;
    height: 94%;
    padding: 8px 0 3px 10px;
  }
  .addAdmin__body {
    position: absolute;
    top: 5%;
    left: 50%;
    width: 400px;
    height: auto;
    padding-right: 20px;
    transform: translateX(-50%);
  }
</style>
