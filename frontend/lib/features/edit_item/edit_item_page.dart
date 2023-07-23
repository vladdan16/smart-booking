import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:frontend/features/edit_item/edit_item.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class EditItemPage extends StatelessWidget {
  const EditItemPage({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final priceController = TextEditingController();
    final locationController = TextEditingController();
    final descriptionController = TextEditingController();
    final photoList = context.watch<EditItemModel>().photoList;
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => context.go('/'),
            ),
            title: const Text('smart_booking').tr(),
          ),
          SliverToBoxAdapter(
            child: Center(
              child: const Text(
                'edit_item',
                style: TextStyle(fontSize: 20),
              ).tr(),
            ),
          ),
          SliverToBoxAdapter(
            child: Form(
              key: formKey,
              child: Column(
                children: <Widget>[
                  const SizedBox(height: 20),
                  SizedBox(
                    width: 800,
                    child: TextFormField(
                      controller: priceController,
                      decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          labelText: 'price'.tr(),
                          suffixText: 'ETH',
                          hintText: '0.02'),
                      validator: (value) {
                        if (value == null) return null;
                        try {
                          double.parse(value);
                          return null;
                        } catch (_) {
                          return 'invalid_decimal_price'.tr();
                        }
                      },
                      onChanged: (value) => formKey.currentState?.validate(),
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: 800,
                    child: TextField(
                      controller: locationController,
                      decoration: InputDecoration(
                        labelText: 'location'.tr(),
                        hintText: 'New York, Time Square',
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: 800,
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: TextField(
                          controller: descriptionController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'item_description'.tr(),
                          ),
                          minLines: 4,
                          maxLines: null,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: 800,
                    child: const Text('photos').tr(),
                  ),
                  const SizedBox(width: 800, child: Divider()),
                  ...List.generate(
                    photoList.length,
                    (i) {
                      return SizedBox(
                        width: 800,
                        child: ListTile(
                          title: Text(photoList[i]),
                          leading: Text('$i'),
                          trailing: IconButton(
                            onPressed: () {
                              // TODO: show edit photo dialog
                            },
                            icon: const Icon(Icons.edit),
                          ),
                        ),
                      );
                    },
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // TODO: show add photo dialog (same as edit)
                    },
                    child: const Text('add').tr(),
                  ),
                  FilledButton(
                    onPressed: () {
                      // TODO: save item
                    },
                    child: const Text('save').tr(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
