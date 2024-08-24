import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gym_managment/components/strings.dart';
import 'package:gym_managment/data/models/user.dart';
import 'package:gym_managment/main.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';

class ChangeUserScreen extends StatefulWidget {
  ChangeUserScreen({super.key, required this.userData});
  UserModel userData;

  @override
  State<ChangeUserScreen> createState() => _ChangeUserScreenState();
}

class _ChangeUserScreenState extends State<ChangeUserScreen> {
  final _formKey = GlobalKey<FormState>();

  // Controllers for the TextFormFields
  final _nameController = TextEditingController();

  final _phoneController = TextEditingController();

  final _registerDateController = TextEditingController();

  final _expireDateController = TextEditingController();

  var box = Hive.box<UserModel>(boxValue);
  var radioState = 0;
  Jalali? registerDate;
  Jalali? expireDate;
  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    var color = Theme.of(context).colorScheme;
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          height: size.height,
          width: size.width,
          child: Column(
            children: [
              const SizedBox(
                height: 74,
              ),
              Image(
                image: const AssetImage(
                  'assets/images/logo.png',
                ),
                width: size.width / 2,
                height: size.height / 7,
              ),
              Text(
                AppStrings.appbarTitle.tr(),
                style: textTheme.bodyLarge!
                    .copyWith(fontWeight: FontWeight.w700, fontSize: 19),
              ),
              const SizedBox(
                height: 14,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.person_add_alt_outlined,
                    size: 22,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    AppStrings.floatingActionButtonToolTip.tr(),
                    style: textTheme.bodyLarge!
                        .copyWith(fontWeight: FontWeight.w700, fontSize: 13),
                  )
                ],
              ),
              const SizedBox(
                height: 32,
              ),
              // ! TextFields
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _nameController,
                      decoration: InputDecoration(
                        labelText: AppStrings.name.tr(),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your name';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 24),
                    TextFormField(
                      controller: _phoneController,
                      decoration: InputDecoration(
                        labelText: AppStrings.phone.tr(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your phone number';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 24),
                    TextFormField(
                      readOnly: true,
                      onTap: () async {
                        registerDate = await showPersianDatePicker(
                          context: context,
                          initialDate: Jalali.now(),
                          firstDate: Jalali(1385, 8),
                          lastDate: Jalali(1450, 9),
                        );
                        _registerDateController.text =
                            registerDate!.formatCompactDate();
                        switch (radioState) {
                          case 0:
                            _expireDateController.text =
                                registerDate!.addDays(15).formatCompactDate();
                            break;
                          case 1:
                            _expireDateController.text =
                                registerDate!.addMonths(1).formatCompactDate();
                            break;
                          case 2:
                            _expireDateController.text =
                                registerDate!.addMonths(3).formatCompactDate();
                            break;
                        }
                      },
                      controller: _registerDateController,
                      decoration: InputDecoration(
                        suffixIcon: const Icon(Icons.calendar_month_outlined),
                        labelText: AppStrings.registerDate.tr(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter String 1';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    //  ! radio row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              height: 24,
                              width: 24,
                              child: Radio(
                                value: radioState,
                                groupValue: 0,
                                onChanged: (value) {
                                  setState(() {
                                    radioState = 0;
                                    _expireDateController.text = registerDate!
                                        .addDays(15)
                                        .formatCompactDate();
                                  });
                                },
                              ),
                            ),
                            Text(
                              AppStrings.HalfMonth.tr(),
                              style: textTheme.bodyMedium,
                            )
                          ],
                        ),
                        Row(
                          children: [
                            SizedBox(
                              height: 24,
                              width: 24,
                              child: Radio(
                                value: radioState,
                                groupValue: 1,
                                onChanged: (value) {
                                  setState(() {
                                    radioState = 1;
                                    _expireDateController.text = registerDate!
                                        .addMonths(1)
                                        .formatCompactDate();
                                  });
                                },
                              ),
                            ),
                            Text(
                              AppStrings.oneMonth.tr(),
                              style: textTheme.bodyMedium,
                            )
                          ],
                        ),
                        Row(
                          children: [
                            SizedBox(
                              height: 24,
                              width: 24,
                              child: Radio(
                                value: radioState,
                                groupValue: 2,
                                onChanged: (value) {
                                  setState(() {
                                    radioState = 2;
                                    _expireDateController.text = registerDate!
                                        .addMonths(3)
                                        .formatCompactDate();
                                  });
                                },
                              ),
                            ),
                            Text(
                              AppStrings.threeMonth.tr(),
                              style: textTheme.bodyMedium,
                            )
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    TextFormField(
                      onTap: () async {
                        expireDate = await showPersianDatePicker(
                          context: context,
                          initialDate: Jalali.now(),
                          firstDate: Jalali(1385, 8),
                          lastDate: Jalali(1450, 9),
                        );
                        _expireDateController.text =
                            expireDate!.formatCompactDate();
                      },
                      readOnly: true,
                      controller: _expireDateController,
                      decoration: InputDecoration(
                        suffixIcon: const Icon(Icons.calendar_month_outlined),
                        labelText: AppStrings.expireDate.tr(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter String 2';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 24),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState?.validate() ?? false) {
                          widget.userData.name = _nameController.text;
                          widget.userData.expireDate =
                              _expireDateController.text;
                          widget.userData.registerDate =
                              _registerDateController.text;
                          widget.userData.number = _phoneController.text;
                          box.add(widget.userData);
                          print(widget.userData);
                          print(box.values.length);
                          // Handle form submission
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Form is valid!')),
                          );
                        }
                      },
                      child: Text(
                        AppStrings.confirm.tr(),
                        style: textTheme.bodyLarge!
                            .copyWith(fontWeight: FontWeight.w700),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
