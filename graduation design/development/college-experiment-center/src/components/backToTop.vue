<template>
  <div  class="back-to-top" v-show="isHidden" @click="backToTop">
    <div class="back-to-top__in">
    </div>
  </div>
</template>

<script>

export default {
  name: 'back-to-top',
  data () {
    return {
      isHidden: false
    }
  },
  mounted () {
    window.addEventListener('scroll', this.handleScroll)
  },
  methods: {
    handleScroll () {
      var scrollTop = window.pageYOffset || document.documentElement.scrollTop || document.body.scrollTop
      if (scrollTop > 200) {
        this.isHidden = true
      } else {
        this.isHidden = false
      }
    },
    backToTop () {
      var timer = null
      window.cancelAnimationFrame(timer);
      timer = window.requestAnimationFrame(function fn(){
        var oTop = document.body.scrollTop || document.documentElement.scrollTop;
        if(oTop > 0){
          document.body.scrollTop = document.documentElement.scrollTop = oTop - 50;
          timer = requestAnimationFrame(fn);
        }else{
          window.cancelAnimationFrame(timer);
        }
      });
    }
  }
}

</script>

<style scoped>
  .back-to-top{
    position:fixed;
    z-index: 9999;
    right: 10px;
    bottom: 10px;
    height: 30px;
    width: 50px;
    text-align: center;
    padding-top: 20px;
    background-color: lightblue;
    border-radius: 20%;
    overflow: hidden;
  }
  .back-to-top__in{
    position: absolute;
    top: 50%;
    left: 50%;
    visibility: visible;
    display:inline-block;
    height:32px;
    width: 32px;
    background: url(../pages/index/image/backTop1.png) no-repeat;
    transform: translateX(-50%) translateY(-50%);
  }
  .back-to-top:hover .back-to-top__in{
    background: url(../pages/index/image/backTop2.png) no-repeat;
  }
  .is-hidden {
    visibility:hidden;
  }
</style>
