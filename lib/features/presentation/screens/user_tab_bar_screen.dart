import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tab_bar/features/data/models/user_model.dart';
import 'package:tab_bar/features/data/repositories/user_repository_impl.dart';
import 'package:tab_bar/features/domain/use_cases/user_use_case.dart';
import 'package:tab_bar/features/presentation/logic/bloc/user_bloc.dart';
import 'package:tab_bar/features/presentation/widgets/email_widget.dart';
import 'package:tab_bar/features/presentation/widgets/location_widget.dart';
import 'package:tab_bar/features/presentation/widgets/main_info_detail_widget.dart';
import 'package:tab_bar/internal/helpers/text_helper.dart';
import 'package:tab_bar/internal/helpers/theme_helper.dart';

class UserTabBarScreen extends StatefulWidget {
  const UserTabBarScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<UserTabBarScreen> createState() => _UserTabBarScreenState();
}

class _UserTabBarScreenState extends State<UserTabBarScreen> {
  late UserModel userModel;
  final UserBloc userBloc = UserBloc(
    userUseCase: UserUseCase(
      userRepository: UserRepositoryImpl(),
    ),
  );

  @override
  void initState() {
    userBloc.add(GetUserDetailInfoEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: ThemeColor.backgroundColor,
      body: BlocConsumer<UserBloc, UserState>(
        bloc: userBloc,
        listener: (context, state) {
          if (state is UserLoadedState) {
            userModel = state.userModel;
          }

          if (state is UserErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  state.error.message.toString(),
                ),
              ),
            );
          }
        },
        builder: (context, state) {
          if (state is UserLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is UserLoadedState) {
            return DefaultTabController(
              length: 3,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Column(
                  children: [
                    const SizedBox(height: 30),
                    Image.network(
                      userModel.results?.first.picture?.large ?? '',
                      width: 200,
                    ),
                    Text(
                      "${userModel.results?.first.name?.first} ${userModel.results?.first.name?.last}",
                      style: TextHelper.w600s14,
                    ),
                    const SizedBox(height: 30),
                    TabBar(
                      labelStyle: TextHelper.w600s14,
                      tabs: const [
                        Tab(text: 'Main info'),
                        Tab(text: 'Location'),
                        Tab(text: 'Email'),
                      ],
                      indicatorSize: TabBarIndicatorSize.tab,
                    ),
                    Expanded(
                      child: TabBarView(
                        children: [
                          MainInfoDetails(userModel: userModel),
                          LocationWidget(
                            userModel: userModel,
                          ),
                          EmailWidget(userModel: userModel),
                        ],
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        userBloc.add(GetUserDetailInfoEvent());
                      },
                      child: const Text('Поиск'),
                    )
                  ],
                ),
              ),
            );
          }

          return Center(
            child: ElevatedButton(
                onPressed: () {
                  userBloc.add(GetUserDetailInfoEvent());
                },
                child: const Text("повторить")),
          );
        },
      ),
    );
  }
}
