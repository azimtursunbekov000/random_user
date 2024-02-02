part of 'user_bloc.dart';

@immutable
sealed class UserState {}

final class UserInitialState extends UserState {}

final class UserLoadingState extends UserState {}

final class UserLoadedState extends UserState {
  final UserModel userModel;
  UserLoadedState({required this.userModel});
}

final class UserErrorState extends UserState {
  final CatchException error;

  UserErrorState({required this.error});
}
