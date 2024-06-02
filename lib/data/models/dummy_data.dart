

import 'package:ecommerce_app/features/shop/models/banner_model.dart';
import 'package:ecommerce_app/features/shop/models/brand_category_model.dart';
import 'package:ecommerce_app/features/shop/models/brand_model.dart';
import 'package:ecommerce_app/features/shop/models/product_attribute_model.dart';
import 'package:ecommerce_app/features/shop/models/product_category_model.dart';
import 'package:ecommerce_app/features/shop/models/product_model.dart';
import 'package:ecommerce_app/features/shop/models/product_variation_model.dart';
import 'package:ecommerce_app/routes/routes.dart';
import 'package:ecommerce_app/utils/constants/image_strings.dart';

import '../../features/shop/models/category_model.dart';

class TDummyData {
  // ///- Banners
  static final List<BannerModel> banners = [
    BannerModel(imageUrl:TImages.banner1, targetScreen: TRoutes.order, active:false),
    BannerModel(imageUrl:TImages.banner2, targetScreen: TRoutes.cart, active:true),
    BannerModel(imageUrl:TImages.banner3, targetScreen: TRoutes.favourites, active:true),
    BannerModel(imageUrl:TImages.banner4, targetScreen: TRoutes.search, active:true),
    BannerModel(imageUrl:TImages.banner5, targetScreen: TRoutes.settings, active:true),
    BannerModel(imageUrl:TImages.banner6, targetScreen: TRoutes.userAddress, active:true),
    BannerModel(imageUrl:TImages.banner8, targetScreen: TRoutes.checkout, active:false),
  ];
  //
  // ///- User
  // static final UserModel user = UserModel(
  //   firstName: 'Marshal',
  //   lastName: 'Wolf',
  //   email: 'dosoai32@gmail.com',
  //   phoneNumber: '+84339747131',
  //   profilePicture: TImages.user,
  //   addresses: [
  //     AddressModel(
  //       id : '1',
  //       name: 'Marshal',
  //       phoneNumber: '+84339747131',
  //       street: 'Tot Dong, Chuong My',
  //       city: 'Ha Noi',
  //       state: '',
  //       postalCode: '13400',
  //       country: 'VietNam'
  //
  //     ),
  //   ]
  // );
  //
  // ///- Cart
  // static final CartModel cart = CartModel(
  //   cardId: '001',
  //   item: [
  //     CartItemModel(
  //       productId: '001',
  //       variationId: '1',
  //       quantity: 1,
  //       title: products[0].title,
  //       image: products[0].thumbnail,
  //       brandName:  products[0].brand!.name,
  //       price :  products[0].productVariations![0].price,
  //       selectedVarition:  products[0].productVariations![0].attributeValues,
  //     ),
  //   ]
  // );

