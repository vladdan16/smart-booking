import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

Future<String?> showLoginDialog(
    BuildContext context) async {
  final controller = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final String? res = await showDialog<String>(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text('enter_private_key').tr(),
        content: Form(
          key: formKey,
          child: TextFormField(
            controller: controller,
            obscureText: true,
            validator: (value) {
              if (value == null) return null;
              if (value.length == 64) return null;
              return 'Invalid length';
            },
          ),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () => context.pop(),
            child: const Text('close').tr(),
          ),
          TextButton(
            onPressed: () {
              if (formKey.currentState!.validate()) {
                context.pop(controller.text);
              }
            },
            child: const Text('login').tr(),
          ),
        ],
      );
    },
  );
  return res;
}