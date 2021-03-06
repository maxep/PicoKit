// Generated by xsd compiler for ios/objective-c
// DO NOT CHANGE!

#import "Shopping_ProductIDCodeType.h"

/**
 @file
 
 ProductID type for product searches.
 
*/

/**
 
 ISBN-10 or ISBN-13 value for books. (The string length of ProductID
 indicates whether the ID is 10 or 13 characters.)
 If you know a book's ISBN, you can use this instead of the
 eBay CatalogItem or Reference ID to search for that book.
 Max length of corresponding value: 13
 
*/
NSString *const Shopping_ProductIDCodeType_ISBN = @"ISBN";

/**
 
 EAN value for books. (This is used more commonly in
 European countries.)
 If you know a book's EAN, you can use this instead of the
 eBay CatalogItem or Reference ID to search for that book.
 Max length of corresponding value: 13
 
*/
NSString *const Shopping_ProductIDCodeType_EAN = @"EAN";

/**
 
 UPC value for products in Music (e.g., CDs), DVDs & Movies,
 and Video Games categories (or domains).
 If you know a product's UPC, you can use this instead of the
 eBay CatalogItem or Reference ID to search for that product.
 Max length of corresponding value: 12
 
*/
NSString *const Shopping_ProductIDCodeType_UPC = @"UPC";

/**
 
 Manufacturer's part number for products like electronics.
 
*/
NSString *const Shopping_ProductIDCodeType_MPN = @"MPN";

/**
 
 Reserved for future use.
 
*/
NSString *const Shopping_ProductIDCodeType_KEYWORDS = @"Keywords";

/**
 
 Reserved for future use.
 
*/
NSString *const Shopping_ProductIDCodeType_CATALOG_ITEM = @"CatalogItem";

/**
 
 The global reference ID for an eBay catalog product.
 A reference ID is a fixed reference to a product
 (regardless of version). 
 One reference ID can be associated with multiple CatalogItem IDs.
 To determine valid reference IDs for products to use as input to FindProducts, first call
 FindProducts with QueryKeywords (or ProductID).
 Each product in the response includes a reference ID.<br><br>
 If you specify one of these products in a request, the call may return the product with a warning, 
 or it may return an error if the product has been deleted.
 
*/
NSString *const Shopping_ProductIDCodeType_REFERENCE = @"Reference";

/**
 
 Reserved for internal or future use.
 
*/
NSString *const Shopping_ProductIDCodeType_CUSTOM_CODE = @"CustomCode";
