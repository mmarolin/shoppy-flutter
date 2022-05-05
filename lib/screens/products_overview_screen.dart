import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../providers/products.dart';

import '../widgets/products_grid.dart';

enum FilterOptions {
  Favorites,
  All,
}

class ProductsOverviewScreen extends StatefulWidget {
  @override
  State<ProductsOverviewScreen> createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  var _showOnlyFavorites = false;

  @override
  Widget build(BuildContext context) {
    final productsContainer = Provider.of<Products>(context, listen: false);

    return Scaffold(
        body: NestedScrollView(
      floatHeaderSlivers: true,
      headerSliverBuilder: ((context, innerBoxIsScrolled) => [
            SliverAppBar(
              floating: true,
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
              actions: <Widget>[
                Container(
                  padding: EdgeInsets.only(bottom: 8),
                  child: PopupMenuButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide.none,
                    ),
                    elevation: 2,
                    icon: Icon(
                      Icons.more_vert,
                    ),
                    itemBuilder: (_) => [
                      PopupMenuItem(
                          padding: EdgeInsets.only(right: 0, left: 12),
                          child: Container(
                              child: Text('Show Favorites'), width: 90),
                          value: FilterOptions.Favorites),
                      PopupMenuItem(
                          padding: EdgeInsets.only(right: 0, left: 12),
                          child: Container(child: Text('Show All'), width: 90),
                          value: FilterOptions.All),
                    ],
                    onSelected: (FilterOptions selectedValue) {
                      setState(() {
                        if (selectedValue == FilterOptions.Favorites) {
                          _showOnlyFavorites = true;
                        } else {
                          _showOnlyFavorites = false;
                        }
                      });
                    },
                  ),
                ),
              ],
              backgroundColor: Colors.transparent,
              centerTitle: true,
              elevation: 0,
            ),
          ]),
      body: ProductsGrid(_showOnlyFavorites),
    ));
  }
}
