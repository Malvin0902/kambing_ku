import 'package:flutter/material.dart';
import 'package:kambing_ku/widgets/left_drawer.dart';
import 'package:kambing_ku/screens/menu.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'dart:convert';

import 'package:provider/provider.dart';

class ProductEntryFormPage extends StatefulWidget {
  const ProductEntryFormPage({super.key});

  @override
  State<ProductEntryFormPage> createState() => _ProductEntryFormPageState();
}

class _ProductEntryFormPageState extends State<ProductEntryFormPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _categoryController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _ratingController = TextEditingController();

  void _resetForm() {
    _formKey.currentState!.reset();
    _nameController.clear();
    _priceController.clear();
    _descriptionController.clear();
    _categoryController.clear();
    _amountController.clear();
    _ratingController.clear();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _priceController.dispose();
    _descriptionController.dispose();
    _categoryController.dispose();
    _amountController.dispose();
    _ratingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();

    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Add Product',
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      drawer: const LeftDrawer(),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Nama Produk
              _buildTextField(
                context,
                controller: _nameController,
                label: "Product Name",
                hint: "Enter Product Name",
                maxLength: 100,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Product name cannot be empty.';
                  }
                  if (value.length > 100) {
                    return 'Product name cannot exceed 100 characters.';
                  }
                  return null;
                },
              ),
              // Harga Produk
              _buildTextField(
                context,
                controller: _priceController,
                label: "Product Price",
                hint: "Enter Product Price",
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Product price cannot be empty.';
                  }
                  final price = int.tryParse(value);
                  if (price == null || price < 0) {
                    return 'Enter a valid positive integer for price.';
                  }
                  return null;
                },
              ),
              // Deskripsi Produk
              _buildTextField(
                context,
                controller: _descriptionController,
                label: "Product Description",
                hint: "Enter Product Description",
                maxLength: 250,
                maxLines: 3,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Product description cannot be empty.';
                  }
                  return null;
                },
              ),
              
              // Tombol Simpan
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.primary,
                    ),
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        final response = await request.postJson(
                          "http://localhost:8000/create-flutter/",
                          jsonEncode(<String, String>{
                            'name': _nameController.text,
                            'price': _priceController.text,
                            'description': _descriptionController.text,
                          }),
                        );

                        if (context.mounted) {
                          if (response['status'] == 'success') {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Product successfully added!"),
                              ),
                            );
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MyHomePage(),
                              ),
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Error occurred. Try again."),
                              ),
                            );
                          }
                        }
                      }
                    },
                    child: const Text(
                      "Save",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Padding _buildTextField(BuildContext context,
      {required TextEditingController controller,
      required String label,
      required String hint,
      int? maxLength,
      int? maxLines,
      TextInputType keyboardType = TextInputType.text,
      required String? Function(String?) validator}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hint,
          labelText: label,
          labelStyle: TextStyle(color: Theme.of(context).colorScheme.primary),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).colorScheme.primary),
          ),
        ),
        maxLength: maxLength,
        maxLines: maxLines ?? 1,
        keyboardType: keyboardType,
        validator: validator,
      ),
    );
  }
}
