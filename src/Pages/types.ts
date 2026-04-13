export interface OrderItem {
  id: string;
  name: string;
  price: number;
}

export interface OrderResponse {
  id: string;
  total: number | null;
  status?: string;
  items: OrderItem[];
}
