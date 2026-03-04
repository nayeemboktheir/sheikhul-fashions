

## Plan: Remove Storefront, Keep Admin + Landing Pages + Checkout

### Changes to `src/App.tsx`:

1. **Remove storefront-only imports**: HomePage, ProductsPage, ProductDetailPage, CartPage, WishlistPage, AboutPage, ContactPage, MyAccountPage, NotFound, Header, Footer, CartDrawer, SocialChatWidget
2. **Remove `StoreLayout` component**
3. **Remove storefront-only routes**: `/`, `/products`, `/products/:slug`, `/cart`, `/wishlist`, `/about`, `/contact`, `/my-account`
4. **Keep checkout-related routes**: `/checkout`, `/order-confirmation`, `/auth` (needed for checkout auth)
5. **Keep landing page route**: `/lp/:slug`
6. **Keep all admin routes**
7. **Add `Navigate` import** and redirect `/` and `*` to `/admin`

### Routes after change:
- `/` → redirect to `/admin`
- `/checkout` → CheckoutPage
- `/order-confirmation` → OrderConfirmationPage
- `/auth` → AuthPage
- `/lp/:slug` → LandingPage
- `/admin/*` → all admin routes
- `*` → redirect to `/admin`

