import 'package:flutter/material.dart';
import 'package:gigapet/modules/profile/clinic_profile_screen.dart';
import 'package:gigapet/modules/profile/store_profile_screen.dart';
import 'package:gigapet/shared/components/components.dart';

class StoreEditProfileScreen extends StatefulWidget {
  StoreEditProfileScreen({ Key? key }) : super(key: key);

  @override
  State<StoreEditProfileScreen> createState() => _StoreEditProfileScreenState();
}

class _StoreEditProfileScreenState extends State<StoreEditProfileScreen> {

  var fNameController = TextEditingController();

  var lNameController = TextEditingController();

  var userNameController = TextEditingController();

  var StoreWorkHoursFromController = TextEditingController();

  var StoreWorkHoursToController = TextEditingController();

  var StoreAddressController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Edit Profile',
          style: TextStyle(
            color: Colors.black
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.deepOrange,
                  radius: 30,
                ),
                SizedBox(
                  height: 20,
                ),
                defaultFormField(
                  prefix: Icons.person,
                  controller: fNameController,
                  label: 'First Name',
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'First Name Must Not Be Empty';
                    }
                  }
                ),
                SizedBox(
                  height: 20,
                ),
                defaultFormField(
                    prefix: Icons.person,
                    controller: lNameController,
                    label: 'Last Name',
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Last Name Must Not Be Empty';
                      }
                      }
                ),
                SizedBox(
                  height: 20,
                ),
                defaultFormField(
                  prefix: Icons.person,
                    hintText: 'Your Store name in the app..',
                    controller: userNameController,
                    label: 'Username',
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Username Must Not Be Empty';
                      }
                    }
                  ),
                SizedBox(
                  height: 20,
                ),
                defaultFormField(
                  prefix: Icons.access_time,
                  controller: StoreWorkHoursFromController,
                  label: 'Work Hours From',
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Work Hours Must Not Be Empty';
                    }
                  },
                    onTap: () {
                      showTimePicker(
                          context: context,
                          initialTime: TimeOfDay.now()
          
                      ).then((value) {
                        StoreWorkHoursFromController.text =
                            value!.format(context);
                      });
                    }
                ),
                SizedBox(
                  height: 20,
                ),
                defaultFormField(
                  prefix: Icons.access_time_filled_outlined,
                    controller: StoreWorkHoursToController,
                    label: 'Work Hours To',
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Work Hours Must Not Be Empty';
                      }
                    },
                    onTap: () {
                      showTimePicker(
                          context: context,
                          initialTime: TimeOfDay.now()
                      ).then((value) {
                        StoreWorkHoursToController.text = value!.format(context);
                      });
                    }
                ),
                SizedBox(
                  height: 20,
                ),
                defaultButton(
                      text: 'CONFIRM',
                      onPressed: (){
                        Navigator.pushReplacement(
                          context, 
                          MaterialPageRoute(
                            builder: (context) => StoreProfileScreen(),
                          )
                        );
                      },
                    ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}