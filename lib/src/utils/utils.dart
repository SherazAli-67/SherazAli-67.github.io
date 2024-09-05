import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';

class Utils {
  static Future<void> portfolioLaunchUrl(String url)async{
    Uri uri = Uri.parse(url);
    if(await canLaunchUrl(uri)){
      await launchUrl(uri);
    }
  }

  static void showToastMessage({String msg = "Copied to clipboard"}){
    Fluttertoast.showToast(msg: msg);
  }
}