// ignore_for_file: unnecessary_null_comparison

class GetCart {
  bool? getCartReturn;
  Data? data;
  int? totalAmount;

  GetCart({this.getCartReturn, this.data, this.totalAmount});

  GetCart.fromJson(Map<String, dynamic> json) {
    getCartReturn = json['return'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    totalAmount = json['total_amount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['return'] = this.getCartReturn;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['total_amount'] = this.totalAmount;
    return data;
  }
}

class Data {
  List<Data>? data;

  Data({this.data});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();

    return data;
  }
}

class CartProduct {
  int? id;
  int? customerId;
  int? productId;
  int? barcodeId;
  int? batchId;
  int? inventoryId;
  int? quantity;
  int? priceableQuantity;
  int? price;
  int? totalPrice;
  int? warehouseId;
  // String outletId;
  String? type;
  String? status;
  int? slabId;
  int? getBuyFreeDetecedQuantity;
  int? quantityCount;
  String? productType;
  int? productTypeId;
  dynamic unitPrice;
  int? unitQuantity;
  String? createdAt;
  String? updatedAt;
  // Customers? customers;
  // Product? product;
  // Barcodes? barcodes;
  // Batchs? batchs;
  // Inventories? inventories;
  // Slabs? slabs;
  // Warehouses? warehouses;
  // String? outlets;

  CartProduct(
      {this.id,
      this.customerId,
      this.productId,
      this.barcodeId,
      this.batchId,
      this.inventoryId,
      this.quantity,
      this.priceableQuantity,
      this.price,
      this.totalPrice,
      this.warehouseId,
      // this.outletId,
      this.type,
      this.status,
      this.slabId,
      this.getBuyFreeDetecedQuantity,
      this.quantityCount,
      this.productType,
      this.productTypeId,
      this.unitPrice,
      this.unitQuantity,
      this.createdAt,
      this.updatedAt,
      // this.customers,
      // this.product,
      // this.barcodes,
      // this.batchs,
      // this.inventories,
      // this.slabs,
      // this.warehouses,
      // this.outlets
      });

  CartProduct.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    customerId = json['customer_id'];
    productId = json['product_id'];
    barcodeId = json['barcode_id'];
    batchId = json['batch_id'];
    inventoryId = json['inventory_id'];
    quantity = json['quantity'];
    priceableQuantity = json['priceable_quantity'];
    price = json['price'];
    totalPrice = json['total_price'];
    warehouseId = json['warehouse_id'];
    // outletId = json['outlet_id']??"";
    type = json['type']??"";
    status = json['status']??"";
    slabId = json['slab_id'];
    getBuyFreeDetecedQuantity = json['get_buy_free_deteced_quantity'];
    quantityCount = json['quantity_count'];
    productType = json['product_type'];
    productTypeId = json['product_type_id'];
    unitPrice = json['unit_price'];
    unitQuantity = json['unit_quantity'];
    createdAt = json['created_at']??"";
    updatedAt = json['updated_at']??"";
    // customers = json['customers'] != null
    //     ? new Customers.fromJson(json['customers'])
    //     : null;
    // product =
    //     json['product'] != null ? new Product.fromJson(json['product']) : null;
    // barcodes = json['barcodes'] != null
    //     ? new Barcodes.fromJson(json['barcodes'])
    //     : null;
    // batchs =
    //     json['batchs'] != null ? new Batchs.fromJson(json['batchs']) : null;
    // inventories = json['inventories'] != null
    //     ? new Inventories.fromJson(json['inventories'])
    //     : null;
    // slabs = json['slabs'] != null ? new Slabs.fromJson(json['slabs']) : null;
    // warehouses = json['warehouses'] != null
    //     ? new Warehouses.fromJson(json['warehouses'])
    //     : null;
    // outlets = json['outlets'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['customer_id'] = this.customerId;
    data['product_id'] = this.productId;
    data['barcode_id'] = this.barcodeId;
    data['batch_id'] = this.batchId;
    data['inventory_id'] = this.inventoryId;
    data['quantity'] = this.quantity;
    data['priceable_quantity'] = this.priceableQuantity;
    data['price'] = this.price;
    data['total_price'] = this.totalPrice;
    data['warehouse_id'] = this.warehouseId;
    // data['outlet_id'] = this.outletId;
    data['type'] = this.type;
    data['status'] = this.status;
    data['slab_id'] = this.slabId;
    data['get_buy_free_deteced_quantity'] = this.getBuyFreeDetecedQuantity;
    data['quantity_count'] = this.quantityCount;
    data['product_type'] = this.productType;
    data['product_type_id'] = this.productTypeId;
    data['unit_price'] = this.unitPrice;
    data['unit_quantity'] = this.unitQuantity;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    // if (this.customers != null) {
    //   data['customers'] = this.customers!.toJson();
    // }
    // if (this.product != null) {
    //   data['product'] = this.product!.toJson();
    // }
    // if (this.barcodes != null) {
    //   data['barcodes'] = this.barcodes!.toJson();
    // }
    // if (this.batchs != null) {
    //   data['batchs'] = this.batchs!.toJson();
    // }
    // if (this.inventories != null) {
    //   data['inventories'] = this.inventories!.toJson();
    // }
    // if (this.slabs != null) {
    //   data['slabs'] = this.slabs!.toJson();
    // }
    // if (this.warehouses != null) {
    //   data['warehouses'] = this.warehouses!.toJson();
    // }
    // data['outlets'] = this.outlets;
    return data;
  }
}

