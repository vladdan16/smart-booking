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
    final priceController = TextEditingController(
      text: context.read<EditItemModel>().price.toString(),
    );
    final locationController = TextEditingController(
      text: context.read<EditItemModel>().location,
    );
    final descriptionController = TextEditingController(
      text: context.read<EditItemModel>().description,
    );
    final photoList = context.watch<EditItemModel>().imageList;
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
                        hintText: '0.02',
                      ),
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.next,
                      validator: (value) {
                        if (value == null) return null;
                        try {
                          final res = double.parse(value);
                          if (res <= 0) {
                            return 'invalid_price'.tr();
                          }
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
                      keyboardType: TextInputType.streetAddress,
                      textInputAction: TextInputAction.next,
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
                          keyboardType: TextInputType.multiline,
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
                  const SizedBox(height: 10),
                  const SizedBox(width: 800, child: Divider()),
                  ...List.generate(
                    photoList.length,
                    (i) {
                      return SizedBox(
                        width: 800,
                        child: ListTile(
                          title: Text(photoList[i]),
                          leading: Text('${i + 1}'),
                          trailing: IconButton(
                            onPressed: () async {
                              final res = await showEditPhotoDialog(
                                context,
                                initial: photoList[i],
                              );
                              if (context.mounted) {
                                context.read<EditItemModel>().editImage(i, res);
                              }
                            },
                            icon: const Icon(Icons.edit),
                          ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () async {
                      final res = await showEditPhotoDialog(context);
                      if (context.mounted && res != null) {
                        context.read<EditItemModel>().addImage(res);
                      }
                    },
                    child: const Text('add_photo').tr(),
                  ),
                  const SizedBox(height: 30),
                  FilledButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        context.read<EditItemModel>().saveItem(
                              price: double.parse(priceController.text),
                              location: locationController.text,
                              description: descriptionController.text,
                            );
                      }
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

  Future<String?> showEditPhotoDialog(
    BuildContext context, {
    String? initial,
  }) async {
    final controller = TextEditingController(text: initial);
    final String? res = await showDialog<String>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('enter_image_url').tr(),
          content: TextField(
            controller: controller,
            decoration: const InputDecoration(
              hintText: 'https://example.com/images/1.png',
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () => context.pop(),
              child: const Text('delete').tr(),
            ),
            TextButton(
              onPressed: () => context.pop(controller.text.trim()),
              child: const Text('save').tr(),
            ),
          ],
        );
      },
    );
    if (res == null || res.trim().isEmpty) {
      return null;
    }
    return res;
  }
}
