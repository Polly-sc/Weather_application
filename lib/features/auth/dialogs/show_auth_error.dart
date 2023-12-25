import 'package:flutter/material.dart' show BuildContext;
import 'package:flutter_developer_test_task/features/auth/dialogs/generic_dialog.dart';
import 'package:flutter_developer_test_task/features/auth/errors/auth_errors.dart';

Future<void> showAuthError({
  required AuthError authError,
  required BuildContext context,
}) {
  return showGenericDialog<void>(
    context: context,
    title: authError.dialogTitle,
    content: authError.dialogText,
    optionsBuilder: () => {
      'OK': true,
    },
  );
}