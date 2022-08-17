import 'package:flutter/material.dart';
import 'package:provide_exercise/domain/providers/view_model.dart';
import 'package:provide_exercise/ui/widgets/shimmerItems/contact_shimmer_item.dart';
import 'package:provide_exercise/ui/widgets/shimmerItems/todos_shimmer_item.dart';
import 'package:provide_exercise/utils/constants.dart';
import 'package:provider/provider.dart';

import 'widgets/contact_item.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgClr2,
      appBar: AppBar(
        backgroundColor: appbarClr,
        centerTitle: true,
        title: const Text(
          "Contacts",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
        ),
      ),
      body: Consumer<ViewModel>(
        builder: (context, viewModel, child) {
          if (viewModel.listContact.isEmpty) {
            viewModel.getContacts();
          }
          return ListView.builder(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            physics: const BouncingScrollPhysics(),
            itemCount:
                viewModel.listContact.isEmpty ? 10 : viewModel.listContact.length,
            itemBuilder: (context, index) {
              if (viewModel.listContact.isEmpty) {
                return const ContactShimmerItem();
              } else {
                return ContactItem(viewModel.listContact[index]);
              }
            },
          );
        },
      ),
    );
  }
}
