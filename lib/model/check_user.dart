import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserProvider with ChangeNotifier {
  String _result = "";

  String get result => _result;
  void setResult(String value) {
    _result = value;
    notifyListeners();
  }

  late String _imageURL;
  String get imageURL => _imageURL;

  List<String> URLs = [
    "https://media.istockphoto.com/vectors/man-avatar-icon-man-flat-icon-man-faceless-avatar-man-character-vector-id1027705656?k=6&m=1027705656&s=170667a&w=0&h=NbSJL7Ko0eFpRi4gKcD4EAMvRRLdXPY6GF4NsrlpSX8=",
    "https://th.bing.com/th/id/OIP.x7X2oAehk5M9IvGwO_K0PgHaHa?rs=1&pid=ImgDetMain",
    "https://apps.quanticfoundry.com/static/images/avatars/1.42cb759b688c.png",
    "https://www.pngall.com/wp-content/uploads/12/Avatar-Profile-Vector-PNG-File.png",
    "https://365webresources.com/wp-content/uploads/2016/09/FREE-PROFILE-AVATARS.png",
    "https://cdn4.iconfinder.com/data/icons/avatar-circle-1-1/72/39-1024.png",
    "https://th.bing.com/th/id/OIP.aqvNSWth1HsCmSrEr_xsBwAAAA?rs=1&pid=ImgDetMain",
    "https://miro.medium.com/max/2400/1*dRFS0i1wsIK1yZRIo3bSjQ.png",
    "https://www.kindpng.com/picc/m/52-526237_avatar-profile-hd-png-download.png",
    "https://vityarthi.com/store/1/custom/ashutosh.jpg"
  ];
  ImageChoice(int index) {
    _imageURL = URLs[index - 1];
    notifyListeners();
  }
}
