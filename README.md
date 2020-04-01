# zf_flutter_kit

A flutter suite library containing common components(button,text,dialog,slider,route page etc.) for easy use.

# Instructions for use
For more,see example project.

# Installing
Use this package as a library
1. Depend on it
Add this to your package's pubspec.yaml file:
```yaml
dependencies:
  zf_flutter_kit: ^0.0.2
```

2. Install it
You can install packages from the command line:

with Flutter:


```yaml
flutter pub get
```

Alternatively, your editor might support ```flutter pub get```. Check the docs for your editor to learn more.

3. Import it
Now in your Dart code, you can use:


```dart
import 'package:zf_flutter_kit/zf_flutter_kit.dart';
```

# Screenshot

## Widget
### ZFButton
```dart
    ZFButton(
      {this.text = '',
      this.onPressed,
      this.borderRadius = 8,
      this.borderWidth = 1,
      this.color = Colors.white,
      this.highlightColor = _highlightColor,
      this.textColor = _color,
      this.highlightTextColor = Colors.white,
      this.borderColor = _color,
      this.highlightBorderColor = _highlightColor,
      this.textStyle,
      this.selected = false,
      });
```
### Text、BaseWidget（a simple PageRoute）、Scrollview、slider etc.

![widget](https://raw.githubusercontent.com/jtans/zf_flutter_kit/master/screenshot/Simulator%20Screen%20Shot%20-%20iPhone%2011%20Pro%20Max%20-%202020-03-31%20at%2015.02.59.png)

## Dialog
```dart
ZFAlertDialog.show(context, 'Your Title', 'Your Message',
                onOkPressed: () {
              return true; //return true to close, when press ok button
            });
```
![image](https://raw.githubusercontent.com/jtans/zf_flutter_kit/master/screenshot/Simulator%20Screen%20Shot%20-%20iPhone%2011%20Pro%20Max%20-%202020-03-31%20at%2015.03.06.png)
## custom dialog
```dart
ZFAlertDialog.show(context, 'Your Title', 'Your Message',
                onOkPressed: () {
              return true;
            }, footerContent: () {
              return Container(
                color: Colors.red,
                width: 200,
                height: 44,
              );
            }());
```
![image](https://raw.githubusercontent.com/jtans/zf_flutter_kit/master/screenshot/Simulator%20Screen%20Shot%20-%20iPhone%2011%20Pro%20Max%20-%202020-03-31%20at%2015.03.11.png)

## custom dialog content
```dart
showDialog(
                context: context,
                builder: (ctx) {
                  return ZFDialog(
                    cancelText: 'Cancel',
                    okText: 'Ok',
                    content: () {
                      return Image.network(
                          'https://www.baidu.com/img/bd_logo1.png');
                    }(),
                  );
                });
```
![image](https://raw.githubusercontent.com/jtans/zf_flutter_kit/master/screenshot/Simulator%20Screen%20Shot%20-%20iPhone%2011%20Pro%20Max%20-%202020-03-31%20at%2015.03.16.png)

## Navigator
```dart
//push open a page
Navigator.of(context).zfpush(MinePage());

//push open a webview page
Navigator.of(context)
                .zfopenWebView('https://github.com', 'Your web page title');
```
![image](https://raw.githubusercontent.com/jtans/zf_flutter_kit/master/screenshot/push.gif)

