// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: camel_case_types

import 'dart:typed_data';

import 'package:objectbox/flatbuffers/flat_buffers.dart' as fb;
import 'package:objectbox/internal.dart'; // generated code can access "internal" functionality
import 'package:objectbox/objectbox.dart';
import 'package:objectbox_flutter_libs/objectbox_flutter_libs.dart';

import 'models/address.dart';
import 'models/note.dart';

export 'package:objectbox/objectbox.dart'; // so that callers only have to import this file

final _entities = <ModelEntity>[
  ModelEntity(
      id: const IdUid(1, 3563560434961358549),
      name: 'Address',
      lastPropertyId: const IdUid(4, 3119671340870464044),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 56873495277224829),
            name: 'idAddress',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(2, 8748257174137005023),
            name: 'street',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(3, 6413472077094014176),
            name: 'district',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(4, 3119671340870464044),
            name: 'city',
            type: 9,
            flags: 0)
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[]),
  ModelEntity(
      id: const IdUid(2, 8438038585892174268),
      name: 'Note',
      lastPropertyId: const IdUid(4, 3478176994265223919),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 605178428652928819),
            name: 'idNote',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(2, 4911027794709653178),
            name: 'title',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(3, 8650664411430688620),
            name: 'description',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(4, 3478176994265223919),
            name: 'timeStamp',
            type: 9,
            flags: 0)
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[])
];

/// Open an ObjectBox store with the model declared in this file.
Future<Store> openStore(
        {String directory,
        int maxDBSizeInKB,
        int fileMode,
        int maxReaders,
        bool queriesCaseSensitiveDefault = true,
        String macosApplicationGroup}) async =>
    Store(getObjectBoxModel(),
        directory: directory ?? (await defaultStoreDirectory()).path,
        maxDBSizeInKB: maxDBSizeInKB,
        fileMode: fileMode,
        maxReaders: maxReaders,
        queriesCaseSensitiveDefault: queriesCaseSensitiveDefault,
        macosApplicationGroup: macosApplicationGroup);

/// ObjectBox model definition, pass it to [Store] - Store(getObjectBoxModel())
ModelDefinition getObjectBoxModel() {
  final model = ModelInfo(
      entities: _entities,
      lastEntityId: const IdUid(2, 8438038585892174268),
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
    Address: EntityDefinition<Address>(
        model: _entities[0],
        toOneRelations: (Address object) => [],
        toManyRelations: (Address object) => {},
        getId: (Address object) => object.idAddress,
        setId: (Address object, int id) {
          object.idAddress = id;
        },
        objectToFB: (Address object, fb.Builder fbb) {
          final streetOffset =
              object.street == null ? null : fbb.writeString(object.street);
          final districtOffset =
              object.district == null ? null : fbb.writeString(object.district);
          final cityOffset =
              object.city == null ? null : fbb.writeString(object.city);
          fbb.startTable(5);
          fbb.addInt64(0, object.idAddress ?? 0);
          fbb.addOffset(1, streetOffset);
          fbb.addOffset(2, districtOffset);
          fbb.addOffset(3, cityOffset);
          fbb.finish(fbb.endTable());
          return object.idAddress ?? 0;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);

          final object = Address(
              idAddress: const fb.Int64Reader()
                  .vTableGetNullable(buffer, rootOffset, 4),
              street: const fb.StringReader()
                  .vTableGetNullable(buffer, rootOffset, 6),
              district: const fb.StringReader()
                  .vTableGetNullable(buffer, rootOffset, 8),
              city: const fb.StringReader()
                  .vTableGetNullable(buffer, rootOffset, 10));

          return object;
        }),
    Note: EntityDefinition<Note>(
        model: _entities[1],
        toOneRelations: (Note object) => [],
        toManyRelations: (Note object) => {},
        getId: (Note object) => object.idNote,
        setId: (Note object, int id) {
          object.idNote = id;
        },
        objectToFB: (Note object, fb.Builder fbb) {
          final titleOffset =
              object.title == null ? null : fbb.writeString(object.title);
          final descriptionOffset = object.description == null
              ? null
              : fbb.writeString(object.description);
          final timeStampOffset = object.timeStamp == null
              ? null
              : fbb.writeString(object.timeStamp);
          fbb.startTable(5);
          fbb.addInt64(0, object.idNote ?? 0);
          fbb.addOffset(1, titleOffset);
          fbb.addOffset(2, descriptionOffset);
          fbb.addOffset(3, timeStampOffset);
          fbb.finish(fbb.endTable());
          return object.idNote ?? 0;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);

          final object = Note(
              idNote: const fb.Int64Reader()
                  .vTableGetNullable(buffer, rootOffset, 4),
              title: const fb.StringReader()
                  .vTableGetNullable(buffer, rootOffset, 6),
              description: const fb.StringReader()
                  .vTableGetNullable(buffer, rootOffset, 8),
              timeStamp: const fb.StringReader()
                  .vTableGetNullable(buffer, rootOffset, 10));

          return object;
        })
  };

  return ModelDefinition(model, bindings);
}

/// [Address] entity fields to define ObjectBox queries.
class Address_ {
  /// see [Address.idAddress]
  static final idAddress =
      QueryIntegerProperty<Address>(_entities[0].properties[0]);

  /// see [Address.street]
  static final street =
      QueryStringProperty<Address>(_entities[0].properties[1]);

  /// see [Address.district]
  static final district =
      QueryStringProperty<Address>(_entities[0].properties[2]);

  /// see [Address.city]
  static final city = QueryStringProperty<Address>(_entities[0].properties[3]);
}

/// [Note] entity fields to define ObjectBox queries.
class Note_ {
  /// see [Note.idNote]
  static final idNote = QueryIntegerProperty<Note>(_entities[1].properties[0]);

  /// see [Note.title]
  static final title = QueryStringProperty<Note>(_entities[1].properties[1]);

  /// see [Note.description]
  static final description =
      QueryStringProperty<Note>(_entities[1].properties[2]);

  /// see [Note.timeStamp]
  static final timeStamp =
      QueryStringProperty<Note>(_entities[1].properties[3]);
}
