<template lang="html">
  <div class="base-table">
    <vs-table
      :data="products">
      <template slot="header">
        <h3>
          Products
        </h3>
      </template>
      <template slot="thead">
        <vs-th>
          Id
        </vs-th>
        <vs-th>
          Name
        </vs-th>
        <vs-th>
          Price
        </vs-th>
      </template>

      <template slot-scope="{data}">
        <vs-tr :data="tr" :key="indextr" v-for="(tr, indextr) in data" >
          <vs-td :data="tr.id">
            {{tr.id}}
          </vs-td>

          <vs-td :data="tr.name">
            {{tr.name}}
          </vs-td>

          <vs-td :data="tr.price">
            {{tr.price}}
          </vs-td>

          <template class="expand-product" slot="expand">
            <div class="con-expand-products">
              <div class="con-btns-product">
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
    data() {
      return {
        products: [],
        currentx: 1,
        max: 1
      }
    },
    mounted: function () {
      var that;
      that = this;
      axios.get(`api/products.json`)
        .then(response => {
          that.products = response.data.data;
          that.max = response.data.total;
      });
    },
    watch: {
      currentx: function(val) {
        var that;
        that = this;
        axios.get(`api/products.json`, { params: 
                                          { 
                                            page: val
                                          }
                                        })
          .then(response => {
            that.products = response.data.data;
            that.max = response.data.total;        
        });
      }
    }
  }
</script>

<style lang="scss">
.con-expand-products {
  .con-btns-product {
    display: flex;
    padding-bottom: 0px;
    align-items: center;
    justify-content: center;
    .con-productx {
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