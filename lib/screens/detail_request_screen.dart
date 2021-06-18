import 'package:abiturient_app/blocs/detail_order_bloc/orders_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailRequestScreen extends StatefulWidget {
  // int id;
  String id;
  DetailRequestScreen({@required this.id});
  // const DetailRequestScreen({Key? key}) : super(key: key);

  @override
  _DetailRequestScreenState createState() => _DetailRequestScreenState();
}

class _DetailRequestScreenState extends State<DetailRequestScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocProvider<DetailOrderBloc>(
      create: (context) => DetailOrderBloc()
        ..add(
          DetailOrderGetEvent(
            requestId: widget.id.toString(),
          ),
        ),
      child: BlocBuilder<DetailOrderBloc, DetailOrderState>(
        builder: (context, state) {
          if (state is DetailOrderLoadedState) {
            return SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).size.height * 0.1,
                  horizontal: MediaQuery.of(context).size.width * 0.08,
                ),
                child: Column(
                  children: [
                    Center(
                        child: Text(
                      '${state.detailOrderModel.data.block.mainInfo.name}',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.05,
                    ),
                    Text(
                        '${state.detailOrderModel.data.block.mainInfo.values.citizenStatus.name}'),
                    Text(
                        '${state.detailOrderModel.data.block.mainInfo.values.citizenStatus.value}'),
                    Divider(
                      color: Colors.black,
                    ),
                    // Text('${state.detailOrderModel.data.block.mainInfo.values.regionName.name}'),
                    // Text('${state.detailOrderModel.data.block.mainInfo.values.regionName.value}'),
                    // Divider(color: Colors.black,),
                    // Text('${state.detailOrderModel.data.block.mainInfo.values.statusName.name}'),
                    // Text('${state.detailOrderModel.data.block.mainInfo.values.statusName.value}'),
                    // Divider(color: Colors.black,),
                    // Text('${state.detailOrderModel.data.block.mainInfo.values.declarantTypeName.name}'),
                    // Text('${state.detailOrderModel.data.block.mainInfo.values.declarantTypeName.value}'),
                    // Divider(color: Colors.black,),
                    // Text('${state.detailOrderModel.data.block.mainInfo.values.nationalityName.name}'),
                    // Text('${state.detailOrderModel.data.block.mainInfo.values.nationalityName.value}'),
                    // Divider(color: Colors.black,),
                    // Text('${state.detailOrderModel.data.block.mainInfo.values.iin.name}'),
                    // Text('${state.detailOrderModel.data.block.mainInfo.values.iin.value}'),
                    // Divider(color: Colors.black,),
                    // Text('${state.detailOrderModel.data.block.mainInfo.values.fullName.name}'),
                    // Text('${state.detailOrderModel.data.block.mainInfo.values.fullName.value}'),
                    // Divider(color: Colors.black,),
                    // Text('${state.detailOrderModel.data.block.mainInfo.values.birthday.name}'),
                    // Text('${state.detailOrderModel.data.block.mainInfo.values.birthday.value}'),
                    // Divider(color: Colors.black,),
                    // Text('${state.detailOrderModel.data.block.mainInfo.values.graduationYear.name}'),
                    // Text('${state.detailOrderModel.data.block.mainInfo.values.graduationYear.value}'),
                    // Divider(color: Colors.black,),
                    // Text('${state.detailOrderModel.data.block.mainInfo.values.email.name}'),
                    // Text('${state.detailOrderModel.data.block.mainInfo.values.email.value}'),
                    // Divider(color: Colors.black,),
                    // Text('${state.detailOrderModel.data.block.mainInfo.values.phoneNumber.name}'),
                    // Text('${state.detailOrderModel.data.block.mainInfo.values.phoneNumber.value}'),
                    // Divider(color: Colors.black,),
                    // Text('${state.detailOrderModel.data.block.mainInfo.values.parentPhoneNumber.name}'),
                    // Text('${state.detailOrderModel.data.block.mainInfo.values.parentPhoneNumber.value}'),
                    // Divider(color: Colors.black,),
                    // Text('${state.detailOrderModel.data.block.mainInfo.values.educationTypeName.name}'),
                    // Text('${state.detailOrderModel.data.block.mainInfo.values.educationTypeName.value}'),
                    // Divider(color: Colors.black,),
                    // Text('${state.detailOrderModel.data.block.mainInfo.values.educationDocument.name}'),
                    // Text('${state.detailOrderModel.data.block.mainInfo.values.educationDocument.value}'),
                    // Divider(color: Colors.black,),
                  ],
                ),
              ),
            );
          } else if (state is DetailOrderLoadingState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Center(
              child: Text("Error"),
            );
          }
        },
      ),
    ));
  }
}