// class Customers 
// {
//   int? id;
//   String? name;
//   int? mobile;
//   dynamic address;
//   dynamic dob;
//   dynamic gender;
//   dynamic address2;
//   dynamic email;
//   dynamic stateId;
//   dynamic city;
//   dynamic pinCode;
//   dynamic image;
//   String? time;
//   String? createdAt;
//   String? updatedAt;
//   String? verifiedStatus;
//   dynamic identificationNumber;
//   dynamic type;
//   dynamic gstNumber;
//   String? craditEnable;
//   String? apiToken;
//   dynamic fcmToken;
//   dynamic walletAmount;
//   String? emailVerify;
//   String? mobileVerify;
//   dynamic multipleAddressPincodeId;
//   dynamic identityType;
//   dynamic identityNumber;
//   dynamic mobile2;

//   Customers(
//       {this.id,
//       this.name,
//       this.mobile,
//       this.address,
//       this.dob,
//       this.gender,
//       this.address2,
//       this.email,
//       this.stateId,
//       this.city,
//       this.pinCode,
//       this.image,
//       this.time,
//       this.createdAt,
//       this.updatedAt,
//       this.verifiedStatus,
//       this.identificationNumber,
//       this.type,
//       this.gstNumber,
//       this.craditEnable,
//       this.apiToken,
//       this.fcmToken,
//       this.walletAmount,
//       this.emailVerify,
//       this.mobileVerify,
//       this.multipleAddressPincodeId,
//       this.identityType,
//       this.identityNumber,
//       this.mobile2});

//   Customers.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     mobile = json['mobile'];
//     address = json['address'];
//     dob = json['dob'];
//     gender = json['gender'];
//     address2 = json['address2'];
//     email = json['email'];
//     stateId = json['state_id'];
//     city = json['city'];
//     pinCode = json['pin_code'];
//     image = json['image'];
//     time = json['time'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//     verifiedStatus = json['verified_status'];
//     identificationNumber = json['identification_number'];
//     type = json['type'];
//     gstNumber = json['gst_number'];
//     craditEnable = json['cradit_enable'];
//     apiToken = json['api_token'];
//     fcmToken = json['fcm_token'];
//     walletAmount = json['wallet_amount'];
//     emailVerify = json['email_verify'];
//     mobileVerify = json['mobile_verify'];
//     multipleAddressPincodeId = json['multiple_address_pincode_id'];
//     identityType = json['identity_type'];
//     identityNumber = json['identity_number'];
//     mobile2 = json['mobile_2'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['name'] = this.name;
//     data['mobile'] = this.mobile;
//     data['address'] = this.address;
//     data['dob'] = this.dob;
//     data['gender'] = this.gender;
//     data['address2'] = this.address2;
//     data['email'] = this.email;
//     data['state_id'] = this.stateId;
//     data['city'] = this.city;
//     data['pin_code'] = this.pinCode;
//     data['image'] = this.image;
//     data['time'] = this.time;
//     data['created_at'] = this.createdAt;
//     data['updated_at'] = this.updatedAt;
//     data['verified_status'] = this.verifiedStatus;
//     data['identification_number'] = this.identificationNumber;
//     data['type'] = this.type;
//     data['gst_number'] = this.gstNumber;
//     data['cradit_enable'] = this.craditEnable;
//     data['api_token'] = this.apiToken;
//     data['fcm_token'] = this.fcmToken;
//     data['wallet_amount'] = this.walletAmount;
//     data['email_verify'] = this.emailVerify;
//     data['mobile_verify'] = this.mobileVerify;
//     data['multiple_address_pincode_id'] = this.multipleAddressPincodeId;
//     data['identity_type'] = this.identityType;
//     data['identity_number'] = this.identityNumber;
//     data['mobile_2'] = this.mobile2;
//     return data;
//   }
// }

// class Product {
//   int? id;
//   String? hsn;
//   String? productName;
//   String? productDetail;
//   String? describtion;
//   String? packingType;
//   String? printName;
//   dynamic brandName;
//   dynamic brandId;
//   int? category;
//   dynamic subCategory;
//   String? nature;
//   dynamic unit;
//   dynamic showStatus;
//   String? time;
//   dynamic deletedAt;
//   String? freeProduct;
//   dynamic createdBy;
//   int? isCarryBag;
//   dynamic price;
//   List<File>? file;
//   dynamic nutritionPrice;
//   dynamic customerInventory;

//   Product(
//       {this.id,
//       this.hsn,
//       this.productName,
//       this.productDetail,
//       this.describtion,
//       this.packingType,
//       this.printName,
//       this.brandName,
//       this.brandId,
//       this.category,
//       this.subCategory,
//       this.nature,
//       this.unit,
//       this.showStatus,
//       this.time,
//       this.deletedAt,
//       this.freeProduct,
//       this.createdBy,
//       this.isCarryBag,
//       this.price,
//       this.file,
//       this.nutritionPrice,
//       this.customerInventory});

