import 'dart:developer';

// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';
import 'package:tab_bar/features/data/models/user_model.dart';
import 'package:tab_bar/features/domain/use_cases/user_use_case.dart';
import 'package:tab_bar/internal/helpers/catch_excertion.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserUseCase userUseCase;
  UserBloc({required this.userUseCase}) : super(UserInitialState()) {
    on<GetUserDetailInfoEvent>((event, emit) async {
      emit(UserLoadingState());

      try {
        final UserModel userModel = await userUseCase.getUserDetailInfo();

        emit(UserLoadedState(userModel: userModel));
      } catch (e) {
        log('$e');
        log("ERROR =======================");
        emit(UserErrorState(error: CatchException.convertException(e)));
      }
    });
  }
}
