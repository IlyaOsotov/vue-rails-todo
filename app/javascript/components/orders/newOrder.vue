<template>
  <div>
    <div class="centerx">
      <vs-input label-placeholder="Имя заказчика" v-model="name"/>
    </div>
    <vs-select
      placeholder="Список блюд"
      multiple
      autocomplete
      class="selectExample"
      label="Список блюд"
      v-model="selectedProducts"
    >
      <vs-select-item :key="index" :value="item.value" :text="item.text" v-for="item,index in options" />
    </vs-select>
    <label class="vs-select--label">Выберите дату</label>
    <vue-ctk-date-time-picker v-model="date" class="datepicker"></vue-ctk-date-time-picker>
    <label>{{price}}</label>
  </div>
</template>

<script>
  import axios from 'axios';
  import VueCtkDateTimePicker from 'vue-ctk-date-time-picker';
  import 'vue-ctk-date-time-picker/dist/vue-ctk-date-time-picker.css';

  export default {
    data() {
      return { 
        name: '',
        selectedProducts: [],
        date: '',
        products: []
      }
    },
    mounted: function () {
      var that;
      that = this;
      axios.get(`api/products.json`)
        .then(response => {
          that.products = response.data.data;
      });
    },
    computed: {
      options() {
        return this.products.map(function(p) {
          return {
            text: `${p.name} (${p.price} руб.)`,
            value: p.id
          }
        });
      },
      price() {
        if (this.selectedProducts == []) {
          return 0;
        } else {
          let result = 0;
          let that = this;
          this.selectedProducts.forEach(function(selProduct) {
            let pr = that.products.find(p => p.id == selProduct).price
            result += pr;
          });
          return result;
        }
      }
    },
    components: {
      VueCtkDateTimePicker: VueCtkDateTimePicker
    }
  }
</script>

<style scoped>
.datepicker {
  width: 200px;
  margin: 0;
}
</style>