//   Product.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     hsn = json['hsn'];
//     productName = json['product_name'];
//     productDetail = json['product_detail'];
//     describtion = json['describtion'];
//     packingType = json['packing_type'];
//     printName = json['print_name'];
//     brandName = json['brand_name'];
//     brandId = json['brand_id'];
//     category = json['category'];
//     subCategory = json['sub_category'];
//     nature = json['nature'];
//     unit = json['unit'];
//     showStatus = json['show_status'];
//     time = json['time'];
//     deletedAt = json['deleted_at'];
//     freeProduct = json['free_product'];
//     createdBy = json['created_by'];
//     isCarryBag = json['is_carry_bag'];
//     price = json['price'];
//     if (json['file'] != null) {
//       file = <File>[];
//       json['file'].forEach((v) {
//         file!.add(new File.fromJson(v));
//       });
//     }
//     nutritionPrice = json['nutrition_price'];
//     customerInventory = json['customer_inventory'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['hsn'] = this.hsn;
//     data['product_name'] = this.productName;
//     data['product_detail'] = this.productDetail;
//     data['describtion'] = this.describtion;
//     data['packing_type'] = this.packingType;
//     data['print_name'] = this.printName;
//     data['brand_name'] = this.brandName;
//     data['brand_id'] = this.brandId;
//     data['category'] = this.category;
//     data['sub_category'] = this.subCategory;
//     data['nature'] = this.nature;
//     data['unit'] = this.unit;
//     data['show_status'] = this.showStatus;
//     data['time'] = this.time;
//     data['deleted_at'] = this.deletedAt;
//     data['free_product'] = this.freeProduct;
//     data['created_by'] = this.createdBy;
//     data['is_carry_bag'] = this.isCarryBag;
//     data['price'] = this.price;
//     if (this.file != null) {
//       data['file'] = this.file!.map((v) => v.toJson()).toList();
//     }
//     data['nutrition_price'] = this.nutritionPrice;
//     data['customer_inventory'] = this.customerInventory;
//     return data;
//   }
// }

// class File {
//   int? id;
//   int? productId;
//   String? file;
//   String? fileType;
//   int? time;
//   String? createdAt;
//   String? updatedAt;

//   File(
//       {this.id,
//       this.productId,
//       this.file,
//       this.fileType,
//       this.time,
//       this.createdAt,
//       this.updatedAt});

//   File.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     productId = json['product_id'];
//     file = json['file'];
//     fileType = json['file_type'];
//     time = json['time'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['product_id'] = this.productId;
//     data['file'] = this.file;
//     data['file_type'] = this.fileType;
//     data['time'] = this.time;
//     data['created_at'] = this.createdAt;
//     data['updated_at'] = this.updatedAt;
//     return data;
//   }
// }

// class Barcodes {
//   int? id;
//   int? masterProductId;
//   String? barcode;
//   int? time;

//   Barcodes({this.id, this.masterProductId, this.barcode, this.time});

//   Barcodes.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     masterProductId = json['master_product_id'];
//     barcode = json['barcode'];
//     time = json['time'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['master_product_id'] = this.masterProductId;
//     data['barcode'] = this.barcode;
//     data['time'] = this.time;
//     return data;
//   }
// }

// class Batchs {
//   int? id;
//   int? productId;
//   String? batchNumber;
//   String? createdAt;
//   String? updatedAt;

//   Batchs(
//       {this.id,
//       this.productId,
//       this.batchNumber,
//       this.createdAt,
//       this.updatedAt});

//   Batchs.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     productId = json['product_id'];
//     batchNumber = json['batch_number'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['product_id'] = this.productId;
//     data['batch_number'] = this.batchNumber;
//     data['created_at'] = this.createdAt;
//     data['updated_at'] = this.updatedAt;
//     return data;
//   }
// }

// class Inventories {
//   int? id;
//   int? productId;
//   int? barcodeId;
//   int? batchId;
//   int? warehouseId;
//   dynamic outletId;
//   String? avaliableQuantity;
//   String? hiddenQuantity;
//   dynamic parentProductInventoyId;
//   String? createdAt;
//   String? updatedAt;
//   Transaction? transaction;

//   Inventories(
//       {this.id,
//       this.productId,
//       this.barcodeId,
//       this.batchId,
//       this.warehouseId,
//       this.outletId,
//       this.avaliableQuantity,
//       this.hiddenQuantity,
//       this.parentProductInventoyId,
//       this.createdAt,
//       this.updatedAt,
//       this.transaction});

