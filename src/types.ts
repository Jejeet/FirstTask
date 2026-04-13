export interface OrderItem {
  id: string;
  name: string;
  price: number;
}

export interface OrderResponse {
  id: string;
  // Optional: field may not exist in the response
  status?: 'pending' | 'shipped' | 'delivered'; 
  // Nullable: field exists but can be null
  total: number | null; 
  items: OrderItem[];
}