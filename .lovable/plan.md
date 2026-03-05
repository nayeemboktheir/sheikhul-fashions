

## Fix: Pack price calculation ignores quantity

### Problem
When "শুধু জুব্বা" (single, ৳1,700) is selected and user picks Red × 2, the subtotal shows ৳1,700 instead of ৳3,400. The code uses `packOption.price` as a flat override regardless of quantity.

The logic should be:
- **Single pack**: price per item × quantity (e.g., 1700 × 2 = 3400)
- **Combo pack**: fixed bundle price (e.g., 2000 for any 2 jubbas)

### Fix (2 files)

**1. `src/pages/LandingPage.tsx`** — Update subtotal calculation in both the display logic (~line 682) and the submit handler (~line 351):

```typescript
// For combo pack: use fixed pack price
// For single/other packs: use per-item pack price × total quantity
// No pack: use variant-based pricing
const totalQuantity = selectedItems.reduce((sum, item) => sum + item.quantity, 0);
const subtotal = selectedPackOption
  ? (selectedPackOption.id === 'combo' 
      ? selectedPackOption.price 
      : selectedPackOption.price * (totalQuantity || 1))
  : selectedItems.reduce((sum, item) => sum + item.variation.price * item.quantity, 0);
```

Also update `packPriceOverride` in the submit handler to only send override for combo:
```typescript
packPriceOverride: packOption?.id === 'combo' ? packOption.price : null,
```

**2. No edge function changes needed** — For single pack, no override is sent, so the backend calculates from item prices normally. For combo, the override is sent as before.

