import 'package:abiturient_app/blocs/my_orders_bloc/orders_bloc.dart';
import 'package:abiturient_app/models/my_orders.dart';
import 'package:abiturient_app/screens/home_screen.dart';
import 'package:abiturient_app/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appDirectory = await path_provider.getApplicationDocumentsDirectory();
  Hive.init(appDirectory.path);
  await Hive.openBox('myBox');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider<OrdersBloc>(
        lazy: false,
        create: (context) => OrdersBloc()..add(OrdersGetEvent()),
        child: LoginScreen(),
      ), // MyHomeScreen(),
    );
  }
}
