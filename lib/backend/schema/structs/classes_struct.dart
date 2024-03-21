// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class ClassesStruct extends FFFirebaseStruct {
  ClassesStruct({
    String? id,
    String? name,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _id = id,
        _name = name,
        super(firestoreUtilData);

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;
  bool hasId() => _id != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;
  bool hasName() => _name != null;

  static ClassesStruct fromMap(Map<String, dynamic> data) => ClassesStruct(
        id: data['id'] as String?,
        name: data['name'] as String?,
      );

  static ClassesStruct? maybeFromMap(dynamic data) =>
      data is Map ? ClassesStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'name': _name,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
      }.withoutNulls;

  static ClassesStruct fromSerializableMap(Map<String, dynamic> data) =>
      ClassesStruct(
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ClassesStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ClassesStruct && id == other.id && name == other.name;
  }

  @override
  int get hashCode => const ListEquality().hash([id, name]);
}

ClassesStruct createClassesStruct({
  String? id,
  String? name,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ClassesStruct(
      id: id,
      name: name,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ClassesStruct? updateClassesStruct(
  ClassesStruct? classes, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    classes
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addClassesStructData(
  Map<String, dynamic> firestoreData,
  ClassesStruct? classes,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (classes == null) {
    return;
  }
  if (classes.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && classes.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final classesData = getClassesFirestoreData(classes, forFieldValue);
  final nestedData = classesData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = classes.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getClassesFirestoreData(
  ClassesStruct? classes, [
  bool forFieldValue = false,
]) {
  if (classes == null) {
    return {};
  }
  final firestoreData = mapToFirestore(classes.toMap());

  // Add any Firestore field values
  classes.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getClassesListFirestoreData(
  List<ClassesStruct>? classess,
) =>
    classess?.map((e) => getClassesFirestoreData(e, true)).toList() ?? [];
