import Vue from 'vue'
import Vuesax from 'vuesax'
import App from '../components/app.vue'

import 'vuesax/dist/vuesax.css'
import 'material-icons/iconfont/material-icons.css'

Vue.use(Vuesax)

document.addEventListener('DOMContentLoaded', () => {
  const el = document.body.appendChild(document.createElement('application'))
  const app = new Vue({
    el,
    render: h => h(App)
  })

  console.log(app)
})