//   Inventories.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     productId = json['product_id'];
//     barcodeId = json['barcode_id'];
//     batchId = json['batch_id'];
//     warehouseId = json['warehouse_id'];
//     outletId = json['outlet_id'];
//     avaliableQuantity = json['avaliable_quantity'];
//     hiddenQuantity = json['hidden_quantity'];
//     parentProductInventoyId = json['parent_product_inventoy_id'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//     transaction = json['transaction'] != null
//         ? new Transaction.fromJson(json['transaction'])
//         : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['product_id'] = this.productId;
//     data['barcode_id'] = this.barcodeId;
//     data['batch_id'] = this.batchId;
//     data['warehouse_id'] = this.warehouseId;
//     data['outlet_id'] = this.outletId;
//     data['avaliable_quantity'] = this.avaliableQuantity;
//     data['hidden_quantity'] = this.hiddenQuantity;
//     data['parent_product_inventoy_id'] = this.parentProductInventoyId;
//     data['created_at'] = this.createdAt;
//     data['updated_at'] = this.updatedAt;
//     if (this.transaction != null) {
//       data['transaction'] = this.transaction!.toJson();
//     }
//     return data;
//   }
// }

// class Transaction {
//   int? id;
//   int? userId;
//   dynamic coustomerId;
//   dynamic parentTransactionId;
//   dynamic purchaseDataFreeItemsId;
//   dynamic orderDetailFreeItemsId;
//   dynamic productTransferFreeItemsId;
//   dynamic returnOrderId;
//   dynamic returnOrderFreeItemsId;
//   dynamic nutrationId;
//   int? inventoryId;
//   int? productId;
//   int? barcodeId;
//   int? batchId;
//   int? warehouseId;
//   dynamic outletId;
//   String? lastQuantity;
//   String? quantity;
//   String? avaliableQuantity;
//   int? purchaseId;
//   dynamic transferDetailsId;
//   String? type;
//   dynamic addSubtract;
//   dynamic orderDetailsId;
//   dynamic transferStatus;
//   dynamic returnTime;
//   dynamic remark;
//   dynamic returnRemarkStatus;
//   dynamic returnRemarkStatusTime;
//   dynamic rawProductItemId;
//   String? createdAt;
//   String? updatedAt;
//   PurchaseData? purchaseData;

  // Transaction(
  //     {this.id,
  //     this.userId,
  //     this.coustomerId,
  //     this.parentTransactionId,
  //     this.purchaseDataFreeItemsId,
  //     this.orderDetailFreeItemsId,
  //     this.productTransferFreeItemsId,
  //     this.returnOrderId,
  //     this.returnOrderFreeItemsId,
  //     this.nutrationId,
  //     this.inventoryId,
  //     this.productId,
  //     this.barcodeId,
  //     this.batchId,
  //     this.warehouseId,
  //     this.outletId,
  //     this.lastQuantity,
  //     this.quantity,
  //     this.avaliableQuantity,
  //     this.purchaseId,
  //     this.transferDetailsId,
  //     this.type,
  //     this.addSubtract,
  //     this.orderDetailsId,
  //     this.transferStatus,
  //     this.returnTime,
  //     this.remark,
  //     this.returnRemarkStatus,
  //     this.returnRemarkStatusTime,
  //     this.rawProductItemId,
  //     this.createdAt,
  //     this.updatedAt,
  //     this.purchaseData});

  // Transaction.fromJson(Map<String, dynamic> json) {
  //   id = json['id'];
  //   userId = json['user_id'];
  //   coustomerId = json['coustomer_id'];
  //   parentTransactionId = json['parent_transaction_id'];
  //   purchaseDataFreeItemsId = json['purchase_data_free_items_id'];
  //   orderDetailFreeItemsId = json['order_detail_free_items_id'];
  //   productTransferFreeItemsId = json['product_transfer_free_items_id'];
  //   returnOrderId = json['return_order_id'];
  //   returnOrderFreeItemsId = json['return_order_free_items_id'];
  //   nutrationId = json['nutration_id'];
  //   inventoryId = json['inventory_id'];
  //   productId = json['product_id'];
  //   barcodeId = json['barcode_id'];
  //   batchId = json['batch_id'];
  //   warehouseId = json['warehouse_id'];
  //   outletId = json['outlet_id'];
  //   lastQuantity = json['last_quantity'];
  //   quantity = json['quantity'];
  //   avaliableQuantity = json['avaliable_quantity'];
  //   purchaseId = json['purchase_id'];
  //   transferDetailsId = json['transfer_details_id'];
  //   type = json['type'];
  //   addSubtract = json['add_subtract'];
  //   orderDetailsId = json['order_details_id'];
  //   transferStatus = json['transfer_status'];
  //   returnTime = json['return_time'];
  //   remark = json['remark'];
  //   returnRemarkStatus = json['return_remark_status'];
  //   returnRemarkStatusTime = json['return_remark_status_time'];
  //   rawProductItemId = json['raw_product_item_id'];
  //   createdAt = json['created_at'];
  //   updatedAt = json['updated_at'];
  //   purchaseData = json['purchase_data'] != null
  //       ? new PurchaseData.fromJson(json['purchase_data'])
  //       : null;
  // }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['id'] = this.id;
  //   data['user_id'] = this.userId;
  //   data['coustomer_id'] = this.coustomerId;
  //   data['parent_transaction_id'] = this.parentTransactionId;
  //   data['purchase_data_free_items_id'] = this.purchaseDataFreeItemsId;
  //   data['order_detail_free_items_id'] = this.orderDetailFreeItemsId;
  //   data['product_transfer_free_items_id'] = this.productTransferFreeItemsId;
  //   data['return_order_id'] = this.returnOrderId;
  //   data['return_order_free_items_id'] = this.returnOrderFreeItemsId;
  //   data['nutration_id'] = this.nutrationId;
  //   data['inventory_id'] = this.inventoryId;
  //   data['product_id'] = this.productId;
  //   data['barcode_id'] = this.barcodeId;
  //   data['batch_id'] = this.batchId;
  //   data['warehouse_id'] = this.warehouseId;
  //   data['outlet_id'] = this.outletId;
  //   data['last_quantity'] = this.lastQuantity;
  //   data['quantity'] = this.quantity;
  //   data['avaliable_quantity'] = this.avaliableQuantity;
  //   data['purchase_id'] = this.purchaseId;
  //   data['transfer_details_id'] = this.transferDetailsId;
  //   data['type'] = this.type;
  //   data['add_subtract'] = this.addSubtract;
  //   data['order_details_id'] = this.orderDetailsId;
  //   data['transfer_status'] = this.transferStatus;
  //   data['return_time'] = this.returnTime;
  //   data['remark'] = this.remark;
  //   data['return_remark_status'] = this.returnRemarkStatus;
  //   data['return_remark_status_time'] = this.returnRemarkStatusTime;
  //   data['raw_product_item_id'] = this.rawProductItemId;
  //   data['created_at'] = this.createdAt;
  //   data['updated_at'] = this.updatedAt;
  //   if (this.purchaseData != null) {
  //     data['purchase_data'] = this.purchaseData!.toJson();
  //   }
  //   return data;
  // }
