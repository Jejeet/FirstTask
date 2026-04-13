import { OrderResponse } from './types';

export async function fetchOrder(orderId: string): Promise<OrderResponse> {
  const res = await fetch(`/api/orders/${orderId}`);
  if (!res.ok) throw new Error(`Failed to fetch order ${orderId}`);
  return res.json();
}

export default fetchOrder;
