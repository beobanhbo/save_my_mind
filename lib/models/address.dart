import 'package:objectbox/objectbox.dart';

@Entity()
class Address {
  @Id()
  int idAddress;
  final String street, district, city;

  Address({
    this.idAddress,
    this.street,
    this.district,
    this.city,
  });
}
