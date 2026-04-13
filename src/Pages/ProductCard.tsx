import React, { useState, useMemo, useCallback } from 'react';

// --- 1. MEMOIZED PRODUCT CARD ---
// React.memo prevents re-rendering unless the 'product' or 'onSelect' props change.
interface ProductCardProps {
  product: { id: number; name: string; price: number };
  onSelect: (id: number) => void;
}

const ProductCard = React.memo(({ product, onSelect }: ProductCardProps) => {
  console.log(`Rendering: ${product.name}`); // Watch this in the console
  return (
    <div 
      onClick={() => onSelect(product.id)}
      style={{
        border: '1px solid #ccc',
        padding: '10px',
        margin: '5px',
        borderRadius: '8px',
        cursor: 'pointer',
        background: '#f9f9f9'
      }}
    >
      <h3>{product.name}</h3>
      <p>${product.price}</p>
    </div>
  );
});

// --- 2. DUMMY DATA GENERATOR ---
const allProducts = Array.from({ length: 200 }, (_, i) => ({
  id: i,
  name: `Product ${i + 1}`,
  price: Math.floor(Math.random() * 100) + 1,
}));

export default function App() {
  const [searchTerm, setSearchTerm] = useState("");

  // --- 3. STABILIZE CALLBACKS ---
  // useCallback ensures the function reference doesn't change on every keystroke.
  // Without this, React.memo on the ProductCard would fail.
  const handleSelect = useCallback((id: number) => {
    alert(`Selected Product ID: ${id}`);
  }, []);

  // --- 4. MEMOIZE FILTERED LIST ---
  // Only recalculates the filtered list when searchTerm changes.
  const filteredProducts = useMemo(() => {
    return allProducts.filter(p => 
      p.name.toLowerCase().includes(searchTerm.toLowerCase())
    );
  }, [searchTerm]);

  return (
    <div style={{ padding: '20px', fontFamily: 'sans-serif' }}>
      <h1>Product Browser</h1>
      
      <input
        type="text"
        placeholder="Search 200 products..."
        value={searchTerm}
        onChange={(e) => setSearchTerm(e.target.value)}
        style={{
          padding: '10px',
          width: '100%',
          fontSize: '16px',
          marginBottom: '20px'
        }}
      />

      <div style={{ 
        display: 'grid', 
        gridTemplateColumns: 'repeat(auto-fill, minmax(150px, 1fr))' 
      }}>
        {filteredProducts.map(product => (
          <ProductCard 
            key={product.id} 
            product={product} 
            onSelect={handleSelect} 
          />
        ))}
      </div>
      
      {filteredProducts.length === 0 && <p>No products found.</p>}
    </div>
  );
}
