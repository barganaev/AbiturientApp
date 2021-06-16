import 'package:abiturient_app/blocs/all_colleges_bloc/all_colleges_bloc.dart';
import 'package:abiturient_app/screens/home_screen.dart';
import 'package:abiturient_app/widgets/appbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CollegeScreen extends StatefulWidget {

  @override
  _CollegeScreenState createState() => _CollegeScreenState();
}

class _CollegeScreenState extends State<CollegeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(MediaQuery.of(context).size.height * 0.1),
          child: AppBarWidget(title: "Колледж",)),
      drawer: MyHomeScreen(),
      body: BlocProvider<AllCollegesBloc>(
        create: (context) => AllCollegesBloc()..add(AllCollegesGetEvent()),
        child: BlocBuilder<AllCollegesBloc, AllCollegesState>(
            builder: (context, state) {
              if (state is AllCollegesLoadedState) {
                return ListView.builder(
                    itemCount: state.allCollegesModel.data.list.length,
                    itemBuilder: (context, index) {
                      // List<ListElement> list_of_colleges = state.allCollegesModel.data.list;
                      return Container(
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height * 0.05, horizontal: MediaQuery.of(context).size.width * 0.1),
                              child: Container(
                                // color: Colors.red,
                                height: MediaQuery.of(context).size.height * 0.3,
                                child: Card(
                                  semanticContainer: true,
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  child: Container(
                                    padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.03),
                                    child: SingleChildScrollView(
                                      child: Column(
                                        children: [
                                          Text('${state.allCollegesModel.data.list[index].name}'),
                                          Text('${state.allCollegesModel.data.list[index].address}'),
                                          Text('${state.allCollegesModel.data.list[index].phoneNumber}'),
                                          Text('${state.allCollegesModel.data.list[index].regionName}'),
                                          Text('${state.allCollegesModel.data.list[index].ownershipName}'),
                                        ],
                                      ),
                                    ),
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  elevation: 10,
                                ),
                              ),
                            ),
                            // Text('${state.allCollegesModel.data.list[index].name}'),
                            Divider(),
                          ],
                        ),
                      );
                    }
                );
              } else if (state is AllCollegesLoadingState) {
                return Center(child: CircularProgressIndicator(),
                );
              } else if (state is AllCollegesErrorState) {
                return Center(
                  child: Text('Look for request_screen.dart'),
                );
              } else {
                return Center(
                  child: Text('Error in request_screen.dart'),
                );
              }
            }
        ),
      ),
    );
  }
}
