
-- Update hero-product section to add packOptions for display
UPDATE landing_pages
SET sections = jsonb_set(
  sections,
  '{0,settings,packOptions}',
  '[{"label": "শুধু জুব্বা", "price": "1700"}, {"label": "কম্বো প্যাক", "price": "2000", "originalPrice": "2400"}]'::jsonb
)
WHERE slug = 'LP-premium-jubba';

-- Update checkout-form section (index 8) to add packOptions for selection
UPDATE landing_pages
SET sections = jsonb_set(
  sections,
  '{8,settings,packOptions}',
  '[{"id": "jubba_only", "label": "শুধু জুব্বা", "price": 1700, "description": "১টি প্রিমিয়াম জুব্বা"}, {"id": "combo_pack", "label": "কম্বো প্যাক (জুব্বা + পাজামা)", "price": 2000, "description": "জুব্বা ও পাজামা একসাথে - সেরা ডিল!"}]'::jsonb
)
WHERE slug = 'LP-premium-jubba';
