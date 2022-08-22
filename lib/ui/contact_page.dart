import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provide_exercise/domain/blocs/profileCubit/profile_cubit.dart';
import 'package:provide_exercise/ui/widgets/shimmerItems/contact_shimmer_item.dart';
import 'package:provide_exercise/utils/constants.dart';

import 'widgets/contact_item.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<ProfileCubit>().getContactsCubit();
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
      body: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          if (state is ProfileStateOnCompleted) {
            return ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              physics: const BouncingScrollPhysics(),
              itemCount: state.listContacts.length,
              itemBuilder: (context, index) {
                return ContactItem(state.listContacts[index]);
              },
            );
          } else if (state is ProfileStateInProgress) {
            return ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              physics: const BouncingScrollPhysics(),
              itemCount: 20,
              itemBuilder: (context, index) {
                return const ContactShimmerItem();
              },
            );
          } else if (state is ProfileStateOnFiled) {
            return Center(
              child: Text("Error ${state.message}"),
            );
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
