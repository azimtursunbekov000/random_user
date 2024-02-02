import 'package:flutter/material.dart';
import 'package:tab_bar/features/data/models/user_model.dart';
import 'package:tab_bar/internal/helpers/text_helper.dart';

class EmailWidget extends StatelessWidget {
  final UserModel userModel;
  const EmailWidget({
    super.key,
    required this.userModel,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        children: [
          buildRow(
            "Name:",
            "${userModel.results?[0].name?.first}",
          ),
          buildRow(
            "Email:",
            "${userModel.results?[0].email}",
          ),
          buildRow(
            "User name:",
            "${userModel.results?[0].login?.username}",
          ),
          buildRow(
            "Phone:",
            "${userModel.results?[0].phone}",
          ),
          buildRow(
            "Cell:",
            "${userModel.results?[0].cell}",
          ),
          buildRow(
            "Registred:",
            "${userModel.results?[0].registered?.date}",
          ),
        ],
      ),
    );
  }
}

Widget buildRow(String label, String data) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 3),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextHelper.w600s16,
        ),
        Text(
          data,
          style: TextHelper.w600s16,
        ),
      ],
    ),
  );
}
