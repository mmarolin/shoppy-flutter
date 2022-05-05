import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../providers/product.dart';

import '../widgets/products_grid.dart';

class ProductsOverviewScreen extends StatelessWidget {
  final List<Product> products = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: Text(
            'Shoppy',
            style: GoogleFonts.pacifico(
              fontSize: 28,
              letterSpacing: 2,
            ),
          ),
        ),
        backgroundColor: Colors.transparent,
        centerTitle: true,
        elevation: 0,
      ),
      body: ProductsGrid(),
    );
  }
}
