//import 'dart:html';

import 'package:flutter/foundation.dart';
import 'package:gigapet/models/models.GigaPet/Clinic_Model.dart';
import 'package:gigapet/models/models.GigaPet/PetOwner_Model.dart';
import 'package:gigapet/models/models.GigaPet/Store_model.dart';
import 'firestore_service.dart';

abstract class Database {
  Future<void> setPerson(PetOwnerModel person , String id);

  Future<void> deletePerson();

  Stream<PetOwnerModel> PetOwnerStream({required String personId});

  Stream<List<PetOwnerModel>> PetOwnersStream();
  Stream<ClinicOwnerModel> ClinicOwnerStream({required String personId});
  Stream<List<ClinicOwnerModel>> ClinicOwnersStream();
  Stream<StoreOwnerModel> StoreOwnerStream({required String personId});
  Stream<List<StoreOwnerModel>> StoreOwnersStream();

}


class FirestoreDatabase implements Database {
  FirestoreDatabase({required this.uid}) : assert(uid != null);
  final String uid;

  final _service = FirestoreService.instance;

  @override
  Future<void> setPerson(PetOwnerModel person , String id) =>
      _service.setData(path: 'PetOwnerUsers/$id', data: person.toMap());

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
        builder: (data, documentId) => ClinicOwnerModel.fromJson(data),
      );

  @override
  Stream<List<ClinicOwnerModel>> ClinicOwnersStream() => _service.collectionStream(
    path: 'ClinicOwnerUsers/',
    builder: (data, documentId) => ClinicOwnerModel.fromJson(data),
  );



  @override
  Stream<StoreOwnerModel> StoreOwnerStream({required String personId}) =>
      _service.documentStream(
        path: '/StoreOwnerUsers/$personId',
        builder: (data, documentId) => StoreOwnerModel.fromJson(data),
      );

  @override
  Stream<List<StoreOwnerModel>> StoreOwnersStream() => _service.collectionStream(
    path: 'StoreOwnerUsers/',
    builder: (data, documentId) => StoreOwnerModel.fromJson(data),
  );

}
