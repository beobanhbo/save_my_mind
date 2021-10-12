import 'package:flutter/cupertino.dart';
import 'package:objectbox/objectbox.dart';
import 'package:savemymind/models/address.dart';

enum NoteType { reminder, store, facility }
enum OptionType { calendar, time, price }

@Entity()
class Note {
  @Id()
  int idNote;

  final String title, description;
  final Address address;
  final NoteType noteType;
  final List<Image> listImage;
  final String timeStamp;

  Note({
    this.idNote,
    this.title,
    this.description,
    this.address,
    this.noteType,
    this.listImage = const [],
    this.timeStamp,
  });
}
