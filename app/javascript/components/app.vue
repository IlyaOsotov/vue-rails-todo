<template>
  <div id='app'>
    <navbar></navbar>
    <main-component></main-component>
  </div>
</template>

<script>
  import mainComponent from './mainComponent.vue'
  import navbar from './navbar.vue'
  export default {
    data: function () {
      return {
      }
    },
    components: {
      navbar: navbar,
      mainComponent: mainComponent
    },
  }
</script>

<style scoped>
  p {
    font-size: 2em;
    text-align: center;
  }
</style>
