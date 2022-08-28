import '../../models/friends_model.dart';

class UtilityController {
  List<String> networks = [
    'assets/mtn.png',
    'assets/glo.png',
    'assets/nine_mobile.png',
    'assets/airtel.png',
  ];

  List<DashrFriend> friends = [
    DashrFriend('assets/picture.png', 'All\nContacts'),
    DashrFriend('assets/picture.png', 'Daniel\n Oladunjoye'),
    DashrFriend('assets/picture.png', 'Cynthia\nObiagwu'),
    DashrFriend('assets/picture.png', 'Destiny\nOkpe'),
    DashrFriend('assets/picture.png', 'Damilola\nAbdulMuiz'),
    DashrFriend('assets/picture.png', 'John\nDoe'),
  ];
  final accounts = ['Dashr 1', 'Dashr 2', 'Dashr 3'];
  final dataPlan = ['Plan 1', 'Plan 2', 'Plan 3'];
  String plan = 'plan 1';
  String account = 'Dashr 1';
  var recepient = 1;
}
