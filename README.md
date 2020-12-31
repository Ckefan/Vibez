# Vibez

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.



### 1、Update the rely on

```
flutter packages get
```
<br>

### 2、Run the project

```
flutter run 
```
<br>

### 3、Generate models
```
flutter packages pub run json_model
```
<br>

------
## internationalization

### 1、Generate arb file

#### Gennerate messages_all.dart ...

```
flutter pub run intl_translation:extract_to_arb --output-dir=l10n lib/main.dart
```
<br>


### 2、Write the variable in the "lib/l10n/localization_intl.dart" file

<br>

### 3、Generate ARB file

```
flutter pub run intl_translation:extract_to_arb --output-dir=l10n-arb lib/l10n/localization_intl.dart
```

<br>

### 4、 Copy the variables from the "l10n-arb/intl_messages.arb" file to another multilingual file, such as the "intl_zh_CN.arb" file

<br>

### 5、 Inject the variable into the corresponding multilingual DART file,Mainly modify the after files
```
flutter pub  run intl_translation:generate_from_arb --output-dir=lib/l10n --no-use-deferred-loading lib/l10n/localization_intl.dart l10n-arb/intl_messages.arb l10n-arb/intl_zh_CN.arb
```