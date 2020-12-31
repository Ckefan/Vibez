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
flutter pub run intl_translation:extract_to_arb --output-dir=i10n lib/main.dart
```
<br>

### 2、Generate /lib/l10n/*dart file

```
flutter pub run intl_translation:generate_from_arb --output-dir=lib/l10n --no-use-deferred-loading lib/main.dart lib/l10n/intl_*.arb
```

### 3、 Extract the code to an ARB file

```
flutter pub pub run intl_translation:extract_to_arb --output-dir=i10n-arb  lib/l10n/localization_intl.dart
```