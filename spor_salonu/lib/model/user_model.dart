class UserModel {
  String? uid;
  String? email;
  String? firstname;
  String? telnumber;

  UserModel({this.uid, this.email, this.firstname, this.telnumber});

  //data from server(firebase baglantisi)
  factory UserModel.fromMap(map) {
    return UserModel(
      uid: map['uid'],
      email: map['email'],
      firstname: map['firstname'],
      telnumber: map['telnumber'],
    );
  }

  //sending data to our server
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'firstname': firstname,
      'telnumber': telnumber,
    };
  }
}
