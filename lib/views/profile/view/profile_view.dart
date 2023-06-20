import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../../core/common/common.dart';
import '../../../core/services/decisions_tree.dart';
import '../bloc/profile_bloc.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileBloc()
        ..add(LoadUserDataEvent(token: Common.prefs.getString('token')!)),
      child: BlocConsumer<ProfileBloc, ProfileState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is LoadedSuccess) {
            return SafeArea(
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/logo.png',
                    width: 30.w,
                    height: 20.h,
                  ),
                  Row(
                    children: [
                      const CircleAvatar(
                        radius: 40,
                        backgroundColor: Colors.white,
                        backgroundImage: NetworkImage(
                          'https://th.bing.com/th/id/OIP.W4Okg3KIP4R9K068emy_iAHaEV?w=292&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7',
                        ),
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            state.user.name,
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.blueGrey,
                            ),
                          ),
                          Text(
                            state.user.email,
                            style: TextStyle(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  ListTile(
                    leading: const Icon(Icons.favorite),
                    title: Text(
                      'Favorites',
                      style: TextStyle(
                        fontSize: 15.sp,
                        color: Colors.blueAccent,
                      ),
                    ),
                  ),
                  const Divider(),
                  TextButton.icon(
                    onPressed: () {
                      Common.prefs.setString('token', '');
                      Navigator.pushNamed(context, DecisionsTree.routeName);
                    },
                    label: const Text('SignOut'),
                    icon: const Icon(
                      Icons.logout,
                    ),
                  ),
                ],
              ),
            );
          } else if (state is LoadingData) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return const Center(child: Text('Something went wrong!!'));
          }
        },
      ),
    );
  }
}
