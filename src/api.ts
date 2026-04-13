import { OrderResponse } from './types';

export const fetchOrder = async (id: string): Promise<OrderResponse> => {
  const response = await fetch(`https://example.com{id}`);
  
  if (!response.ok) {
    throw new Error('Failed to fetch order');
  }

  // Casting the JSON to our specific interface
  return response.json() as Promise<OrderResponse>;
};