import 'package:flutter/material.dart';
import 'package:tab_bar/features/data/models/user_model.dart';
import 'package:tab_bar/internal/helpers/text_helper.dart';

class LocationWidget extends StatelessWidget {
  final UserModel userModel;

  const LocationWidget({
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
            "Phone Number:",
            "${userModel.results?[0].phone}",
          ),
          buildRow(
            "Location:",
            "${userModel.results?[0].location?.country}",
          ),
          buildRow(
            "City:",
            "${userModel.results?[0].location?.city}",
          ),
          buildRow(
            "Email:",
            "${userModel.results?[0].email}",
          ),
          buildRow(
            "Age",
            "${userModel.results?[0].dob?.age}",
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
