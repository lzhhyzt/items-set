<template>
  <div class="nothing">
    <div class="nothing__div">
      <img  class="nothing__img" src="http://p4t7xi97p.bkt.clouddn.com/nothing.png" />
    </div>
  </div>
</template>

<script>

export default {
  name: 'nothing',
  data () {
    return {}
  }
}
</script>

<style scoped>
  .nothing {
    position: relative;
    width: 100%;
    height: 100%;
    border-top: 1px solid #D8D8D8;
  }
  .nothing__div {
    position: absolute;
    top: 50%;
    left: 50%;
    width: 250px;
    height: 300px;
    transform: translateY(-50%) translateX(-50%);
  }
  .nothing__img {
    width: 250px;
    height: 280px;
  }
</style>
