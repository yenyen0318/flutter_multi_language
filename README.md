# Flutter - 多語系
## 安裝相關套件
語系設定
```
flutter pub add flutter_localizations --sdk=flutter
flutter pub add intl:any
```
[官網](https://pub.dev/packages/flutter_localizations)

## 修改 pubspec.yaml
```
flutter:
  generate: true
```

## MaterialApp 添加設定檔
```dart
MaterialApp(
    localizationsDelegates: const [
      AppLocalizations.delegate,    //依具系統自懂調整語系
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
    ],
    supportedLocales: const [
      Locale('en'), // English
      Locale('zh'), // 中文
    ],
    locale: ref.watch(languageProvider),    //手動調整語系
    home: const HomePage()
);
```

## 添加多語系
### STEP 1 : 建立多語系資料夾及語系檔
在 lib 資料夾下建立 l10n，並在資料夾底下添加語系檔，命名方式為 `app_語系縮寫.dart`，例如: app_en.dart、app_zh.dart，MaterialApp 設定檔上有哪幾個資源語系就要添加幾個。
### STEP 2 : 添加語系檔內容
下面以 app_en.dart、app_zh.dart 為例: 

* app_en.dart
```dart
{
  "appName": "app name",
  "@appName": {
    "description": "app 名稱"
  }
}
```
* app_zh.dart
```dart
{
    "@@locale": "zh",
    "appName": "app 名稱"
}
```
### STEP 3 : 自動生成語系檔
撰寫完成後，下以下指令生成語系檔
```
flutter gen-l10n
```
就會在 .dart_tool/flutter_gen/gen_l10n 底下出現自動生成的語系檔。
#### <font color='red'>注意！！每次更新語系檔皆需重新下指令</font>

### STEP 4 : 各頁面使用方式
```dart
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

Text(AppLocalizations.of(context).appName)
```

## 實作範例
程式碼位置: 

 ![](https://i.imgur.com/ZPiDR3a.gif)


## 其他事項
* 預設支援語系使用**繁體中文**，例如：長按輸入匡會顯示的複製 貼上 全選等文字的語系，若未加上`countryCode`會顯示簡體中文

    ```dart
    MaterialApp(
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,    //IOS
        ],
        supportedLocales: const [
          Locale.fromSubtags(
              languageCode: 'zh', scriptCode: 'Hant', countryCode: 'TW'),
        ],
        locale: const Locale.fromSubtags(
            languageCode: 'zh', scriptCode: 'Hant', countryCode: 'TW'),
    )
    ```

## 參考資料
1. [官網教學](https://docs.flutter.dev/development/accessibility-and-localization/internationalization)
2. [多語系縮寫對照](https://www.science.co.il/language/Codes.php)


## 其他 flutter 相關內容
https://hackmd.io/@BzWzq-x9Rb2G4WG03gcyKg/SyeeSXntc

###### tags: `flutter`