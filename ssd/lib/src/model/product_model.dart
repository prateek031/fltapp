
class ProductResponse {
  final bool returnVal;
  final ProductData data;

  ProductResponse({
    required this.returnVal,
    required this.data,
  });

  factory ProductResponse.fromJson(Map<String, dynamic> json) {
    return ProductResponse(
      returnVal: json['return'] ?? false,
      data: ProductData.fromJson(json['data'] ?? {}),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'return': returnVal,
      'data': data.toJson(),
    };
  }
}

class ProductData {
  final int currentPage;
  final List<Product> productList;

  ProductData({
    required this.currentPage,
    required this.productList,
  });

  factory ProductData.fromJson(Map<String, dynamic> json) {
    return ProductData(
      currentPage: json['current_page'] ?? 0,
      productList: (json['data'] as List<dynamic>?)
              ?.map((e) => Product.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'current_page': currentPage,
      'data': productList.map((product) => product.toJson()).toList(),
    };
  }
}

class Product {
  final int id;
  final String productName;
  final String productDetail;
  final String description;
  final String printName;
  final int category;
  final int ? subCategory;
  final CustomerInventory? customerInventories;

  Product({
    required this.id,
    required this.productName,
    required this.productDetail,
    required this.description,
    required this.printName,
    required this.category,
    this.subCategory,
    this.customerInventories,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] ?? 0,
      productName: json['product_name'] ?? '',
      productDetail: json['product_detail'] ?? '',
      description: json['describtion'] ?? 'No Discription Avilable ',
      category: json['category'] ?? 0,
      subCategory: json['sub_category'],
      printName: json["print_name"],
      customerInventories: CustomerInventory.fromJson(json['customer_inventories']??{}),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'product_name': productName,
      'product_detail': productDetail,
      'describtion': description,
      'print_name': printName,
      'category': category,
      'sub_category': subCategory,
      'customer_inventories': customerInventories?.toJson(),
    };
  }
}

class CustomerInventory {
  final int id;
  final int productId;
  final String availableQuantity;
  final Transaction transaction;
  final Barcode barcode;
  // final Batch batch;

  CustomerInventory({
    required this.id,
    required this.productId,
    required this.availableQuantity,
    required this.transaction,
    required this.barcode,
    // required this.batch,
  });

  factory CustomerInventory.fromJson(Map<String, dynamic> json) {
    return CustomerInventory(
      id: json['id'] ?? 0,
      productId: json['product_id'] ?? 0,
      availableQuantity: json['avaliable_quantity'] ?? '',
      transaction: Transaction.fromJson(json['transaction']),
      barcode: Barcode.fromJson(json['barcode']),
      // batch: Batch.fromJson(json['batch']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'product_id': productId,
      'avaliable_quantity': availableQuantity,
      'transaction': transaction.toJson(),
      // 'barcode': barcode.toJson(),
      // 'batch': batch.toJson(),
    };
  }
}

class Transaction {
  final int id;
  final int userId;
  final int inventoryId;
  final int productId;
  final int batchId;
  final PurchaseData purchaseData;

  Transaction({
    required this.id,
    required this.userId,
    required this.inventoryId,
    required this.productId,
    required this.batchId,
    required this.purchaseData,
  });

  factory Transaction.fromJson(Map<String, dynamic> json) {
    return Transaction(
      id: json['id'] ?? 0,
      userId: json['user_id'] ?? 0,
      inventoryId: json['inventory_id'] ?? 0,
      productId: json['product_id'] ?? 0,
      batchId: json['batch_id'] ?? 0,
      purchaseData: PurchaseData.fromJson(json['purchase_data'] ?? {}),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'inventory_id': inventoryId,
      'product_id': productId,
      'batch_id': batchId,
      'purchase_data': purchaseData.toJson(),
    };
  }
}

class PurchaseData {
   dynamic id;
   dynamic productId;
   dynamic productBarcodeId;
   dynamic billId;
   dynamic batchId;
   dynamic mfgDate;
   dynamic expDate;
   dynamic gst;
   dynamic gstType;
   dynamic mrp;
   dynamic purchasePrice;
   dynamic tradeDiscountPrice;
   dynamic tradeDiscountPercentage;
   dynamic quantity;
   dynamic taxablePrice;
   dynamic sellingPrice;
   dynamic defaultMargin;
   dynamic originalSellingPrice;
   dynamic marginType;
   dynamic defaultPrice;
   dynamic productSchemeDiscountPerQuantity;
   dynamic getBuy;
   dynamic getFree;
  final List<ProductSlab> productSlab;
  // final List<dynamic> freeItems;

  PurchaseData({
    required this.id,
    required this.productId,
    required this.productBarcodeId,
    required this.billId,
    required this.batchId,
    required this.mfgDate,
    required this.expDate,
    required this.gst,
    required this.gstType,
    required this.mrp,
    required this.purchasePrice,
    required this.tradeDiscountPrice,
    required this.tradeDiscountPercentage,
    required this.quantity,
    required this.taxablePrice,
    required this.sellingPrice,
    required this.defaultMargin,
    required this.originalSellingPrice,
    required this.marginType,
    required this.defaultPrice,
    required this.productSchemeDiscountPerQuantity,
    this.getBuy,
    this.getFree,
    required this.productSlab,
    // required this.freeItems,
  });