// }

// class PurchaseData {
//   int? id;
//   int? productId;
//   int? productBarcodeId;
//   int? billId;
//   int? batchId;
//   String? mfgDate;
//   int? expDate;
//   dynamic expMonth;
//   dynamic expDay;
//   String? gst;
//   String? gstType;
//   String? mrp;
//   String? purchasePrice;
//   dynamic tradeDiscountPrice;
//   String? tradeDiscountPercentage;
//   int? quantity;
//   dynamic loosQuantityPieces;
//   dynamic loosQuantityEachPieces;
//   dynamic freeProductName;
//   dynamic freeProductQuantity;
//   String? taxablePrice;
//   double? sellingPrice;
//   double? defaultMargin;
//   double? originalSellingPrice;
//   String? marginType;
//   double? defaultPrice;
//   String? quantityFlag;
//   String? time;
//   String? updateInventryStatus;
//   dynamic deletedAt;
//   int? productSchemeDiscountPerQuantity;
//   dynamic createdBy;
//   dynamic warrantyMonths;
//   dynamic getBuy;
//   dynamic getFree;
//   dynamic cessTax;
//   List<ProductSlab>? productSlab;
//   List<Null>? freeItems;

  // PurchaseData(
  //     {this.id,
  //     this.productId,
  //     this.productBarcodeId,
  //     this.billId,
  //     this.batchId,
  //     this.mfgDate,
  //     this.expDate,
  //     this.expMonth,
  //     this.expDay,
  //     this.gst,
  //     this.gstType,
  //     this.mrp,
  //     this.purchasePrice,
  //     this.tradeDiscountPrice,
  //     this.tradeDiscountPercentage,
  //     this.quantity,
  //     this.loosQuantityPieces,
  //     this.loosQuantityEachPieces,
  //     this.freeProductName,
  //     this.freeProductQuantity,
  //     this.taxablePrice,
  //     this.sellingPrice,
  //     this.defaultMargin,
  //     this.originalSellingPrice,
  //     this.marginType,
  //     this.defaultPrice,
  //     this.quantityFlag,
  //     this.time,
  //     this.updateInventryStatus,
  //     this.deletedAt,
  //     this.productSchemeDiscountPerQuantity,
  //     this.createdBy,
  //     this.warrantyMonths,
  //     this.getBuy,
  //     this.getFree,
  //     this.cessTax,
  //     this.productSlab,
  //     this.freeItems});

  // PurchaseData.fromJson(Map<String, dynamic> json) {
  //   id = json['id'];
  //   productId = json['product_id'];
  //   productBarcodeId = json['product_barcode_id'];
  //   billId = json['bill_id'];
  //   batchId = json['batch_id'];
  //   mfgDate = json['mfg_date'];
  //   expDate = json['exp_date'];
  //   expMonth = json['exp_month'];
  //   expDay = json['exp_day'];
  //   gst = json['gst'];
  //   gstType = json['gst_type'];
  //   mrp = json['mrp'];
  //   purchasePrice = json['purchase_price'];
  //   tradeDiscountPrice = json['trade_discount_price'];
  //   tradeDiscountPercentage = json['trade_discount_percentage'];
  //   quantity = json['quantity'];
  //   loosQuantityPieces = json['loos_quantity_pieces'];
  //   loosQuantityEachPieces = json['loos_quantity_each_pieces'];
  //   freeProductName = json['free_product_name'];
  //   freeProductQuantity = json['free_product_quantity'];
  //   taxablePrice = json['taxable_price'];
  //   sellingPrice = json['selling_price'];
  //   defaultMargin = json['default_margin'];
  //   originalSellingPrice = json['original_selling_price'];
  //   marginType = json['margin_type'];
  //   defaultPrice = json['default_price'];
  //   quantityFlag = json['quantity_flag'];
  //   time = json['time'];
  //   updateInventryStatus = json['update_inventry_status'];
  //   deletedAt = json['deleted_at'];
  //   productSchemeDiscountPerQuantity =
  //       json['product_scheme_discount_per_quantity'];
  //   createdBy = json['created_by'];
  //   warrantyMonths = json['warranty_months'];
  //   getBuy = json['get_buy'];
  //   getFree = json['get_free'];
  //   cessTax = json['cess_tax'];
  //   if (json['product_slab'] != null) {
  //     productSlab = <ProductSlab>[];
  //     json['product_slab'].forEach((v) {
  //       productSlab!.add(new ProductSlab.fromJson(v));
  //     });
  //   }
  //   if (json['free_items'] != null) {
  //     freeItems = <Null>[];
  //     json['free_items'].forEach((v) {
  //       freeItems!.add(Null.fromJson(v));
  //     });
  //   }
  // }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['id'] = this.id;
  //   data['product_id'] = this.productId;
  //   data['product_barcode_id'] = this.productBarcodeId;
  //   data['bill_id'] = this.billId;
  //   data['batch_id'] = this.batchId;
  //   data['mfg_date'] = this.mfgDate;
  //   data['exp_date'] = this.expDate;
  //   data['exp_month'] = this.expMonth;
  //   data['exp_day'] = this.expDay;
  //   data['gst'] = this.gst;
  //   data['gst_type'] = this.gstType;
  //   data['mrp'] = this.mrp;
  //   data['purchase_price'] = this.purchasePrice;
  //   data['trade_discount_price'] = this.tradeDiscountPrice;
  //   data['trade_discount_percentage'] = this.tradeDiscountPercentage;
  //   data['quantity'] = this.quantity;
  //   data['loos_quantity_pieces'] = this.loosQuantityPieces;
  //   data['loos_quantity_each_pieces'] = this.loosQuantityEachPieces;
  //   data['free_product_name'] = this.freeProductName;
  //   data['free_product_quantity'] = this.freeProductQuantity;
  //   data['taxable_price'] = this.taxablePrice;
  //   data['selling_price'] = this.sellingPrice;
  //   data['default_margin'] = this.defaultMargin;
  //   data['original_selling_price'] = this.originalSellingPrice;
  //   data['margin_type'] = this.marginType;
  //   data['default_price'] = this.defaultPrice;
  //   data['quantity_flag'] = this.quantityFlag;
  //   data['time'] = this.time;
  //   data['update_inventry_status'] = this.updateInventryStatus;
  //   data['deleted_at'] = this.deletedAt;
  //   data['product_scheme_discount_per_quantity'] =
  //       this.productSchemeDiscountPerQuantity;
  //   data['created_by'] = this.createdBy;
  //   data['warranty_months'] = this.warrantyMonths;
  //   data['get_buy'] = this.getBuy;
  //   data['get_free'] = this.getFree;
  //   data['cess_tax'] = this.cessTax;
  //   if (this.productSlab != null) {
  //     data['product_slab'] = this.productSlab!.map((v) => v.toJson()).toList();
  //   }
  //   if (this.freeItems != null) {
  //     data['free_items'] = this.freeItems!.map((v) => v.toJson()).toList();
  //   }
  //   return data;
  // }
