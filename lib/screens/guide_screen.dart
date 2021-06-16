import 'package:abiturient_app/blocs/regions_bloc/regions_bloc.dart';
import 'package:abiturient_app/models/regions_model.dart';
import 'package:abiturient_app/widgets/appbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GuideScreen extends StatefulWidget {
  List<RegionsModel> list;
  GuideScreen({this.list});

  @override
  _GuideScreenState createState() => _GuideScreenState();
}

class _GuideScreenState extends State<GuideScreen> {
  String selectedRegion;
  int indexOfCity = 0;
  int _value = 1;

  // void onChangedCallback(region) async {
  //   selectedRegion = region;
  //   for (int i = 0; i < widget.list.length; i++) {
  //     if (region == widget.list[i].data[i].name) {
  //       setState(() {
  //         indexOfCity = i;
  //         BlocProvider.of<RegionsBloc>(_scaffoldState.currentContext)
  //             .add(RegionsGetEvent(
  //             regionId: widget.list[i].id.toString()));
  //       });
  //     }
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(MediaQuery.of(context).size.height * 0.1),
          child: AppBarWidget(title: "Колледж",)),
      body: MultiBlocProvider(
        providers: [
          BlocProvider<RegionsBloc>(
            create: (context) => RegionsBloc()..add(RegionsGetEvent()),
          ),
        ],
        child: BlocBuilder<RegionsBloc, RegionsState>(
          builder: (context, state){
            if (state is RegionsLoadedState) {
              // selectedRegion = widget.list[indexOfCity].name;
              selectedRegion = state.regionsModel.data[indexOfCity].name;
              return Align(
                alignment: Alignment.topCenter,
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.7,
                  padding: EdgeInsets.only(left: 10),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey)
                  ),
                  child: DropdownButton(
                    isExpanded: true,
                    value: selectedRegion,
                    items: state.regionsModel.data.map((Datum value) {
                      return DropdownMenuItem(
                        value: value.name ?? "text",
                        child: Text(value.name ?? "text"),
                      );
                    }).toList(),
                    // onChanged: onChangeCallback,
                    //     (value) {
                    //   setState(() {
                    //     _value = value;
                    //   });
                    // },
                  ),
                ),
              );
            } else if (state is RegionsLoadingState) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is RegionsErrorState) {
              return Center(
                child: Text('look for guide_screen.dart'),
              );
            } else {
              return Center(
                child: Text('Error in guide_screen.dart'),
              );
            }
          },
        ),
      ),
    );
  }
}
