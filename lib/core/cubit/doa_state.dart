part of 'doa_cubit.dart';

abstract class DoaState extends Equatable{
  const DoaState();

  @override
  List<Object> get props=>[];
}

class DoaLoading extends DoaState{}
class DoaLoaded extends DoaState{
  final DoaModel doaModel;
  DoaLoaded(this.doaModel);
  @override
  List<Object> get props => [doaModel];
}
class DoaFailed extends DoaState{
  final String message;
  DoaFailed(this.message);
  @override
  List<Object> get props => [message];
}