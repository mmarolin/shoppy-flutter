import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

import '../screens/products_overview_screen.dart';
import '../screens/product_detail_screen.dart';
import '../providers/product.dart';

class ProductItem extends StatelessWidget {
  // final String id;
  // final String title;
  // final String imageUrl;

  // ProductItem(this.id, this.title, this.imageUrl);

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context, listen: false);
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: GridTile(
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(
              ProductDetailScreen.routeName,
              arguments: product.id,
            );
          },
          child: Image.network(
            product.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        footer: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            height: 40,
            child: GridTileBar(
              title: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  product.title,
                  textAlign: TextAlign.center,
                ),
              ),
              backgroundColor: Colors.black45,
              leading: Container(
                width: 30,
                child: Consumer<Product>(
                  builder: (ctx, product, child) => IconButton(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    icon: Icon(
                      product.isFavorite
                          ? Icons.favorite
                          : Icons.favorite_border_outlined,
                      size: 18,
                      color: product.isFavorite ? Colors.red : Colors.white,
                    ),
                    onPressed: () {
                      product.toggleFavorite();
                    },
                  ),
                ),
              ),
              trailing: Container(
                width: 30,
                child: IconButton(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  icon: Icon(Icons.shopping_basket_outlined, size: 18),
                  onPressed: () {},
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
