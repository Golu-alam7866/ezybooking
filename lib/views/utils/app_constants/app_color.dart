import 'package:flutter/material.dart';

class AppColors {
  static Color primary(BuildContext context) => Theme.of(context).primaryColor;
  static Color secondary(BuildContext context) => Theme.of(context).colorScheme.secondary;
  static Color background(BuildContext context) => Theme.of(context).scaffoldBackgroundColor;
  static Color surface(BuildContext context) => Theme.of(context).colorScheme.surface;
  static Color error(BuildContext context) => Theme.of(context).colorScheme.error;
  static Color onPrimary(BuildContext context) => Theme.of(context).colorScheme.onPrimary;
  static Color onSecondary(BuildContext context) => Theme.of(context).colorScheme.onSecondary;
  static Color onBackground(BuildContext context) => Theme.of(context).colorScheme.onSurface;
  static Color onSurface(BuildContext context) => Theme.of(context).colorScheme.onSurface;
  static Color onError(BuildContext context) => Theme.of(context).colorScheme.onError;
  static Color textPrimary(BuildContext context) => Theme.of(context).textTheme.bodyLarge?.color ?? Colors.black;
  static Color textSecondary(BuildContext context) => Theme.of(context).textTheme.bodyMedium?.color ?? Colors.grey;
}
