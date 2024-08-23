import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gym_managment/components/strings.dart';
import 'package:gym_managment/data/models/user.dart';

class ChangeUserScreen extends StatelessWidget {
  ChangeUserScreen({super.key, required this.userData});
  UserModel userData;

  final _formKey = GlobalKey<FormState>();

  // Controllers for the TextFormFields
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _idController = TextEditingController();
  final _string1Controller = TextEditingController();
  final _string2Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    var color = Theme.of(context).colorScheme;
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 16),
        height: size.height,
        width: size.width,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 64,
              ),
              Image(
                image: AssetImage(
                  'assets/images/logo.png',
                ),
                width: size.width / 2,
                height: size.height / 8,
              ),
              Text(
                AppStrings.appbarTitle.tr(),
                style: textTheme.bodyLarge!
                    .copyWith(fontWeight: FontWeight.w700, fontSize: 19),
              ),
              SizedBox(
                height: 6,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.person_add_alt_outlined,
                    size: 22,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    AppStrings.floatingActionButtonToolTip.tr(),
                    style: textTheme.bodyLarge!
                        .copyWith(fontWeight: FontWeight.w700, fontSize: 13),
                  )
                ],
              ),
              SizedBox(
                height: 24,
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _nameController,
                      decoration: InputDecoration(
                        labelText: 'Name',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your name';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16),
                    TextFormField(
                      controller: _phoneController,
                      decoration: InputDecoration(
                       
                        labelText: 'Phone',
                     
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your phone number';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16),
                    TextFormField(
                      controller: _idController,
                      decoration: InputDecoration(
                      
                        labelText: 'ID',
                       
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your ID';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16),
                    TextFormField(
                      controller: _string1Controller,
                      decoration: InputDecoration(
                      
                        labelText: 'String 1',
                   
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter String 1';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16),
                    TextFormField(
                      controller: _string2Controller,
                      decoration: InputDecoration(
                   
                        labelText: 'String 2',
                       
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter String 2';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 24),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState?.validate() ?? false) {
                          // Handle form submission
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Form is valid!')),
                          );
                        }
                      },
                      child: Text('Validate'),
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
