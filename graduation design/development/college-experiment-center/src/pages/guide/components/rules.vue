<template>
  <div class="quality">
    <div class="quality__title">
      <span>规章制度</span>
    </div>
    <div class="quality__body">
      <p>1、实验室是进行测试工作的场所，必须保持清洁、整齐、安静。</p>
      <p>2、实验室内严禁随地吐痰、吸烟和用餐。</p>
      <p>3、禁止将与工作无关的物品带入实验室内，冰箱内不得存放非检测物品。有毒物品要有专人管理，</p>
      <p>4、实验室内不得进行与本职工作无关的一切活动。</p>
      <p>5、非本中心人员，未经同意，不得进入中心工作区域。</p>
      <p>6、非开放实验室使用除了上课使用之外，其他活动使用需要向实验中心处申请，经批准才可以使用。</p>
      <p>7、各实验室严禁私自配钥匙，确因工作需要时由中心统一配制，如有遗失应及时向中心办公室报失。</p>
    </div>
  </div>
</template>

<script>

export default {
  name: 'quality',
  data () {
    return {}
  }
}

</script>

<style scoped>
  .quality__title {
    padding: 8px 0;
    background: #F4FCFF;
    text-align: center;
    border: 1px solid #B4D8F0;
  }
  .quality__title span{
    font-size: 18px;
    font-family: "宋体";
    font-weight: bold;
  }
  .quality__body {
    padding: 20px 0;
  }
</style>
