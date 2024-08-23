import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gym_managment/components/strings.dart';
import 'package:gym_managment/screens/ChangeUser/ChangeUser.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key, required this.userState});
  int userState;
  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    var color = Theme.of(context).colorScheme;
    return Scaffold(
      body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              const SizedBox(
                height: 6,
              ),
              TextField(
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(14),
                    filled: true,
                    hintText: AppStrings.hintSearchTextField.tr(),
                    hintStyle: const TextStyle(
                        fontFamily: 'dana',
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.white),
                    fillColor: Color.fromARGB(180, 158, 158, 158),
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(14))),
              ),
              const SizedBox(
                height: 16,
              ),
              userState == 0
                  ? Container(
                      padding: EdgeInsets.symmetric(horizontal: 14),
                      height: 35,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.green,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            AppStrings.activeUserCount.tr(),
                            style: textTheme.bodyMedium!.copyWith(
                                fontWeight: FontWeight.w700, fontSize: 12),
                          ),
                          Text(
                            AppStrings.count
                                .tr(namedArgs: {AppStrings.count: "15"}),
                            style: textTheme.bodyMedium!.copyWith(
                                fontWeight: FontWeight.w700, fontSize: 12),
                          ),
                        ],
                      ),
                    )
                  : Container(
                      padding: EdgeInsets.symmetric(horizontal: 14),
                      height: 35,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.red,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            AppStrings.notactiveUserCount.tr(),
                            style: textTheme.bodyMedium!.copyWith(
                                fontWeight: FontWeight.w700, fontSize: 12),
                          ),
                          Text(
                            AppStrings.count
                                .tr(namedArgs: {AppStrings.count: "15"}),
                            style: textTheme.bodyMedium!.copyWith(
                                fontWeight: FontWeight.w700, fontSize: 12),
                          ),
                        ],
                      ),
                    ),
              Expanded(
                  child: ListView.builder(
                itemCount: 10,
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return Container(
                    height: 45,
                    margin: EdgeInsets.only(top: 18),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color.fromARGB(120, 158, 158, 158),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                            child: Text(
                          textAlign: TextAlign.center,
                          "Morteza",
                          style: textTheme.bodyMedium!
                              .copyWith(fontWeight: FontWeight.w400),
                        )),
                        Expanded(
                            child: Text(
                          textAlign: TextAlign.center,
                          "1403/06/02",
                          style: textTheme.bodyMedium!
                              .copyWith(fontWeight: FontWeight.w400),
                        )),
                        Expanded(
                            child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            GestureDetector(
                              behavior: HitTestBehavior.opaque,
                              onTap: () {
                                // عمل مورد نظر
                              },
                              child: Icon(
                                Icons.edit,
                                size: 20,
                              ),
                            ),
                            SizedBox(
                              width: 14,
                            ),
                            GestureDetector(
                              behavior: HitTestBehavior.opaque,
                              onTap: () {
                                // عمل مورد نظر
                              },
                              child: Icon(
                                Icons.delete,
                                size: 20,
                              ),
                            ),
                          ],
                        )),
                      ],
                    ),
                  );
                },
              ))
            ],
          )),
      floatingActionButton: userState == 0
          ? FloatingActionButton(
              tooltip: AppStrings.floatingActionButtonToolTip.tr(),
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(14))),
              foregroundColor: Colors.white,
              backgroundColor: color.secondary,
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) {
                    return const ChangeUserScreen();
                  },
                ));
              },
              child: const Icon(Icons.add),
            )
          : null,
    );
  }
}
