import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import './screens/products_overview_screen.dart';
import './screens/product_detail_screen.dart';
import './providers/products.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.transparent,
    statusBarColor: Colors.transparent,
  ));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => Products(),
      child: MaterialApp(
          title: 'Shoppy',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.orange),
              scaffoldBackgroundColor: Color.fromARGB(255, 249, 243, 232),
              textTheme: GoogleFonts.bebasNeueTextTheme(),
              appBarTheme: AppBarTheme(
                systemOverlayStyle: SystemUiOverlayStyle.dark,
                toolbarHeight: 70,
              )),
          initialRoute: '/',
          routes: {
            '/': (ctx) => ProductsOverviewScreen(),
            ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
          }),
    );
  }
}
