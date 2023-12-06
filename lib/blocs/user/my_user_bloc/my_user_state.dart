part of 'my_user_bloc.dart';

enum MyUserStatus { success, loading, failure }

@immutable
class MyUserState extends Equatable {
  const MyUserState._({
    this.status = MyUserStatus.loading,
    this.user,
  });

  final MyUserStatus status;
  final MyUser? user;

  const MyUserState.loading() : this._();

  const MyUserState.success(MyUser user)
      : this._(status: MyUserStatus.success, user: user);

  const MyUserState.failure() : this._(status: MyUserStatus.failure);

  @override
  List<Object?> get props => [status, user];
}
