import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future addRecord(
    lname,
    fname,
    mname,
    license,
    type,
    bday,
    platenumber,
    model,
    classification,
    address,
    place,
    ownername,
    owneraddress,
    img,
    desc,
    payment) async {
  final docUser = FirebaseFirestore.instance.collection('Records').doc();

  final json = {
    'license': license,
    'fname': fname,
    'mname': mname,
    'lname': lname,
    'profilePicture': 'https://cdn-icons-png.flaticon.com/256/149/149071.png',
    'status': 'Pending',
    'userId': FirebaseAuth.instance.currentUser!.uid,
    'type': type,
    'dateTime': DateTime.now(),
    'isPaid': false,
    'payment': payment,
    'bday': bday,
    'platenumber': platenumber,
    'model': model,
    'classification': classification,
    'address': address,
    'place': place,
    'ownername': ownername,
    'owneraddress': owneraddress,
    'img': img,
    'desc': desc,
    'day': DateTime.now().day,
    'month': DateTime.now().month,
    'refno': '',
    'paymentType': '',
  };

  await docUser.set(json);

  return docUser.id;
}
