import 'package:crypto_app/core/constants/colors.dart';
import 'package:crypto_app/core/widgets/sign_wrapper.dart';
import 'package:crypto_app/features/crypto_feature/providers/providers.dart';
import 'package:crypto_app/features/crypto_feature/widgets/profile_page/profile_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:crypto_app/core/widgets/txt.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    //* title list
    List<String> titleList = ["password", "email", "wallet id"];

    //* bottom sheet title
    List<String> bottomSheetTitleList = [
      "Edit name",
      "Take picture",
      "Pick picture",
    ];

    //* bottom sheet icon
    List<IconData> bottomSheetIconList = [
      Icons.edit_rounded,
      Icons.camera_alt_rounded,
      Icons.photo_rounded,
    ];

    // widget tree
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              //* profile picture
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  //* picture
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: CircleAvatar(
                      backgroundColor: Theme.of(context).cardColor,
                      radius: 60,
                      child: Icon(Icons.person_outline_rounded, size: 60),
                    ),
                  ),

                  //* edit button
                  CircleAvatar(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    child: IconButton(
                      onPressed: () {
                        //? open edit bottom sheet
                        showModalBottomSheet(
                          context: context,
                          builder:
                              (context) => Container(
                                height: 200,
                                color:
                                    Theme.of(context).scaffoldBackgroundColor,
                                child: Column(
                                  children: List.generate(
                                    3,
                                    (index) => ListTile(
                                      title: txt(bottomSheetTitleList[index]),
                                      leading: Icon(
                                        bottomSheetIconList[index],
                                        color:
                                            Theme.of(
                                              context,
                                            ).colorScheme.onPrimary,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                        );
                      },
                      icon: Icon(
                        Icons.edit_rounded,
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                    ),
                  ),
                ],
              ),

              Consumer(
                builder: (context, ref, child) {
                  //* data list
                  List<String> dataList = [
                    ref.watch(userProvider).userModel.password!,
                    "email",
                    "wallet",
                  ];

                  //* widget
                  return Column(
                    children: [
                      //* profile name
                      Padding(
                        padding: const EdgeInsets.only(top: 15.0),
                        child: txt(
                          ref.watch(userProvider).userModel.name!,
                          size: 26,
                        ),
                      ),

                      //* profile item
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: Column(
                          children: List.generate(
                            titleList.length,
                            (index) => ProfileItemWidget(
                              title: titleList[index],
                              data: dataList[index],
                            ),
                          ),
                        ),
                      ),

                      //* logout button
                      Padding(
                        padding: const EdgeInsets.only(top: 50.0),
                        child: SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: OutlinedButton(
                            onPressed: () {
                              //? push to login page
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SignWrapper(),
                                ),
                                (Route<dynamic> route) => false,
                              );
                            },
                            style: OutlinedButton.styleFrom(
                              side: BorderSide(color: redColor),
                            ),
                            child: txt("Logout", color: redColor),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
