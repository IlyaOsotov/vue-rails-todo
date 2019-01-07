<template lang="html">
  <div>
    <vs-table
      :data="orders">
      <div slot="header">
        <h3>
          Заказы
        </h3>
      </div>
      <div slot="thead">
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
          Тип доставки
        </vs-th>
      </div>

      <div slot-scope="{data}">
        <vs-tr :data="tr" :key="indextr" v-for="(tr, indextr) in data" >
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
          <vs-td :data="tr.delivery_type">
            {{tr.delivery_type}}
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
export default {
  data:()=>({
    orders: []
  })
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