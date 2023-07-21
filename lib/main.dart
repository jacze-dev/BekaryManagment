import 'package:flutter/material.dart';
import 'package:kal_dabo/screens/product_detail.dart';
import 'package:kal_dabo/screens/product_edit_screen.dart';
import 'package:provider/provider.dart';

import 'screens/archive_screen.dart';
import './screens/loans_screen.dart';
import './providers/loan.dart';
import './providers/items.dart';
import './screens/withdrwal_screen.dart';
import './providers/withdrwal.dart';
import './providers/loan_cart.dart';
import './screens/order_screen.dart';
import './providers/order_cart.dart';
import './providers/order.dart';
import './screens/edit_order_screen.dart';
import './screens/daily_sells_screen.dart';
import './screens/product_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Items(),
        ),
        ChangeNotifierProvider(
          create: (context) => Loans(),
        ),
        ChangeNotifierProvider(
          create: (context) => Withdrwals(),
        ),
        ChangeNotifierProvider(
          create: (context) => LoanItems(),
        ),
        ChangeNotifierProvider(
          create: (context) => OrderItems(),
        ),
        ChangeNotifierProvider(
          create: (context) => Orders(),
        ),
      ],
      child: MaterialApp(
        title: 'Bekary',
        theme: ThemeData(
          primarySwatch: Colors.brown,
          colorScheme: const ColorScheme(
              brightness: Brightness.light,
              primary: Colors.brown,
              onPrimary: Color.fromARGB(255, 49, 19, 19),
              secondary: Color.fromARGB(255, 209, 187, 20),
              onSecondary: Color.fromARGB(255, 209, 187, 20),
              error: Colors.red,
              onError: Colors.redAccent,
              background: Colors.white,
              onBackground: Colors.white54,
              surface: Colors.black54,
              onSurface: Colors.black87),
          fontFamily: 'OpenSans',
          textTheme: TextTheme(
            titleSmall: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              foreground: Paint()..color = Color.fromARGB(255, 0, 0, 0),
              fontFamily: 'OpenSans',
            ),
            titleMedium: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              foreground: Paint()..color = Color.fromARGB(255, 12, 12, 12),
              fontFamily: 'OpenSans',
            ),
            titleLarge: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              foreground: Paint()..color = Color.fromARGB(255, 0, 0, 0),
              fontFamily: 'OpenSans',
            ),
            // ignore: prefer_const_constructors
            bodySmall: TextStyle(
              fontSize: 10,
              fontFamily: 'Quicksand',
            ),
            bodyMedium: const TextStyle(
              fontSize: 16,
              fontFamily: 'Quicksand',
            ),
            bodyLarge: const TextStyle(
              fontSize: 22,
              fontFamily: 'Quicksand',
            ),
          ),
        ),
        //home: DailySellsScreen(),
        initialRoute: DailySellsScreen.routeName,
        routes: {
          ArchiveScreen.routeName: (context) => ArchiveScreen(),
          LoanScreen.routeName: (context) => LoanScreen(),
          WithdrwalScreen.routeName: (context) => WithdrwalScreen(),
          OrderScreen.routeName: (context) => OrderScreen(),
          EditOrderScreen.routeName: (context) => EditOrderScreen(),
          DailySellsScreen.routeName: (context) => DailySellsScreen(),
          ProductScreern.routeName: (context) => ProductScreern(),
          ProductEditScreen.routeName: (context) => ProductEditScreen(),
          ProductDetail.routeName: (context) => ProductDetail()
        },
      ),
    );
  }
}
