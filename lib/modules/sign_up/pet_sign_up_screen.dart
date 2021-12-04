import 'package:flutter/material.dart';
import 'package:gigapet/layout/gigapet/gigapet_layout.dart';
import 'package:gigapet/shared/components/components.dart';

class PetSignUpScreen extends StatefulWidget {
  const PetSignUpScreen({ Key? key }) : super(key: key);

  @override
  _PetSignUpScreenState createState() => _PetSignUpScreenState();
}

class _PetSignUpScreenState extends State<PetSignUpScreen> {

  bool isPassword = true;
  bool isPasswordConfirm = true;
  var formKey = GlobalKey<FormState>();
  var passWordController = TextEditingController();
  var confirmPasswordController = TextEditingController();

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsetsDirectional.only(top: 75),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                  "Sign Up",
                  style: TextStyle(
                    fontSize: 35
                  ),
                ),
                const Text(
                  'Your pet',
                  style: TextStyle(
                    fontSize: 45,
                    fontWeight: FontWeight.bold
                  )
                ),
                SizedBox(height: 20,),
                Text(
                    'If you don\'t have a pet you can skip this step'
                ),
                SizedBox(height: 20,),
                  defaultFormField(
                    label: 'Pet Name',
                  ),
                  const SizedBox(height: 20),
        
                   defaultFormField(
                     onTap: (){
                       showDatePicker(
                         context: context, 
                         initialDate: DateTime.now(), 
                         firstDate: DateTime.now(), 
                         lastDate: DateTime.now()
                       );
                     },
                    label: 'Date of Birth',
                  ),
                  const SizedBox(height: 20),
                  defaultFormField(
                    keyboardtype: TextInputType.text,
                    label: 'Type',
                  ),
                  const SizedBox(height: 20),
                  defaultFormField(
                    keyboardtype: TextInputType.text,
                    label: 'Breed',
                  ),
                  const SizedBox(height: 20),
                  defaultButton(
                    //color: Colors.blue,
                    text: 'SIGN UP',
                    onPressed: (){
                        Navigator.push(
                          context, 
                          MaterialPageRoute(
                            builder: (context) => const GigaPetLayout()
                          )
                        );
                    }
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}