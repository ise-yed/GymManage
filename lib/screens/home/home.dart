import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gym_managment/components/strings.dart';
import 'package:gym_managment/data/models/user.dart';
import 'package:gym_managment/main.dart';
import 'package:gym_managment/screens/ChangeUser/ChangeUser.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key, required this.userState});
  int userState;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ValueNotifier<String> SearchValue = ValueNotifier('');

  TextEditingController SearchController = TextEditingController();

  var box = Hive.box<UserModel>(boxValue);

  List<UserModel> dataChanger() {
    DateTime now = Jalali.now().toDateTime();
    return box.values.where((element) {
      DateTime convertedDate = Jalali(
              int.parse(element.expireDate!.split("/")[0]),
              int.parse(element.expireDate!.split("/")[1]),
              int.parse(element.expireDate!.split("/")[2]))
          .toDateTime();

      if (widget.userState == 0) {
        return convertedDate.isAfter(now);
      } else {
        return !convertedDate.isAfter(now);
      }
    }).toList();
  }

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
              // ! Search Section
              TextField(
                onChanged: (value) {
                  SearchValue.value = value;
                },
                controller: SearchController,
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(14),
                    filled: true,
                    hintText: AppStrings.hintSearchTextField.tr(),
                    hintStyle: const TextStyle(
                        fontFamily: 'dana',
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.white),
                    fillColor: const Color.fromARGB(170, 158, 158, 158),
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(14))),
              ),
              const SizedBox(
                height: 16,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 14),
                height: 35,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: widget.userState == 0 ? Colors.green : Colors.red,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.userState == 0
                          ? AppStrings.activeUserCount.tr()
                          : AppStrings.notactiveUserCount.tr(),
                      style: textTheme.bodyMedium!
                          .copyWith(fontWeight: FontWeight.w700, fontSize: 12),
                    ),
                    Text(
                      AppStrings.count.tr(namedArgs: {
                        AppStrings.count: dataChanger().length.toString()
                      }),
                      style: textTheme.bodyMedium!
                          .copyWith(fontWeight: FontWeight.w700, fontSize: 12),
                    ),
                  ],
                ),
              ),

              // !LIST VIEW
              Expanded(
                  // ! First lisinable for search
                  child: ValueListenableBuilder(
                valueListenable: SearchValue,
                builder: (context, value, child) {
                  // ! lisinable for box
                  return ValueListenableBuilder(
                    valueListenable: box.listenable(),
                    builder: (context, value, child) {
                      // ! result of search Data
                      var listData = dataChanger();
                      if (SearchValue.value.isNotEmpty) {
                        listData = dataChanger()
                            .where((element) =>
                                element.name!.contains(SearchValue.value))
                            .toList();
                      }

                      return ListView.builder(
                        itemCount: listData.length,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          var user = listData[index];
                          return Container(
                            height: 45,
                            margin: const EdgeInsets.only(top: 18),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: const Color.fromARGB(120, 158, 158, 158),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                    child: Text(
                                  textAlign: TextAlign.center,
                                  user.name!,
                                  style: textTheme.bodyMedium!
                                      .copyWith(fontWeight: FontWeight.w400),
                                )),
                                Expanded(
                                    child: Text(
                                  textAlign: TextAlign.center,
                                  user.expireDate!,
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
                                        Navigator.of(context)
                                            .push(MaterialPageRoute(
                                          builder: (context) {
                                            return ChangeUserScreen(
                                                userData: user);
                                          },
                                        ));
                                        print("edit");
                                      },
                                      child: const Icon(
                                        Icons.edit,
                                        size: 20,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 14,
                                    ),
                                    GestureDetector(
                                      behavior: HitTestBehavior.opaque,
                                      onTap: () async {
                                        await user.delete();
                                        print("object");
                                      },
                                      child: const Icon(
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
                      );
                    },
                  );
                },
              ))
            ],
          )),
      floatingActionButton: widget.userState == 0
          ? FloatingActionButton(
              tooltip: AppStrings.floatingActionButtonToolTip.tr(),
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(14))),
              foregroundColor: Colors.white,
              backgroundColor: color.secondary,
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) {
                    return ChangeUserScreen(
                      userData: UserModel(number: null),
                    );
                  },
                ));
              },
              child: const Icon(Icons.add),
            )
          : null,
    );
  }
}
