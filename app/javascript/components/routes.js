import products from './products/productList.vue';
import orders from './orders/orderList.vue';
import newOrder from './orders/newOrder.vue';

export default {
  routes: [
  { path: '/orders', name: 'orders', component: orders },
  { path: '/products', name: 'products', component: products },
  { path: '/orders/new', name: 'newOrder', component: newOrder }]
};