// }

// class ProductSlab {
//   int? id;
//   int? purchaseId;
//   int? slabMinValue;
//   int? slabMaxValue;
//   double? marginAmount;
//   String? marginFlag;
//   int? sellingPrice;
//   String? infiniteStatus;
//   String? createdAt;
//   String? updatedAt;

  // ProductSlab(
  //     {this.id,
  //     this.purchaseId,
  //     this.slabMinValue,
  //     this.slabMaxValue,
  //     this.marginAmount,
  //     this.marginFlag,
  //     this.sellingPrice,
  //     this.infiniteStatus,
  //     this.createdAt,
  //     this.updatedAt});

  // ProductSlab.fromJson(Map<String, dynamic> json) {
  //   id = json['id'];
  //   purchaseId = json['purchase_id'];
  //   slabMinValue = json['slab_min_value'];
  //   slabMaxValue = json['slab_max_value'];
  //   marginAmount = json['margin_amount'];
  //   marginFlag = json['margin_flag'];
  //   sellingPrice = json['selling_price'];
  //   infiniteStatus = json['infinite_status'];
  //   createdAt = json['created_at'];
  //   updatedAt = json['updated_at'];
  // }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['id'] = this.id;
  //   data['purchase_id'] = this.purchaseId;
  //   data['slab_min_value'] = this.slabMinValue;
  //   data['slab_max_value'] = this.slabMaxValue;
  //   data['margin_amount'] = this.marginAmount;
  //   data['margin_flag'] = this.marginFlag;
  //   data['selling_price'] = this.sellingPrice;
  //   data['infinite_status'] = this.infiniteStatus;
  //   data['created_at'] = this.createdAt;
  //   data['updated_at'] = this.updatedAt;
  //   return data;
  // }
