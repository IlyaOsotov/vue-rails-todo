<template lang="html">
  <div>
    <vs-table
      :data="orders">
      <template slot="header">
        <h3>
          Заказы
        </h3>
        <vs-button color="primary" type="filled" @click="LinkToNewOrder">Добавить заказ</vs-button>
      </template>
      <template slot="thead">
        <vs-th>
          Id
        </vs-th>
        <vs-th>
          Имя
        </vs-th>
        <vs-th>
          Цена
        </vs-th>
        <vs-th>
          Дата доставки
        </vs-th>
        <vs-th>
          Статус
        </vs-th>
      </template>

      <template slot-scope="{data}">
        <vs-tr
          :state="tr.status == 'archived' ? 'danger' : null" 
          :data="tr"
          :key="indextr"
          v-for="(tr, indextr) in data"
        >
          <vs-td :data="tr.email">
            {{tr.id}}
          </vs-td>

          <vs-td :data="tr.name">
            {{tr.name}}
          </vs-td>

          <vs-td :data="tr.price">
            {{tr.price}}
          </vs-td>

          <vs-td :data="tr.delivery_date">
            {{tr.delivery_date}}
          </vs-td>
          <vs-td :data="tr.status">
            {{tr.status}}
          </vs-td>

          <template class="expand-order" slot="expand">
            <div class="con-expand-orders">
              <div class="con-btns-order">
                <div>
                  <vs-button vs-type="gradient" size="small" color="success" icon="send"></vs-button>
                  <vs-button vs-type="flat" size="small" color="danger" icon="delete_sweep"></vs-button>
                </div>
              </div>
            </div>
          </template>
        </vs-tr>
      </template>
    </vs-table>
    <vs-pagination :total="this.max" v-model="currentx" :max="this.max"></vs-pagination>
  </div>
</template>

<script>
  import axios from 'axios'

  export default {
    data:()=>({
      orders: [],
      currentx: 1,
      max: 1
    }),
    mounted: function () {
      var that;
      that = this;
      axios.get(`api/orders.json`)
        .then(response => {
          that.orders = response.data.data;
          that.max = response.data.total;
      });
    },
    methods: {
      LinkToNewOrder() {
        this.$router.push({ name: 'newOrder' })
      }
    },
    watch: {
      currentx: function(val) {
        var that;
        that = this;
        axios.get(`api/orders.json`, { params: 
                                        { 
                                          page: val
                                        }
                                      })
          .then(response => {
            that.orders = response.data.data;
            that.max = response.data.total;        
        });
      }
    }
  }
</script>

<style lang="scss">
.con-expand-orders {
  .con-btns-order {
    display: flex;
    padding: 10px;
    padding-bottom: 0px;
    align-items: center;
    justify-content: center;
    .con-orderx {
      display: flex;
      align-items: center;
      justify-content: center;
    }
  }
  .list-icon {
    i {
      font-size: .9rem !important;
    }
  }
}
</style>