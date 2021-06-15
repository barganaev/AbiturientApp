import 'package:abiturient_app/blocs/all_colleges_bloc/all_colleges_bloc.dart';
import 'package:abiturient_app/blocs/colleges_by_region_bloc/colleges_by_region_bloc.dart';
import 'package:abiturient_app/blocs/my_orders_bloc/my_orders_bloc.dart';
import 'package:abiturient_app/blocs/regions_bloc/regions_bloc.dart';
import 'package:abiturient_app/models/detail_order_model.dart';
import 'package:abiturient_app/screens/home_screen.dart';
import 'package:abiturient_app/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

import 'blocs/detail_order_bloc/orders_bloc.dart';

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
      home: MultiBlocProvider(
        providers: [
          BlocProvider<DetailOrderBloc>(
            // lazy: false,
            create: (context) => DetailOrderBloc()..add(DetailOrderGetEvent()),
          ),
          BlocProvider<MyOrdersBloc>(
            // lazy: false,
            create: (context) => MyOrdersBloc()..add(MyOrdersGetEvent()),
          ),
          BlocProvider<AllCollegesBloc>(
            // lazy: false,
            create: (context) => AllCollegesBloc()..add(AllCollegesGetEvent()),
          ),
          BlocProvider<CollegesByRegionBloc>(
            // lazy: false,
            create: (context) =>
                CollegesByRegionBloc()..add(CollegesByRegionGetEvent(id: "1")),
          ),
          BlocProvider<RegionsBloc>(
            lazy: false,
            create: (context) => RegionsBloc()..add(RegionsGetEvent()),
          ),
        ],
        child: LoginScreen(),
      ), // MyHomeScreen(),
    );
  }
}