// }

// class Slabs {
//   int? id;
//   int? purchaseId;
//   int? slabMinValue;
//   int? slabMaxValue;
//   double? marginAmount;
//   String? marginFlag;
//   int? sellingPrice;
//   Null? infiniteStatus;
//   String? createdAt;
//   String? updatedAt;
//   Purchases? purchases;

  // Slabs(
  //     {this.id,
  //     this.purchaseId,
  //     this.slabMinValue,
  //     this.slabMaxValue,
  //     this.marginAmount,
  //     this.marginFlag,
  //     this.sellingPrice,
  //     this.infiniteStatus,
  //     this.createdAt,
  //     this.updatedAt,
  //     this.purchases});

  // Slabs.fromJson(Map<String, dynamic> json) {
  //   id = json['id'];
  //   purchaseId = json['purchase_id'];
  //   slabMinValue = json['slab_min_value'];
  //   slabMaxValue = json['slab_max_value'];
  //   marginAmount = json['margin_amount'];
  //   marginFlag = json['margin_flag'];
  //   sellingPrice = json['selling_price'];
  //   infiniteStatus = json['infinite_status'];
  //   createdAt = json['created_at'];
  //   updatedAt = json['updated_at'];
  //   purchases = json['purchases'] != null
  //       ? new Purchases.fromJson(json['purchases'])
  //       : null;
  // }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['id'] = this.id;
  //   data['purchase_id'] = this.purchaseId;
  //   data['slab_min_value'] = this.slabMinValue;
  //   data['slab_max_value'] = this.slabMaxValue;
  //   data['margin_amount'] = this.marginAmount;
  //   data['margin_flag'] = this.marginFlag;
  //   data['selling_price'] = this.sellingPrice;
  //   data['infinite_status'] = this.infiniteStatus;
  //   data['created_at'] = this.createdAt;
  //   data['updated_at'] = this.updatedAt;
  //   if (this.purchases != null) {
  //     data['purchases'] = this.purchases!.toJson();
  //   }
  //   return data;
  // }
// }

