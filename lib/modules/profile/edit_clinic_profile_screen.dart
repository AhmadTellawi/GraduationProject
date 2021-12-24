import 'package:flutter/material.dart';
import 'package:gigapet/modules/profile/clinic_profile_screen.dart';
import 'package:gigapet/shared/components/components.dart';

class ClinicEditProfileScreen extends StatelessWidget {
  ClinicEditProfileScreen({ Key? key }) : super(key: key);

  var fNameController = TextEditingController();
  var lNameController = TextEditingController();
  var userNameController = TextEditingController();
  var clinicWorkHoursFromController = TextEditingController();
  var clinicWorkHoursToController = TextEditingController();
  var clinicAddressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profile',
          style: TextStyle(
            color: Colors.black
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
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
                            hintText: 'Your clinic name in the app..',
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
                          controller: clinicWorkHoursFromController,
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
                                clinicWorkHoursFromController.text =
                                    value!.format(context);
                              });
                            }

                        ),
              SizedBox(
                height: 20,
              ),
              defaultFormField(
                          prefix: Icons.access_time_filled_outlined,
                            controller: clinicWorkHoursToController,
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
                                clinicWorkHoursToController.text =
                                    value!.format(context);
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
                          builder: (context) => ClinicProfileScreen(),
                        )
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