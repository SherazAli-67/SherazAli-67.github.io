import 'package:fluttertoast/fluttertoast.dart';
import 'package:portfolio/src/constants/string_constant.dart';
import 'package:url_launcher/url_launcher.dart';

class Utils {
  static Future<void> portfolioLaunchUrl(String url)async{
    Uri uri = Uri.parse(url);
    if(await canLaunchUrl(uri)){
      await launchUrl(uri);
    }
  }

  static Future<void> launchEmail()async{
    String subject = 'Required Flutter Developer';
    String body = 'Hi, Sheraz';
    final Uri params = Uri(
      scheme: 'mailto',
      path: myEmail,
      query: 'subject=$subject&body=$body', // Add subject and body here
    );

    if (await canLaunchUrl(params)) {
      await launchUrl(params);
    } else {
      throw 'Could not launch $params';
    }
  }

  static void showToastMessage({String msg = "Copied to clipboard"}){
    Fluttertoast.showToast(msg: msg);
  }
}