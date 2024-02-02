import 'package:flutter/material.dart';
import 'package:tab_bar/features/data/models/user_model.dart';
import 'package:tab_bar/internal/helpers/text_helper.dart';

class MainInfoDetails extends StatelessWidget {
  final UserModel userModel;

  const MainInfoDetails({Key? key, required this.userModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        children: [
          buildRow("Name:",
              "${userModel.results?[0].name?.first} ${userModel.results?[0].name?.last}"),
          buildRow("Gender:", "${userModel.results?[0].gender}"),
          buildRow("Date of birth:",
              userModel.results?[0].dob?.date?.toString() ?? ""),
          buildRow("Location:",
              "${userModel.results?[0].location?.city}, ${userModel.results?[0].location?.country}"),
          buildRow("Email:", "${userModel.results?[0].email}"),
        ],
      ),
    );
  }

  Widget buildRow(String label, String data) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
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
}
