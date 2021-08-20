part of 'doa_cubit.dart';

abstract class DoaState extends Equatable{
  const DoaState();
  @override
  List<Object> get props=>[];
}

class DoaUninitialized extends DoaState{}

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

class PostDoaLoading extends DoaState{}
class PostDoaLoaded extends DoaState{
  final ResponsePostDoa postDoa;
  PostDoaLoaded(this.postDoa);
  @override
  List<Object> get props => [postDoa];
}
class PostDoaFailed extends DoaState{
  final String message;
  PostDoaFailed(this.message);
  @override
  List<Object> get props => [message];
}

class PostBerdoaDoaLoading extends DoaState{}
class PostBerdoaLoaded extends DoaState{
  PostBerdoaLoaded();
  @override
  List<Object> get props => [];
}
class PostBerdoaFailed extends DoaState{
  final String message;
  PostBerdoaFailed(this.message);
  @override
  List<Object> get props => [message];
}


// abstract class PostDoaState extends Equatable{
//   const PostDoaState();
//   @override
//   List<Object> get props=>[];
// }
// class PostDoaLoading extends PostDoaState{}
// class PostDoaLoaded extends PostDoaState{
//   final ResponsePostDoa doaModel;
//   PostDoaLoaded(this.doaModel);
//   @override
//   List<Object> get props => [doaModel];
// }
// class PostDoaFailed extends PostDoaState{
//   final String message;
//   PostDoaFailed(this.message);
//   @override
//   List<Object> get props => [message];
// }