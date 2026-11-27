<template>
  <div class="container">
    <h1 class="text-center">Корзина</h1>

    <CartTable />

    <div
      v-if="$store.getters.cartAsArray.length"
      class="d-flex justify-content-between align-items-center mt-4"
    >
      <h4 class="mb-0">Итого: {{ $store.getters.cartTotal }} ₽</h4>

      <button
        class="btn btn-primary btn-lg"
        :disabled="submitting"
        @click="checkout"
      >
        <span
          v-if="submitting"
          class="spinner-border spinner-border-sm me-2"
        ></span>
        Завершить оформление заказа
      </button>
    </div>

    <Alert v-if="success" v-model="success" class="alert-success mt-3" />
    <Alert v-if="error" v-model="error" class="alert-danger mt-3" />
  </div>
</template>

<script lang="ts">
import { defineComponent } from 'vue'
import axios, { AxiosError } from 'axios'

import CartTable from '@/components/cart/CartTable.vue'
import Alert from '@/components/misc/Alert.vue'

export default defineComponent({
  name: 'Cart',
  components: {
    CartTable,
    Alert,
  },
  data() {
    return {
      submitting: false,
      success: '',
      error: '',
    }
  },
  methods: {
    async checkout() {
      this.submitting = true
      this.success = ''
      this.error = ''

      try {
        const order = await axios.post('/orders', {}).then(r => r.data)
        this.success = `Заказ №${order.id} успешно оформлен!`
        this.$store.commit('clearCart')
      } catch (e) {
        const err = e as AxiosError
        this.error = err.response?.data?.detail || 'Не удалось оформить заказ. Попробуйте ещё раз.'
      } finally {
        this.submitting = false
      }
    },
  },
})
</script>
