import 'package:flutter/material.dart';
import 'models/product.dart';
import 'screens/cart_screen.dart';
import 'screens/detail_screen.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const MiniCatalogApp());
}

class MiniCatalogApp extends StatefulWidget {
  const MiniCatalogApp({super.key});

  @override
  State<MiniCatalogApp> createState() => _MiniCatalogAppState();
}

class _MiniCatalogAppState extends State<MiniCatalogApp> {
  final List<Product> _cartItems = [];
  final Set<int> _favoriteIds = {};

  void _addToCart(Product product) {
    setState(() {
      _cartItems.add(product);
    });
  }

  void _removeFromCart(Product product) {
    setState(() {
      _cartItems.remove(product);
    });
  }

  void _clearCart() {
    setState(() {
      _cartItems.clear();
    });
  }

  void _toggleFavorite(int productId) {
    setState(() {
      if (_favoriteIds.contains(productId)) {
        _favoriteIds.remove(productId);
      } else {
        _favoriteIds.add(productId);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mini Katalog',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF2563EB)),
        scaffoldBackgroundColor: Colors.white,
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(
              cartItems: _cartItems,
              favoriteIds: _favoriteIds,
              onToggleFavorite: _toggleFavorite,
              onAddToCart: _addToCart,
            ),
        '/detail': (context) => DetailScreen(
              onAddToCart: _addToCart,
              favoriteIds: _favoriteIds,
              onToggleFavorite: _toggleFavorite,
            ),
        '/cart': (context) => CartScreen(
              cartItems: _cartItems,
              onRemoveFromCart: _removeFromCart,
              onClearCart: _clearCart,
            ),
      },
    );
  }
}
