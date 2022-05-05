import 'package:flutter/material.dart';
import '../screens/products_overview_screen.dart';
import '../screens/product_detail_screen.dart';

class ProductItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;

  ProductItem(this.id, this.title, this.imageUrl);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: GridTile(
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(
              ProductDetailScreen.routeName,
              arguments: id,
            );
          },
          child: Image.network(
            imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        footer: GridTileBar(
          title: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              title,
              textAlign: TextAlign.center,
            ),
          ),
          backgroundColor: Colors.black38,
          leading: Container(
            width: 30,
            child: IconButton(
              icon: Icon(
                Icons.favorite_border_outlined,
                size: 16,
              ),
              onPressed: () {},
            ),
          ),
          trailing: Container(
            width: 30,
            child: IconButton(
              icon: Icon(Icons.shopping_basket_outlined, size: 16),
              onPressed: () {},
            ),
          ),
        ),
      ),
    );
  }
}