// class Purchases {
//   int? id;
//   int? productId;
//   int? productBarcodeId;
//   int? billId;
//   int? batchId;
//   String? mfgDate;
//   int? expDate;
//   Null? expMonth;
//   Null? expDay;
//   String? gst;
//   String? gstType;
//   String? mrp;
//   String? purchasePrice;
//   Null? tradeDiscountPrice;
//   String? tradeDiscountPercentage;
//   int? quantity;
//   Null? loosQuantityPieces;
//   Null? loosQuantityEachPieces;
//   Null? freeProductName;
//   Null? freeProductQuantity;
//   String? taxablePrice;
//   double? sellingPrice;
//   double? defaultMargin;
//   double? originalSellingPrice;
//   String? marginType;
//   int? defaultPrice;
//   String? quantityFlag;
//   String? time;
//   String? updateInventryStatus;
//   Null? deletedAt;
//   int? productSchemeDiscountPerQuantity;
//   Null? createdBy;
//   Null? warrantyMonths;
//   Null? getBuy;
//   Null? getFree;
//   Null? cessTax;

  // Purchases(
  //     {this.id,
  //     this.productId,
  //     this.productBarcodeId,
  //     this.billId,
  //     this.batchId,
  //     this.mfgDate,
  //     this.expDate,
  //     this.expMonth,
  //     this.expDay,
  //     this.gst,
  //     this.gstType,
  //     this.mrp,
  //     this.purchasePrice,
  //     this.tradeDiscountPrice,
  //     this.tradeDiscountPercentage,
  //     this.quantity,
  //     this.loosQuantityPieces,
  //     this.loosQuantityEachPieces,
  //     this.freeProductName,
  //     this.freeProductQuantity,
  //     this.taxablePrice,
  //     this.sellingPrice,
  //     this.defaultMargin,
  //     this.originalSellingPrice,
  //     this.marginType,
  //     this.defaultPrice,
  //     this.quantityFlag,
  //     this.time,
  //     this.updateInventryStatus,
  //     this.deletedAt,
  //     this.productSchemeDiscountPerQuantity,
  //     this.createdBy,
  //     this.warrantyMonths,
  //     this.getBuy,
  //     this.getFree,
  //     this.cessTax});

  // Purchases.fromJson(Map<String, dynamic> json) {
  //   id = json['id'];
  //   productId = json['product_id'];
  //   productBarcodeId = json['product_barcode_id'];
  //   billId = json['bill_id'];
  //   batchId = json['batch_id'];
  //   mfgDate = json['mfg_date'];
  //   expDate = json['exp_date'];
  //   expMonth = json['exp_month'];
  //   expDay = json['exp_day'];
  //   gst = json['gst'];
  //   gstType = json['gst_type'];
  //   mrp = json['mrp'];
  //   purchasePrice = json['purchase_price'];
  //   tradeDiscountPrice = json['trade_discount_price'];
  //   tradeDiscountPercentage = json['trade_discount_percentage'];
  //   quantity = json['quantity'];
  //   loosQuantityPieces = json['loos_quantity_pieces'];
  //   loosQuantityEachPieces = json['loos_quantity_each_pieces'];
  //   freeProductName = json['free_product_name'];
  //   freeProductQuantity = json['free_product_quantity'];
  //   taxablePrice = json['taxable_price'];
  //   sellingPrice = json['selling_price'];
  //   defaultMargin = json['default_margin'];
  //   originalSellingPrice = json['original_selling_price'];
  //   marginType = json['margin_type'];
  //   defaultPrice = json['default_price'];
  //   quantityFlag = json['quantity_flag'];
  //   time = json['time'];
  //   updateInventryStatus = json['update_inventry_status'];
  //   deletedAt = json['deleted_at'];
  //   productSchemeDiscountPerQuantity =
  //       json['product_scheme_discount_per_quantity'];
  //   createdBy = json['created_by'];
  //   warrantyMonths = json['warranty_months'];
  //   getBuy = json['get_buy'];
  //   getFree = json['get_free'];
  //   cessTax = json['cess_tax'];
  // }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['id'] = this.id;
  //   data['product_id'] = this.productId;
  //   data['product_barcode_id'] = this.productBarcodeId;
  //   data['bill_id'] = this.billId;
  //   data['batch_id'] = this.batchId;
  //   data['mfg_date'] = this.mfgDate;
  //   data['exp_date'] = this.expDate;
  //   data['exp_month'] = this.expMonth;
  //   data['exp_day'] = this.expDay;
  //   data['gst'] = this.gst;
  //   data['gst_type'] = this.gstType;
  //   data['mrp'] = this.mrp;
  //   data['purchase_price'] = this.purchasePrice;
  //   data['trade_discount_price'] = this.tradeDiscountPrice;
  //   data['trade_discount_percentage'] = this.tradeDiscountPercentage;
  //   data['quantity'] = this.quantity;
  //   data['loos_quantity_pieces'] = this.loosQuantityPieces;
  //   data['loos_quantity_each_pieces'] = this.loosQuantityEachPieces;
  //   data['free_product_name'] = this.freeProductName;
  //   data['free_product_quantity'] = this.freeProductQuantity;
  //   data['taxable_price'] = this.taxablePrice;
  //   data['selling_price'] = this.sellingPrice;
  //   data['default_margin'] = this.defaultMargin;
  //   data['original_selling_price'] = this.originalSellingPrice;
  //   data['margin_type'] = this.marginType;
  //   data['default_price'] = this.defaultPrice;
  //   data['quantity_flag'] = this.quantityFlag;
  //   data['time'] = this.time;
  //   data['update_inventry_status'] = this.updateInventryStatus;
  //   data['deleted_at'] = this.deletedAt;
  //   data['product_scheme_discount_per_quantity'] =
  //       this.productSchemeDiscountPerQuantity;
  //   data['created_by'] = this.createdBy;
  //   data['warranty_months'] = this.warrantyMonths;
  //   data['get_buy'] = this.getBuy;
  //   data['get_free'] = this.getFree;
  //   data['cess_tax'] = this.cessTax;
  //   return data;
  // }
// }

// class Warehouses {
//   int? id;
//   String? name;
//   int? number;
//   Null? altNumber;
//   Null? address2;
//   int? stateId;
//   int? city;
//   int? pinCode;
//   String? address;
//   String? details;
//   int? time;
//   Null? deletedAt;
//   String? warehouseType;
//   String? fssaiNumber;
//   String? vvmNumber;

  // Warehouses(
  //     {this.id,
  //     this.name,
  //     this.number,
  //     this.altNumber,
  //     this.address2,
  //     this.stateId,
  //     this.city,
  //     this.pinCode,
  //     this.address,
  //     this.details,
  //     this.time,
  //     this.deletedAt,
  //     this.warehouseType,
  //     this.fssaiNumber,
  //     this.vvmNumber});

  // Warehouses.fromJson(Map<String, dynamic> json) {
  //   id = json['id'];
  //   name = json['name'];
  //   number = json['number'];
  //   altNumber = json['alt_number'];
  //   address2 = json['address2'];
  //   stateId = json['state_id'];
  //   city = json['city'];
  //   pinCode = json['pin_code'];
  //   address = json['address'];
  //   details = json['details'];
  //   time = json['time'];
  //   deletedAt = json['deleted_at'];
  //   warehouseType = json['warehouse_type'];
  //   fssaiNumber = json['fssai_number'];
  //   vvmNumber = json['vvm_number'];
  // }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['id'] = this.id;
  //   data['name'] = this.name;
  //   data['number'] = this.number;
  //   data['alt_number'] = this.altNumber;
  //   data['address2'] = this.address2;
  //   data['state_id'] = this.stateId;
  //   data['city'] = this.city;
  //   data['pin_code'] = this.pinCode;
  //   data['address'] = this.address;
  //   data['details'] = this.details;
  //   data['time'] = this.time;
  //   data['deleted_at'] = this.deletedAt;
  //   data['warehouse_type'] = this.warehouseType;
  //   data['fssai_number'] = this.fssaiNumber;
  //   data['vvm_number'] = this.vvmNumber;
  //   return data;
  // }
// }
