import 'package:bloc/bloc.dart';
import 'package:call_api_huan/apis/subject.dart';
import 'package:call_api_huan/states/SubjectState.dart';
class SubjectBloc extends Cubit<SubjectState>{
  SubjectBloc(): super(SubjectStateInitial());
  init() async{
    final data = await getSubject();
    emit(SubjectStateSuccess(subjects: data));
  }
}