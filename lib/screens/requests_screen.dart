import 'package:abiturient_app/blocs/my_orders_bloc/orders_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RequestsScreen extends StatefulWidget {
  @override
  _RequestsScreenState createState() => _RequestsScreenState();
}

class _RequestsScreenState extends State<RequestsScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Места'),
          centerTitle: true,
          bottom: TabBar(
            isScrollable: true,
            tabs: [
              Tab(
                text: 'мои заявки',
                // icon: Icon(Icons.add),
              ),
              Tab(
                text: 'итог собес',
                // icon: Icon(Icons.add),
              ),
              Tab(
                text: 'итоги',
                // icon: Icon(Icons.add),
              ),
            ],
          ),
        ),
        body: BlocProvider<DetailOrderBloc>(
          create: (context) => DetailOrderBloc()..add(DetailOrderGetEvent()),
          child: BlocBuilder<DetailOrderBloc, DetailOrderState>(
            builder: (context, state) {
              if (state is DetailOrderLoadedState) {
                return TabBarView(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Основные данные', style: TextStyle(fontWeight: FontWeight.bold),),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Статус гражданина: '),
                            Text('Резидент Республики Казахстан'),
                          ],
                        )
                      ],
                    ),
                    // Center(child: Text('Поданные зая. об.'),),
                    Column(
                      children: [
                        ElevatedButton(onPressed: (){
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text('Hello 1'),
                            duration: Duration(seconds: 1),));
                        }, child: Text('назн. собес')),
                        ElevatedButton(onPressed: (){
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text('Hello 2'),
                            duration: Duration(seconds: 1),));
                        }, child: Text('результат собес')),
                      ],
                    ),
                    // Center(child: Text('Center 3'),),
                    Column(
                      children: [
                        ElevatedButton(onPressed: (){
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text('Hello 1'),
                            duration: Duration(seconds: 1),));
                        }, child: Text('итоги грантов')),
                        ElevatedButton(onPressed: (){
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text('Hello 2'),
                            duration: Duration(seconds: 1),));
                        }, child: Text('не освоенные')),
                      ],
                    ),
                  ],
                );
              } else if (state is DetailOrderLoadingState) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is DetailOrderErrorState) {
                return Center(
                  child: Text('Look for Request_screen.dart'),
                );
              } else {
                return Center(
                  child: Text('Error in request_screen.dart'),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
