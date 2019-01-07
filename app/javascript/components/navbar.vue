<template>
  <div>
    <vs-navbar v-model="activeItem" class="nabarx">
      <vs-button type="flat"></vs-button>

      <vs-navbar-title>
        Example
      </vs-navbar-title>

      <vs-spacer></vs-spacer>

      <router-link to="/products">Страница продуктов</router-link>
      <router-link to="/orders">Страница заказов</router-link>
    </vs-navbar>
  </div>
</template>

<script>
export default {
  data:()=>({
    activeItem: 0
  })
}
</script>
