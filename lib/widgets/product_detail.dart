import 'package:flutter/material.dart';
import 'package:depok_keebs/models/product_entry.dart';

class ProductDetailPage extends StatelessWidget {
  final Product product;

  const ProductDetailPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.fields.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Nama produk
            Text(
              product.fields.name,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            // Harga produk
            Text(
              "Price: Rp ${product.fields.price.toString()}",
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 16),
            // Deskripsi produk
            Text(
              product.fields.description,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            // Kategori produk
            Text(
              "Category: ${product.fields.category}",
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            // Jenis koneksi
            Text(
              "Connection Type: ${product.fields.connectionType}",
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            // Layout keyboard
            Text(
              "Layout: ${product.fields.layout}",
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            // Gambar produk (jika tersedia)
            if (product.fields.image.isNotEmpty)
              Image.network(
                product.fields.image,
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              )
            else
              const Text(
                "No image available",
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
            const Spacer(),
            // Tombol Kembali
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Kembali'),
            ),
          ],
        ),
      ),
    );
  }
}
