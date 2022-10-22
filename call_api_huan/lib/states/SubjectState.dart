import '../models/subject.dart';
import 'package:equatable/equatable.dart';

abstract class SubjectState extends Equatable {
  const SubjectState();

  @override
  // TODO: implement props
  List<Object?> get props => [];

}

class SubjectStateInitial extends SubjectState {}

class SubjectStateFailure extends SubjectState {}

class SubjectStateSuccess extends SubjectState {
  final List<Item> subjects;

  const SubjectStateSuccess({required this.subjects});

  SubjectStateSuccess copyWith({required List<Item> subject}){
    return SubjectStateSuccess(
      subjects: subjects?? this.subjects,
    );

  }

}
