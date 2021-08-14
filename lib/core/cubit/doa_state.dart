part of 'doa_cubit.dart';

abstract class DoaState extends Equatable{
  const DoaState();
  @override
  List<Object> get props=>[];
}

class GetDoaLoading extends DoaState{}
class GetDoaLoaded extends DoaState{
  final DoaModel doaModel;
  GetDoaLoaded(this.doaModel);
  @override
  List<Object> get props => [doaModel];
}
class GetDoaFailed extends DoaState{
  final String message;
  GetDoaFailed(this.message);
  @override
  List<Object> get props => [message];
}


abstract class PostDoaState extends Equatable{
  const PostDoaState();
  @override
  List<Object> get props=>[];
}
class PostDoaLoading extends PostDoaState{}
class PostDoaLoaded extends PostDoaState{
  final ResponsePostDoa doaModel;
  PostDoaLoaded(this.doaModel);
  @override
  List<Object> get props => [doaModel];
}
class PostDoaFailed extends PostDoaState{
  final String message;
  PostDoaFailed(this.message);
  @override
  List<Object> get props => [message];
}