import 'package:flutter/cupertino.dart';
import 'package:objectbox/objectbox.dart';
import 'package:savemymind/models/address.dart';

enum NoteType { reminder, store, facility }
enum OptionType { calendar, time, price }

@Entity()
class Note {
  @Id()
  int idNote;

  final String title;
  final String? description;
  final Address address;
  final NoteType noteType;
  final List<Image> listImage;
  final String? timeStamp;

  Note({
    required this.idNote,
    required this.title,
    this.description,
    required this.address,
    required this.noteType,
    this.listImage = const [],
    this.timeStamp,
  });
}
