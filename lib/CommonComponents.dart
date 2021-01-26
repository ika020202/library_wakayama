import 'package:url_launcher/url_launcher.dart';

Future<void> launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    final Error error = ArgumentError('Could not launch $url');
    throw error;
  }
}

void openMailApp() async {
  final title = Uri.encodeComponent('ほんある？和歌山への問い合わせ');
  final body = Uri.encodeComponent('--この文より下へご記入ください--');
  const mailAddress = 'ika020202@gmail.com';

  return launchURL('mailto:$mailAddress?subject=$title&body=$body');
}
