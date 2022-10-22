import 'package:call_api_huan/blocs/subject_bloc.dart';
import 'package:call_api_huan/states/SubjectState.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TumiApp extends StatefulWidget {
  const TumiApp({Key? key}) : super(key: key);

  @override
  State<TumiApp> createState() => _TumiAppState();
}

class _TumiAppState extends State<TumiApp> {
  late SubjectBloc subjectBloc;
  final _scrollController = ScrollController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    subjectBloc = SubjectBloc()..init();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<SubjectBloc,SubjectState>(
          bloc: subjectBloc,
          builder: (context,state) {
            if(state is SubjectStateInitial){
              return Center(child: CircularProgressIndicator(),);
            }
            if(state is SubjectStateFailure){
              return Center(
                child: Text('Can\'t not load'),
              );
            }
            if(state is SubjectStateSuccess){
              if(state.subjects.isEmpty){
                return Center(child: Text('Empty'),);
              }
              return ListView.builder(
                itemBuilder: (BuildContext buildContext, int index){
                  if(index >= state.subjects.length){
                    return Container(
                      alignment: Alignment.center,
                      child: Center(
                        child: SizedBox(
                          width: 40,
                          height: 40,
                          child: CircularProgressIndicator(
                            strokeWidth: 1.5,
                          ),
                        ),
                      ),
                    );
                  }else {
                    return ListTile(
                      leading: SizedBox(
                        height: 80,
                        width: 80,
                        child: Text(state.subjects[index].name),
                      ),
                      title: Text('${state.subjects[index].description}'),
                      // isThreeLine: true,
                      subtitle: Text('Hello'),
                    );
                  }
                },
                itemCount: state.subjects.length,
                controller: _scrollController,
              );
            }
            return Center(
              child: Text('Other state'),
            );
          },
        ),
      ),
    );
  }
}
