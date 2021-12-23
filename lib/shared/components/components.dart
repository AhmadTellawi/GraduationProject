import 'package:flutter/material.dart';


Widget defaultButton(
  {
    double width = double.infinity,
    Color color = Colors.deepOrange,
    void Function()? onPressed,
    required String text,
    Color textColor = Colors.white
  }
){

  return Container(
    width: width,
    color: color,
    child: MaterialButton(
      textColor: textColor,
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
          color: textColor
        ),
      ),
    ),
  );
}

Widget defaultFormField(
  {
    bool isPassowrd = false,
    String? Function(String?)? validator,
    TextEditingController? controller,
    void Function()? onTap,
    required String label,
    String? hintText,
    TextInputType keyboardtype = TextInputType.text,
    IconData? icon,
    IconData? prefix,
    void Function()? iconPressed
  }
){
  return TextFormField(
    keyboardType: keyboardtype,
    obscureText: isPassowrd,
    validator: validator,
    controller: controller,
    onTap: onTap,
    decoration: InputDecoration(
      suffixIcon: IconButton(
        icon: Icon(icon),
        onPressed: iconPressed,
      ),
      prefixIcon: Icon(prefix),
      labelText: label,
      labelStyle: const TextStyle(
        fontSize: 15.5,
      ),
      hintText: hintText,
      hintStyle: const TextStyle(
        fontStyle: FontStyle.italic,
        color: Colors.grey
      )
    ),
  );
}

Widget postBuilder(){
  return Container(
    color: Colors.grey,
    height: 125,
    width: double.infinity,
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            children: const [
              CircleAvatar(
                backgroundColor: Colors.red,
              ),
              SizedBox(width: 20,),
              Text(
                'username',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14
                ),
              ),
              SizedBox(width: 20,),
              Text(
                '|',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20
                ),
              ),
              SizedBox(width: 20,),
              Expanded(
                child: Text(
                  'Topic',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20
                  ),
                ),
              ),
              SizedBox(width: 20,),
              Text(
                'Type - Breed',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14
                ),
              ),
            ],
          ),
          SizedBox(height: 20,),
          const Text(
            'POST CONTENT',
            style: TextStyle(
              fontSize: 20
            ),
          )
        ],
      ),
    ),
  );
}

