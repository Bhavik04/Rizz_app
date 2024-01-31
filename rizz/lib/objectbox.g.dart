// GENERATED CODE - DO NOT MODIFY BY HAND
// This code was generated by ObjectBox. To update it run the generator again:
// With a Flutter package, run `flutter pub run build_runner build`.
// With a Dart package, run `dart run build_runner build`.
// See also https://docs.objectbox.io/getting-started#generate-objectbox-code

// ignore_for_file: camel_case_types, depend_on_referenced_packages
// coverage:ignore-file

import 'dart:typed_data';

import 'package:flat_buffers/flat_buffers.dart' as fb;
import 'package:objectbox/internal.dart'; // generated code can access "internal" functionality
import 'package:objectbox/objectbox.dart';
import 'package:objectbox_flutter_libs/objectbox_flutter_libs.dart';

import 'db/modals/user.dart';

export 'package:objectbox/objectbox.dart'; // so that callers only have to import this file

final _entities = <ModelEntity>[
  ModelEntity(
      id: const IdUid(1, 4643737686930460596),
      name: 'User',
      lastPropertyId: const IdUid(7, 9169436890928778469),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 273237302179965456),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(2, 372890020861545965),
            name: 'name',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(3, 3112333347511822020),
            name: 'email',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(4, 1386536797943285672),
            name: 'snapId',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(5, 6693019418257389854),
            name: 'age',
            type: 6,
            flags: 0),
        ModelProperty(
            id: const IdUid(6, 2088031263258165785),
            name: 'gender',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(7, 9169436890928778469),
            name: 'imageUrl',
            type: 9,
            flags: 0)
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[])
];

/// Shortcut for [Store.new] that passes [getObjectBoxModel] and for Flutter
/// apps by default a [directory] using `defaultStoreDirectory()` from the
/// ObjectBox Flutter library.
///
/// Note: for desktop apps it is recommended to specify a unique [directory].
///
/// See [Store.new] for an explanation of all parameters.
Future<Store> openStore(
        {String? directory,
        int? maxDBSizeInKB,
        int? fileMode,
        int? maxReaders,
        bool queriesCaseSensitiveDefault = true,
        String? macosApplicationGroup}) async =>
    Store(getObjectBoxModel(),
        directory: directory ?? (await defaultStoreDirectory()).path,
        maxDBSizeInKB: maxDBSizeInKB,
        fileMode: fileMode,
        maxReaders: maxReaders,
        queriesCaseSensitiveDefault: queriesCaseSensitiveDefault,
        macosApplicationGroup: macosApplicationGroup);

/// Returns the ObjectBox model definition for this project for use with
/// [Store.new].
ModelDefinition getObjectBoxModel() {
  final model = ModelInfo(
      entities: _entities,
      lastEntityId: const IdUid(1, 4643737686930460596),
      lastIndexId: const IdUid(0, 0),
      lastRelationId: const IdUid(0, 0),
      lastSequenceId: const IdUid(0, 0),
      retiredEntityUids: const [],
      retiredIndexUids: const [],
      retiredPropertyUids: const [],
      retiredRelationUids: const [],
      modelVersion: 5,
      modelVersionParserMinimum: 5,
      version: 1);

  final bindings = <Type, EntityDefinition>{
    User: EntityDefinition<User>(
        model: _entities[0],
        toOneRelations: (User object) => [],
        toManyRelations: (User object) => {},
        getId: (User object) => object.id,
        setId: (User object, int id) {
          object.id = id;
        },
        objectToFB: (User object, fb.Builder fbb) {
          final nameOffset = fbb.writeString(object.name);
          final emailOffset = fbb.writeString(object.email);
          final snapIdOffset = fbb.writeString(object.snapId);
          final genderOffset = fbb.writeString(object.gender);
          final imageUrlOffset = fbb.writeString(object.imageUrl);
          fbb.startTable(8);
          fbb.addInt64(0, object.id);
          fbb.addOffset(1, nameOffset);
          fbb.addOffset(2, emailOffset);
          fbb.addOffset(3, snapIdOffset);
          fbb.addInt64(4, object.age);
          fbb.addOffset(5, genderOffset);
          fbb.addOffset(6, imageUrlOffset);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);
          final idParam =
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0);
          final nameParam = const fb.StringReader(asciiOptimization: true)
              .vTableGet(buffer, rootOffset, 6, '');
          final emailParam = const fb.StringReader(asciiOptimization: true)
              .vTableGet(buffer, rootOffset, 8, '');
          final snapIdParam = const fb.StringReader(asciiOptimization: true)
              .vTableGet(buffer, rootOffset, 10, '');
          final ageParam =
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 12, 0);
          final genderParam = const fb.StringReader(asciiOptimization: true)
              .vTableGet(buffer, rootOffset, 14, '');
          final imageUrlParam = const fb.StringReader(asciiOptimization: true)
              .vTableGet(buffer, rootOffset, 16, '');
          final object = User(
              id: idParam,
              name: nameParam,
              email: emailParam,
              snapId: snapIdParam,
              age: ageParam,
              gender: genderParam,
              imageUrl: imageUrlParam);

          return object;
        })
  };

  return ModelDefinition(model, bindings);
}

/// [User] entity fields to define ObjectBox queries.
class User_ {
  /// see [User.id]
  static final id = QueryIntegerProperty<User>(_entities[0].properties[0]);

  /// see [User.name]
  static final name = QueryStringProperty<User>(_entities[0].properties[1]);

  /// see [User.email]
  static final email = QueryStringProperty<User>(_entities[0].properties[2]);

  /// see [User.snapId]
  static final snapId = QueryStringProperty<User>(_entities[0].properties[3]);

  /// see [User.age]
  static final age = QueryIntegerProperty<User>(_entities[0].properties[4]);

  /// see [User.gender]
  static final gender = QueryStringProperty<User>(_entities[0].properties[5]);

  /// see [User.imageUrl]
  static final imageUrl = QueryStringProperty<User>(_entities[0].properties[6]);
}
