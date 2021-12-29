import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gigapet/database/database.dart';
import 'package:gigapet/models/models.GigaPet/PetOwner_Model.dart';
import 'package:gigapet/models/models.GigaPet/psot_model.dart';
import 'package:gigapet/modules/community/list_items_builder.dart';
import 'package:gigapet/shared/components/components.dart';

class CommunityScreen extends StatefulWidget {
  CommunityScreen({Key? key}) : super(key: key);

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
    FirebaseAuth auth = FirebaseAuth.instance;
    Database database = new FirestoreDatabase(uid: auth.currentUser!.uid);
    return StreamBuilder<PetOwnerModel>(
      stream: database.PetOwnerStream(personId: auth.currentUser!.uid),
      builder: (context, snapshot) {
        final petOwner = snapshot.data;
        return Padding(
          padding: const EdgeInsetsDirectional.only(top: 20, start: 10, end: 10),
          child: Scaffold(
            key: scaffoldKey,
            floatingActionButton: FloatingActionButton(
              hoverColor: Colors.green,
              onPressed: () {
                if (isOpen == false) {
                  setState(() {
                    fabIcon = Icons.add;
                  });
                  scaffoldKey.currentState!
                      .showBottomSheet((context) => Padding(
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
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(height: 10),
                                    Padding(
                                      padding: const EdgeInsets.all(22),
                                      child: Column(
                                        children: [
                                          defaultFormField(
                                              label: 'Post Topic',
                                              prefix: Icons.post_add,
                                              controller: topicController),
                                          defaultFormField(
                                              label: 'Pet Type',
                                              prefix: Icons.pets,
                                              controller: typeController),
                                          defaultFormField(
                                              label: 'Pet Breed',
                                              prefix: Icons.pets_outlined,
                                              controller: breedController),
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
                                                    fontWeight: FontWeight.bold),
                                                floatingLabelBehavior:
                                                    FloatingLabelBehavior.always),
                                          ),
                                        ))
                                  ],
                                ),
                              ),
                            ),
                          ))
                      .closed
                      .then((value) {
                    isOpen = false;
                    setState(() {
                      fabIcon = Icons.edit;
                    });
                  });
                  isOpen = true;
                } else {
                  final PostModel model = PostModel(
                    topicController.text ,
                    petOwner!.Username,
                    typeController.text,
                    breedController.text,
                    postController.text,
                  );
                  database.setPost(model);
                  Navigator.pop(context);
                  isOpen = false;
                  setState(() {
                    fabIcon = Icons.edit;
                  });
                }
              },
              child: Icon(fabIcon),
            ),
            body: _buildPosts(database),
          ),
        );
      }
    );
  }

  Widget _buildPosts(Database database) {
    return StreamBuilder<List<PostModel>>(
      stream: database.postsStream(),
      builder: (context, snapshot) {
        return ListItemsBuilder<PostModel>(
          snapshot: snapshot,
          itemBuilder: (context,post){
            return postBuilder(post);
          },
        );
      },
    );
  }
}
