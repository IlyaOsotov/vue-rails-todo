<template lang="html">
  <div>
    <vs-table
      :data="products">
      <div slot="header">
        <h3>
          Products
        </h3>
      </div>
      <div slot="thead">
        <vs-th>
          Id
        </vs-th>
        <vs-th>
          Name
        </vs-th>
        <vs-th>
          Price
        </vs-th>
      </div>

      <div slot-scope="{data}">
        <vs-tr :data="tr" :key="indextr" v-for="(tr, indextr) in data" >
          <vs-td :data="tr.email">
            {{tr.id}}
          </vs-td>

          <vs-td :data="tr.username">
            {{tr.name}}
          </vs-td>

          <vs-td :data="tr.website">
            {{tr.price}}
          </vs-td>

          <div class="expand-user" slot="expand">
            <div class="con-expand-users">
              <div class="con-btns-user">
                <div class="con-userx">
                  <vs-avatar :badge="tr.id" size="45px" :src="`https://randomuser.me/api/portraits/women/${indextr}.jpg`"/>
                  <span>
                    {{ tr.name }}
                  </span>
                </div>

                <div>
                  <vs-button vs-type="border" size="small" icon="phone_in_talk"></vs-button>
                  <vs-button vs-type="gradient" size="small" color="success" icon="send"></vs-button>
                  <vs-button vs-type="flat" size="small" color="danger" icon="delete_sweep"></vs-button>
                </div>
              </div>
              <vs-list>
                <vs-list-item icon="mail" title="Email" :subtitle="tr.email"></vs-list-item>
                <vs-list-item icon="check" title="Website" :subtitle="tr.website"></vs-list-item>
              </vs-list>
            </div>
          </div>
        </vs-tr>
      </div>
    </vs-table>
  </div>
</template>

<script>
  import axios from 'axios'

  export default {
    data() {
      return {
        products: []
      }
    },
    mounted: function () {
      var that;
      that = this;
      axios.get(`api/products.json`)
        .then(response => {
          that.products = response.data;
      });
    },
  }
</script>

<style lang="scss">
.con-expand-users {
  .con-btns-user {
    display: flex;
    padding: 10px;
    padding-bottom: 0px;
    align-items: right;
    justify-content: space-between;
    .con-userx {
      display: flex;
      align-items: center;
      justify-content: flex-start;
    }
  }
  .list-icon {
    i {
      font-size: .9rem !important;
    }
  }
}
</style>