import Vue from 'vue'
import Vuesax from 'vuesax'
import VueRouter from 'vue-router'
import App from '../components/app.vue'
import Routes from '../components/routes';

import 'vuesax/dist/vuesax.css'
import 'material-icons/iconfont/material-icons.css'

Vue.use(Vuesax)
Vue.use(VueRouter)

const router = new VueRouter({
  routes: Routes.routes,
});

router.replace('/orders');

document.addEventListener('DOMContentLoaded', () => {
  const el = document.body.appendChild(document.createElement('application'))
  const app = new Vue({
    el,
    router,
    render: h => h(App)
  })

  console.log(app)
})
