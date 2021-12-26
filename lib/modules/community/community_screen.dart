import 'package:flutter/material.dart';
import 'package:gigapet/shared/components/components.dart';

class CommunityScreen extends StatefulWidget {
   CommunityScreen({ Key? key }) : super(key: key);

  @override
  State<CommunityScreen> createState() => _CommunityScreenState();
}

class _CommunityScreenState extends State<CommunityScreen> {

  var scaffoldKey = GlobalKey<ScaffoldState>();
  bool isOpen = false;
  IconData fabIcon = Icons.edit;
  var topicController = TextEditingController();
  var typeController = TextEditingController();
  var breedController = TextEditingController();
  var postController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(top: 20, start: 10, end: 10),
      child: Scaffold(
        key: scaffoldKey,
        floatingActionButton: FloatingActionButton(
          hoverColor: Colors.green,
          onPressed: (){
            if (isOpen == false) {
              setState(() {
                fabIcon = Icons.add;
              });
              scaffoldKey.currentState!.showBottomSheet(
              (context) => Padding(
                padding: const EdgeInsets.all(20),
                child: Card(
                  //color: Colors.grey[350],
                  elevation: 10,
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          'Add Post',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                        const SizedBox(
                          height: 10
                        ),
                
                        Padding(
                          padding: const EdgeInsets.all(22),
                          child: Column(
                            children: [
                              defaultFormField(
                                label: 'Post Topic',
                                prefix: Icons.post_add,
                                controller: topicController
                              ),
                              defaultFormField(
                            label: 'Pet Type',
                            prefix: Icons.pets,
                            controller: typeController
                          ),
                          defaultFormField(
                            label: 'Pet Breed',
                            prefix: Icons.pets_outlined,
                            controller: breedController
                          ),
                            ],
                          ),
                        ),
                        
                        const SizedBox(
                          height: 10,
                        ),
                        Card(
                          elevation: 10,
                          color: Colors.grey[100],
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              controller: postController,
                              maxLines: 4,
                              decoration: const InputDecoration(
                                labelText: '. . . Post Here',
                                labelStyle: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold
                                ),
                                floatingLabelBehavior: FloatingLabelBehavior.always
                              ),
                            ),
                          )
                        )
                      ],
                    ),
                  ),
                ),
              )
            ).closed.then((value){
              isOpen = false;
              setState(() {
                fabIcon = Icons.edit;
              });
            }); 
            isOpen = true;
            } else {
              Navigator.pop(context);
              isOpen = false;
              setState(() {
                fabIcon = Icons.edit;
              });
            }
            
          },
          child: Icon(
            fabIcon
          ),
        ),
        body: ListView.separated(
          itemBuilder:(context, index) => postBuilder(), 
          separatorBuilder: (context, index) => const SizedBox(height: 20), 
          itemCount: 10
        ),
      ),
    );
  }
}