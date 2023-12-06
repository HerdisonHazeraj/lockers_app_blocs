part of 'my_user_bloc.dart';

@immutable
sealed class MyUserEvent extends Equatable {
  const MyUserEvent();

  @override
  List<Object> get props => [];
}

class GetMyUser extends MyUserEvent {
  final String myUserId;

  const GetMyUser({required this.myUserId});

  @override
  List<Object> get props => [myUserId];
}
