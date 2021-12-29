//import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:gigapet/models/models.GigaPet/Clinic_Model.dart';
import 'package:gigapet/models/models.GigaPet/PetOwner_Model.dart';
import 'package:gigapet/models/models.GigaPet/Store_model.dart';
import 'package:gigapet/models/models.GigaPet/psot_model.dart';
import 'firestore_service.dart';

abstract class Database {
  Future<void> setOwnerPerson(PetOwnerModel person , String id);
  Future<void> setStorePerson(StoreOwnerModel person , String id);
  Future<void> setClinicPerson(ClinicOwnerModel person , String id);

  Future<void> deletePerson();
  Stream<PetOwnerModel> PetOwnerStream({required String personId});
  Stream<List<PetOwnerModel>> PetOwnersStream();
  Stream<ClinicOwnerModel> ClinicOwnerStream({required String personId});
  Stream<List<ClinicOwnerModel>> ClinicOwnersStream();
  Stream<StoreOwnerModel> StoreOwnerStream({required String personId});
  Stream<List<StoreOwnerModel>> StoreOwnersStream();
  Future<void> setPost(PostModel post);
  Stream<List<PostModel>> postsStream();
}

String currentDate() => DateTime.now().toIso8601String();

class FirestoreDatabase implements Database {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirestoreDatabase({required this.uid}) : assert(uid != null);
  final String uid;

  final _service = FirestoreService.instance;

  @override
  Future<void> setOwnerPerson(PetOwnerModel person , String id) =>
      _service.setData(path: 'PetOwnerUsers/$id', data: person.toMap());

  @override
  Future<void> setStorePerson(StoreOwnerModel person , String id) =>
      _service.setData(path: 'StoreOwnerUsers/$id', data: person.toMap());

  @override
  Future<void> setClinicPerson(ClinicOwnerModel person , String id) =>
      _service.setData(path: 'ClinicOwnerUsers/$id', data: person.toMap());

  @override
  Future<void> deletePerson() => _service.deleteData(path: 'StoreOwnerUsers/$uid');


  @override
  Stream<PetOwnerModel> PetOwnerStream({required String personId}) =>
      _service.documentStream(
        path: '/PetOwnerUsers/$personId',
        builder: (data, documentId) => PetOwnerModel.fromJson(data,documentId),
      );

  @override
  Stream<List<PetOwnerModel>> PetOwnersStream() => _service.collectionStream(
        path: 'PetOwnerUsers/',
        builder: (data, documentId) => PetOwnerModel.fromJson(data,documentId),

      );

  @override
  Stream<ClinicOwnerModel> ClinicOwnerStream({required String personId}) =>
      _service.documentStream(
        path: '/ClinicOwnerUsers/$personId',
        builder: (data, documentId) => ClinicOwnerModel.fromJson(data, documentId),
      );

  @override
  Stream<List<ClinicOwnerModel>> ClinicOwnersStream() => _service.collectionStream(
    path: 'ClinicOwnerUsers/',
    builder: (data, documentId) => ClinicOwnerModel.fromJson(data, documentId),
  );



  @override
  Stream<StoreOwnerModel> StoreOwnerStream({required String personId}) =>
      _service.documentStream(
        path: '/StoreOwnerUsers/$personId',
        builder: (data, documentId) => StoreOwnerModel.fromJson(data, documentId),
      );

  @override
  Stream<List<StoreOwnerModel>> StoreOwnersStream() => _service.collectionStream(
    path: 'StoreOwnerUsers/',
    builder: (data, documentId) => StoreOwnerModel.fromJson(data,documentId),
  );
  @override
  Future<void> setPost(PostModel post) async {
    String postID = '${post.Username}${currentDate()}';
    await _service.setData(
      path: 'Posts/${postID}',
      data: post.toMap(),
    );
  }

  @override
  Stream<List<PostModel>> postsStream() => _service.collectionStream(
    path: 'Posts/',
    builder: (data, documentId) => PostModel.fromJson(data, documentId),
  );

}