  static final List<ProductCategoryModel> productCategory = [
    ProductCategoryModel(productId: '001', categoryId: '1'),
    ProductCategoryModel(productId: '002', categoryId: '16'),
    ProductCategoryModel(productId: '004', categoryId: '16'),
    ProductCategoryModel(productId: '005', categoryId: '8'),
    ProductCategoryModel(productId: '006', categoryId: '2'),
    ProductCategoryModel(productId: '007', categoryId: '4'),
    ProductCategoryModel(productId: '009', categoryId: '8'),
  ];
  static final List<BrandCategoryModel> brandCategory = [
    BrandCategoryModel(brandId: '1', categoryId: '8'),
    BrandCategoryModel(brandId: '1', categoryId: '1'),
    BrandCategoryModel(brandId: '6', categoryId: '16'),
    BrandCategoryModel(brandId: '7', categoryId: '2'),
    BrandCategoryModel(brandId: '7', categoryId: '4'),


  ];
  static final List<BrandModel> brands = [
    BrandModel(id: '1',image: TImages.nikeLogo,name: 'Nike',productsCount: 265,isFeatured: true),
    BrandModel(id: '6',image: TImages.zaraLogo,name: 'ZARA',productsCount: 265,isFeatured: true),
    BrandModel(id: '7',image: TImages.appleLogo,name: 'Samsung',productsCount: 265,isFeatured: true),
    BrandModel(id: '8',image: TImages.pumaLogo,name: 'PumMa',productsCount: 265,isFeatured: true),
    BrandModel(id: '9',image: TImages.ikeaLogo,name: 'Ikea',productsCount: 265,isFeatured: true),
    BrandModel(id: '10 ',image: TImages.jordanLogo,name: 'Jordan',productsCount: 265,isFeatured: true),
  ];
  /// --List of all Products
  static final List<ProductModel> products = [
    ProductModel(
      id: '001',
      title: 'Green Nike sports shoe',
      stock: 15,
      price: 135,
      isFeatured: true,
      thumbnail: TImages.productImage1,
      description: 'Green Nike sports shoe',
      brand: BrandModel(id: '1',image: TImages.nikeLogo,name: 'Nike',productsCount: 265,isFeatured: true),
      images: [TImages.productImage1,TImages.productImage23,TImages.productImage21,TImages.productImage9],
      salePrice: 30,
      sku: 'ABR4568',
      categoryId: '1',
      productAttributes: [
        ProductAttributeModel(name: 'Color',values:['Green', 'Black', 'Red']),
        ProductAttributeModel(name: 'Size',values: ['EU 30','EU 32', 'EU 34']),
      ],
      productVariations: [
        ProductVariationModel(
          id: '1',
          stock: 34,
          price: 134,
          salePrice: 122.6,
          image: TImages.productImage1,
          description: 'This is a Product description for Green Nike sports shoe',
          attributeValues: {'Color': 'Green', 'Size': 'EU 34'}
        ),
        ProductVariationModel(
            id: '2',
            stock: 15,
            price: 132,
            image: TImages.productImage23,
            attributeValues: {'Color': 'Black', 'Size': 'EU 32'}
        ),
        ProductVariationModel(
            id: '3',
            stock: 0,
            price: 234,
            image: TImages.productImage23,
            attributeValues: {'Color': 'Black', 'Size': 'EU 34'}
        ),
        ProductVariationModel(
            id: '4',
            stock: 222,
            price: 232,
            image: TImages.productImage1,
            attributeValues: {'Color': 'Green', 'Size': 'EU 32'}
        ),
        ProductVariationModel(
            id: '5',
            stock: 0,
            price: 334,
            image: TImages.productImage21,
            attributeValues: {'Color': 'Red', 'Size': 'EU 34'}
        ),
        ProductVariationModel(
            id: '6',
            stock: 11,
            price: 332,
            image: TImages.productImage21,
            attributeValues: {'Color': 'Red', 'Size': 'EU 32'}
        ),
      ],
      productType: 'ProductType.variable',
      date: DateTime.now()
    ),
    ProductModel(
      id: '002',
      title: 'Blue T-shirt for all ages',
      stock: 15,
      price: 35,
      isFeatured: true,
      thumbnail: TImages.productImage69,
      description: 'This is a Product description for Blue Nike Sleeve less vest. The are more things that can be added but i am just practicing and nothing else.',
      brand: BrandModel(id: '6',image: TImages.zaraLogo,name: 'ZARA'),
      images: [TImages.productImage68,TImages.productImage69,TImages.productImage5],
      salePrice: 30,
      sku: 'ABR4568',
      categoryId: '16',
      productAttributes: [
        ProductAttributeModel(name: 'Color',values:['Green', 'Red', 'Blue']),
        ProductAttributeModel(name: 'Size',values: ['EU 32', 'EU 34']),
      ],

      productType: 'ProductType.single',
        date: DateTime.now()
    ),
    ProductModel(
      id: '004',
      title: '4 Color collar t-shirt dry fit',
      stock: 15,
      price: 135,
      isFeatured: false,
      thumbnail: TImages.productImage69,
      description: 'This is a Product description for 4 Color collar t-shirt dry fit. There are more things that can be added but its just a  demo and nothing else.',
      brand: BrandModel(id: '6',image: TImages.zaraLogo,name: 'ZARA'),
      images: [TImages.productImage60,TImages.productImage51,TImages.productImage52,TImages.productImage63],
      salePrice: 30,
      sku: 'ABR4568',
      categoryId: '16',
      productAttributes: [
        ProductAttributeModel(name: 'Color',values:['Green', 'Yellow', 'Red', 'Blue']),
        ProductAttributeModel(name: 'Size',values: ['EU 30','EU 32', 'EU 34']),
      ],
      productVariations: [
        ProductVariationModel(
            id: '1',
            stock: 34,
            price: 134,
            salePrice: 122.6,
            image: TImages.productImage60,
            description: 'This is a Product description 4 Color collar t-shirt dry fit',
            attributeValues: {'Color': 'Red', 'Size': 'EU 34'}
        ),
        ProductVariationModel(
            id: '2',
            stock: 15,
            price: 132,
            image: TImages.productImage60,
            attributeValues: {'Color': 'Black', 'Red': 'EU 32'}
        ),
        ProductVariationModel(
            id: '3',
            stock: 0,
            price: 234,
            image: TImages.productImage61,
            attributeValues: {'Color': 'Yellow', 'Size': 'EU 34'}
        ),
        ProductVariationModel(
            id: '4',
            stock: 222,
            price: 232,
            image: TImages.productImage61,
            attributeValues: {'Color': 'Yellow', 'Size': 'EU 34'}
        ),
        ProductVariationModel(
            id: '5',
            stock: 0,
            price: 334,
            image: TImages.productImage62,
            attributeValues: {'Color': 'Green', 'Size': 'EU 34'}
        ),
        ProductVariationModel(
            id: '6',
            stock: 11,
            price: 332,
            image: TImages.productImage62,
            attributeValues: {'Color': 'Green', 'Size': 'EU 30'}
        ),
        ProductVariationModel(
            id: '7',
            stock: 0,
            price: 334,
            image: TImages.productImage63,
            attributeValues: {'Color': 'Blue', 'Size': 'EU 30'}
        ),
        ProductVariationModel(
            id: '8',
            stock: 11,
            price: 332,
            image: TImages.productImage63,
            attributeValues: {'Color': 'Blue', 'Size': 'EU 34'}
        ),
      ],
      productType: 'ProductType.variable',
        date: DateTime.now()
    ),
    ProductModel(
      id: '005',
      title: 'Nike Air Jordon Shoes',
      stock: 15,
      price: 135,
      isFeatured: false,
      thumbnail: TImages.productImage10,
      description: 'Nike Air Jordon Shoes for running. Quality product, Long Lasting',
      brand: BrandModel(id: '1',image: TImages.nikeLogo,name: 'Nike', productsCount: 265, isFeatured: true),
      images: [TImages.productImage7,TImages.productImage8,TImages.productImage8,TImages.productImage10],
      salePrice: 30,
      sku: 'ABR4568',
      categoryId: '8',
      productAttributes: [
        ProductAttributeModel(name: 'Color',values:['Orange', 'Black', 'Brown']),
        ProductAttributeModel(name: 'Size',values: ['EU 30','EU 32', 'EU 34']),
      ],
      productVariations: [
        ProductVariationModel(
            id: '1',
            stock: 16,
            price: 36,
            salePrice: 12.6,
            image: TImages.productImage8,
            description: 'Flutter is Google is mobile UI open source framework to build high-quality native(super fast) interface for IOS and Android apps with the unified codebase.',
            attributeValues: {'Color': 'Orange', 'Size': 'EU 34'}
        ),
        ProductVariationModel(
            id: '2',
            stock: 15,
            price: 35,
            image: TImages.productImage7,
            attributeValues: {'Color': 'Black', 'Red': 'EU 32'}
        ),
        ProductVariationModel(
            id: '3',
            stock: 14,
            price: 34,
            image: TImages.productImage9,
            attributeValues: {'Color': 'Brown', 'Size': 'EU 34'}
        ),
        ProductVariationModel(
            id: '4',
            stock: 13,
            price: 33,
            image: TImages.productImage7,
            attributeValues: {'Color': 'Black', 'Size': 'EU 34'}
        ),
        ProductVariationModel(
            id: '5',
            stock: 12,
            price: 32,
            image: TImages.productImage9,
            attributeValues: {'Color': 'Brown', 'Size': 'EU 32'}
        ),
        ProductVariationModel(
            id: '6',
            stock: 11,
            price: 31,
            image: TImages.productImage8,
            attributeValues: {'Color': 'Orange', 'Size': 'EU 32'}
        ),
      ],
      productType: 'ProductType.variable',
        date: DateTime.now()
    ),
    ProductModel(
      id: '006',
      title: 'SAMSUNG Galaxy S9 (Pink, 64GB) ( 4 GB RAM)',
      stock: 15,
      price: 750,
      isFeatured: false,
      thumbnail: TImages.productImage11,
      description: 'SAMSUNG Galaxy S9 (Pink, 64GB) ( 4 GB RAM), Long Battery timing',
      brand: BrandModel(id: '7',image: TImages.appleLogo,name: 'Samsung'),
      images: [TImages.productImage11,TImages.productImage12,TImages.productImage13,TImages.productImage12],
      salePrice: 650,
      sku: 'ABR4568',
      categoryId: '2',

      productType: 'ProductType.single',
    ),
    ProductModel(
      id: '007',
      title: 'TOMI Dog food',
      stock: 15,
      price: 750,
      isFeatured: false,
      thumbnail: TImages.productImage18,
      description: 'This is Product description for TOMI Dog food. There are more things that can be added but i am just practicing and nothing else',
      brand: BrandModel(id: '7',image: TImages.appleLogo,name: 'Tomi'),
      salePrice: 10,
      sku: 'ABR4568',
      categoryId: '4',
      productAttributes: [
        ProductAttributeModel(name: 'Size',values: ['EU34','EU32']),
        ProductAttributeModel(name: 'Color',values: ['Green', 'Red', 'Blue'])
      ],
      productType: 'ProductType.single',
        date: DateTime.now()
    ),
    ProductModel(
      id: '009',
      title: 'Nike Air Jordon 19 Blue',
      stock: 15,
      price: 400,
      isFeatured: false,
      thumbnail: TImages.productImage19,
      description: 'This is Product description for Nike Air Jordon 19 Blue. There are more things that can be added but i am just practicing and nothing else',
      brand: BrandModel(id: '1',image: TImages.nikeLogo,name: 'Nike'),
      images: [TImages.productImage19,TImages.productImage20,TImages.productImage21,TImages.productImage22],
      salePrice: 200,
      sku: 'ABR4568',
      categoryId: '8',
      productAttributes: [
        ProductAttributeModel(name: 'Size',values: ['EU34','EU32']),
        ProductAttributeModel(name: 'Color',values: ['Green', 'Red', 'Blue'])
      ],
      productType: 'ProductType.single',
        date: DateTime.now()
    ),

  ];
  static final List<CategoryModel> categories =[
    CategoryModel(id: '1', name: 'Sports', image: TImages.sportIcon, isFeatured: true),
    CategoryModel(id: '5', name: 'Furniture', image: TImages.furnitureIcon, isFeatured: true),
    CategoryModel(id: '2', name: 'Electronics', image: TImages.electronicsIcon, isFeatured: true),
    CategoryModel(id: '3', name: 'Clothes', image: TImages.clothIcon, isFeatured: true),
    CategoryModel(id: '4', name: 'Animals', image: TImages.animalIcon, isFeatured: true),
    CategoryModel(id: '6', name: 'Shoes', image: TImages.shoeIcon, isFeatured: true),
    CategoryModel(id: '7', name: 'Cosmetics', image: TImages.cosmeticsIcon, isFeatured: true),
    CategoryModel(id: '14', name: 'Jewelery', image: TImages.jeweleryIcon, isFeatured: true),
    ///subcategories
    CategoryModel(id: '8', name: 'Sport Shoes', image: TImages.sportIcon, isFeatured: false, parentId: '1'),
    CategoryModel(id: '9', name: 'Tracks suits', image: TImages.sportIcon, isFeatured: false,parentId: '1'),
    CategoryModel(id: '10', name: 'Sports Equipments', image: TImages.sportIcon, isFeatured: false,parentId: '1'),
    ///Furniture
    CategoryModel(id: '11', name: 'Bedroom furniture', image: TImages.furnitureIcon, isFeatured: false, parentId: '5'),
    CategoryModel(id: '12', name: 'Kitchen furniture', image: TImages.furnitureIcon, isFeatured: false,parentId: '5'),
    CategoryModel(id: '13', name: 'Office furniture', image: TImages.furnitureIcon, isFeatured: false,parentId: '5'),

    ///Electronics
    CategoryModel(id: '14', name: 'LapTop', image: TImages.electronicsIcon, isFeatured: false, parentId: '2'),
    CategoryModel(id: '15', name: 'Mobile', image: TImages.electronicsIcon, isFeatured: false,parentId: '2'),
    ///Clothes
    CategoryModel(id: '16', name: 'Shirts', image: TImages.clothIcon, isFeatured: false,parentId: '3'),
  ];

}