  factory PurchaseData.fromJson(Map<String, dynamic> json) {
    return PurchaseData(
      id: json['id'] ?? 0,
      productId: json['product_id'] ?? 0,
      productBarcodeId: json['product_barcode_id'] ?? 0,
      billId: json['bill_id'] ?? 0,
      batchId: json['batch_id'] ?? 0,
      mfgDate: json['mfg_date'] ?? "",
      expDate: json['exp_date'] ?? 0,
      gst: json['gst'] ?? '',
      gstType: json['gst_type'] ?? '',
      mrp: json['mrp'] ?? '',
      purchasePrice: json['purchase_price'] ?? '',
      tradeDiscountPrice: json['trade_discount_price'] ?? "",
      tradeDiscountPercentage: json['trade_discount_percentage']??"",
      quantity: json['quantity'] ?? 0,
      taxablePrice: json['taxable_price'],
      sellingPrice: json['selling_price'] ?? 0.0,
      defaultMargin: json['default_margin'] ?? 0,
      originalSellingPrice: json['original_selling_price']?? "",
      marginType: json['margin_type'] ?? "",
      defaultPrice: json['default_price'] ?? 0.0,
      productSchemeDiscountPerQuantity:
          json['product_scheme_discount_per_quantity'] ?? 0,
      getBuy: json['get_buy'],
      getFree: json['get_free'],
      productSlab: (json['product_slab'] as List<dynamic>?)
              ?.map((e) => ProductSlab.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      // freeItems: json['free_items'] ?? [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'product_id': productId,
      'product_barcode_id': productBarcodeId,
      'bill_id': billId,
      'batch_id': batchId,
      'mfg_date': mfgDate,
      'exp_date': expDate,
      'gst': gst,
      'gst_type': gstType,
      'mrp': mrp,
      'purchase_price': purchasePrice,
      'trade_discount_price': tradeDiscountPrice,
      'trade_discount_percentage': tradeDiscountPercentage,
      'quantity': quantity,
      'taxable_price': taxablePrice,
      'selling_price': sellingPrice,
      'default_margin': defaultMargin,
      'original_selling_price': originalSellingPrice,
      'margin_type': marginType,
      'default_price': defaultPrice,
      'product_scheme_discount_per_quantity':
          productSchemeDiscountPerQuantity,
      'get_buy': getBuy,
      'get_free': getFree,
      'product_slab': productSlab.map((slab) => slab.toJson()).toList(),
      // 'free_items': freeItems,
    };
  }
}

class ProductSlab {
  final dynamic id;
  final dynamic purchaseId;
  final dynamic slabMinValue;
  final dynamic slabMaxValue;
  final dynamic marginAmount;
  final dynamic marginFlag;
  final dynamic sellingPrice;
  final dynamic infiniteStatus;
  final dynamic createdAt;
  final dynamic updatedAt;

  ProductSlab({
    required this.id,
    required this.purchaseId,
    required this.slabMinValue,
    required this.slabMaxValue,
    required this.marginAmount,
    required this.marginFlag,
    required this.sellingPrice,
    this.infiniteStatus,
    required this.createdAt,
    required this.updatedAt,
  });

  factory ProductSlab.fromJson(Map<String, dynamic> json) {
    return ProductSlab(
      id: json['id'] ?? 0,
      purchaseId: json['purchase_id'] ?? 0,
      slabMinValue: json['slab_min_value'] ?? 0,
      slabMaxValue: json['slab_max_value'] ?? 0,
      marginAmount: json['margin_amount']?? 0,
      marginFlag: json['margin_flag'] ?? '',
      sellingPrice: json['selling_price'] ?? 0.0,
      infiniteStatus: json['infinite_status'],
      createdAt: json['created_at'] ?? '',
      updatedAt: json['updated_at'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'purchase_id': purchaseId,
      'slab_min_value': slabMinValue,
      'slab_max_value': slabMaxValue,
      'margin_amount': marginAmount,
      'margin_flag': marginFlag,
      'selling_price': sellingPrice,
      'infinite_status': infiniteStatus,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }
}

class ProductFile {
  final int id;
  final int productId;
  final String file;
  final String fileType;
  final String time;
  final String createdAt;
  final String updatedAt;

  ProductFile({
    required this.id,
    required this.productId,
    required this.file,
    required this.fileType,
    required this.time,
    required this.createdAt,
    required this.updatedAt,
  });

  factory ProductFile.fromJson(Map<String, dynamic> json) {
    return ProductFile(
      id: json['id'] ?? 0,
      productId: json['product_id'] ?? 0,
      file: json['file'] ?? '',
      fileType: json['file_type'] ?? '',
      time: json['time'] ?? '',
      createdAt: json['created_at'] ?? '',
      updatedAt: json['updated_at'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'product_id': productId,
      'file': file,
      'file_type': fileType,
      'time': time,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }
}

class Barcode {
  final int id;
  final int masterProductId;
  final String barcode;
  final int time;

  Barcode({
    required this.id,
    required this.masterProductId,
    required this.barcode,
    required this.time,
  });

  factory Barcode.fromJson(Map<String, dynamic> json) {
    return Barcode(
      id: json['id'] ?? 0,
      masterProductId: json['master_product_id'] ?? 0,
      barcode: json['barcode'] ?? 0,
      time: json['time'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'master_product_id': masterProductId,
      'barcode': barcode,
      'time': time,
    };
  }
}

class Batch {
  final int id;
  final int productId;
  final String batchNumber;
  final String createdAt;
  final String updatedAt;

  Batch({
    required this.id,
    required this.productId,
    required this.batchNumber,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Batch.fromJson(Map<String, dynamic> json) {
    return Batch(
      id: json['id'] ?? 0,
      productId: json['product_id'] ?? 0,
      batchNumber: json['batch_number'] ?? '',
      createdAt: json['created_at'] ?? '',
      updatedAt: json['updated_at'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'product_id': productId,
      'batch_number': batchNumber,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }
}
