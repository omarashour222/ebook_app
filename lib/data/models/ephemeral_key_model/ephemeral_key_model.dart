import 'associated_object.dart';

class EphemeralKeyModel {
  String? id;
  String? object;
  List<AssociatedObject>? associatedObjects;
  int? created;
  int? expires;
  bool? livemode;
  String? secret;

  EphemeralKeyModel({
    this.id,
    this.object,
    this.associatedObjects,
    this.created,
    this.expires,
    this.livemode,
    this.secret,
  });

  factory EphemeralKeyModel.fromJson(Map<String, dynamic> json) {
    return EphemeralKeyModel(
      id: json['id'] as String?,
      object: json['object'] as String?,
      associatedObjects: (json['associated_objects'] as List<dynamic>?)
          ?.map((e) => AssociatedObject
              .fromIdEphkey1Qnl8zFMjr1bgCwnK7Qlyu1VObjectEphemeralKeyAssociatedObjectsIdCusRFqTz521xYdEf4TypeCustomerCreated1732136941Expires1732140541LivemodeFalseSecretEkTestYwNjdF8xUu1VofvgtWpyMwJnQ3duLdr4Q1BhnEhYVlVsY0FwdVhSbDMyZmRoru5zRvy0eng00uGngyDrX(
                  e as Map<String, dynamic>))
          .toList(),
      created: json['created'] as int?,
      expires: json['expires'] as int?,
      livemode: json['livemode'] as bool?,
      secret: json['secret'] as String?,
    );
  }

  Map<String, dynamic>
      toIdEphkey1Qnl8zFMjr1bgCwnK7Qlyu1VObjectEphemeralKeyAssociatedObjectsIdCusRFqTz521xYdEf4TypeCustomerCreated1732136941Expires1732140541LivemodeFalseSecretEkTestYwNjdF8xUu1VofvgtWpyMwJnQ3duLdr4Q1BhnEhYVlVsY0FwdVhSbDMyZmRoru5zRvy0eng00uGngyDrX() {
    return {
      'id': id,
      'object': object,
      'associated_objects': associatedObjects
          ?.map((e) => e
              .toIdEphkey1Qnl8zFMjr1bgCwnK7Qlyu1VObjectEphemeralKeyAssociatedObjectsIdCusRFqTz521xYdEf4TypeCustomerCreated1732136941Expires1732140541LivemodeFalseSecretEkTestYwNjdF8xUu1VofvgtWpyMwJnQ3duLdr4Q1BhnEhYVlVsY0FwdVhSbDMyZmRoru5zRvy0eng00uGngyDrX())
          .toList(),
      'created': created,
      'expires': expires,
      'livemode': livemode,
      'secret': secret,
    };
  }
}
