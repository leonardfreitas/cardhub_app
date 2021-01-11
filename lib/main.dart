import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './routes/routes.dart';
import './ui/themes/themes.dart';
import './controllers/controllers.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => new AuthController(),
        ),
      ],
      child: MaterialApp(
        title: 'Cardhub',
        debugShowCheckedModeBanner: false,
        theme: primaryThemeData,
        routes: AppPages.routes,
      ),
    );
  }
}
