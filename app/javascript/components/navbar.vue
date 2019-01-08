<template>
  <div>
    <vs-navbar v-model="activeItem" class="nabarx">
      <vs-button type="flat" icon="menu"></vs-button>

      <vs-navbar-title>
        Example
      </vs-navbar-title>

      <vs-navbar-item index="0">
        <router-link to="/products">Страница продуктов</router-link>
      </vs-navbar-item>
      <vs-navbar-item index="1">
        <router-link to="/orders">Страница заказов</router-link>
      </vs-navbar-item>
      <vs-spacer></vs-spacer>
      <vs-input icon="search" placeholder="Поиск заказов" v-model="search"/>
    </vs-navbar>
  </div>
</template>
<script>
export default {
  data:()=>({
    activeItem: 1,
    search: ''
  })
}
</script>