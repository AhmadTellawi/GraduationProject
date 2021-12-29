import 'package:flutter/material.dart';
import 'package:gigapet/models/models.GigaPet/psot_model.dart';


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
    void Function()? iconPressed,
    String? init
  }
){
  return TextFormField(
    initialValue: init,
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

Widget postBuilder(PostModel post){
  return Container(
    color: Colors.grey[200],
    height: 200,
    width: double.infinity,
    child: Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children:  [
              CircleAvatar(
                backgroundColor: Colors.red,
              ),
              SizedBox(width: 20,),
              Text(
                 post.Username,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16
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
                  '${post.petType} - ${post.petBreed}',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
                post.postTopic,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20
                ),
              ),
              SizedBox(
                height: 40,
              ),
           Text(
            post.postContent,
            style: TextStyle(
              fontSize: 20
            ),
          )
        ],
      ),
    ),
  );
}

