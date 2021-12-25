import 'package:flutter/foundation.dart';
import 'package:gigapet/models/models.GigaPet/PetOwner_Model.dart';
import 'firestore_service.dart';

abstract class Database {
  Future<void> setPerson(PetOwnerModel person , String id);

  Future<void> deletePerson();

  Stream<PetOwnerModel> personStream({required String personId});

  Stream<List<PetOwnerModel>> personsStream();
}


class FirestoreDatabase implements Database {
  FirestoreDatabase({required this.uid}) : assert(uid != null);
  final String uid;

  final _service = FirestoreService.instance;

  @override
  Future<void> setPerson(PetOwnerModel person , String id) =>
      _service.setData(path: 'PetOwnerUsers/$id', data: person.toMap());

  @override
  Future<void> deletePerson() => _service.deleteData(path: 'PetOwnerUsers/$uid');


  @override
  Stream<PetOwnerModel> personStream({required String personId}) =>
      _service.documentStream(
        path: 'PetOwnerUsers/$personId',
        builder: (data, documentId) => PetOwnerModel.fromJson(data),
      );

  @override
  Stream<List<PetOwnerModel>> personsStream() => _service.collectionStream(
        path: 'PetOwnerUsers/',
        builder: (data, documentId) => PetOwnerModel.fromJson(data),
      );


}
