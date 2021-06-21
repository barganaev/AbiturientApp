import 'package:abiturient_app/blocs/FAQ_bloc/faq_bloc.dart';
import 'package:abiturient_app/screens/drawer_screen.dart';
import 'package:abiturient_app/widgets/appbar_widget.dart';
import 'package:abiturient_app/widgets/on_will_scope.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FaqScreen extends StatefulWidget {
  @override
  _FaqScreenState createState() => _FaqScreenState();
}

class _FaqScreenState extends State<FaqScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => willPopCallback(context),
      child: Scaffold(
        appBar: appBarMy("Вопросы и ответы"),
        drawer: MyDrawer(),
        body: BlocProvider<FaqBloc>(
          create: (context) => FaqBloc()..add(FaqGetEvent()),
          child: BlocBuilder<FaqBloc, FaqState>(
            builder: (context, state) {
              if (state is FaqLoadedState) {
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: state.faqModel.data.length,
                        itemBuilder: (context, index) {
                          return Card(
                            elevation: 2,
                            child: ClipRRect(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(5),
                                topRight: Radius.circular(5),
                              ),
                              child: ExpansionTile(
                                title: Text(state.faqModel.data[index].question
                                    .toString()),
                                children: [
                                  Divider(),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical:
                                            MediaQuery.of(context).size.height *
                                                0.01,
                                        horizontal:
                                            MediaQuery.of(context).size.width *
                                                0.05),
                                    child: Text(
                                      state.faqModel.data[index].answer
                                          .toString(),
                                      style: TextStyle(
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.045,
                                          fontWeight: FontWeight.w300),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                );
              } else if (state is FaqLoadingState) {
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
        ),
      ),
    );
  }
}
