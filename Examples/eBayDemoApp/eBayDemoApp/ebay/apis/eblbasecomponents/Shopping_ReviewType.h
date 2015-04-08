// Generated by xsd compiler for ios/objective-c
// DO NOT CHANGE!

#import <Foundation/Foundation.h>
#import "PicoClassSchema.h"
#import "PicoPropertySchema.h"
#import "PicoConstants.h"
#import "PicoBindable.h"



/**
 
 A product review written by an eBay member.
 
 
 @ingroup ShoppingInterface
*/
@interface Shopping_ReviewType : NSObject <PicoBindable> {

@private
    NSString *_url;
    NSString *_title;
    NSNumber *_rating;
    NSString *_text;
    NSString *_userID;
    NSDate *_creationTime;
    NSMutableArray *_any;

}


/**
 
 A link to the full review on the eBay Web site.
 This URL optimized for natural search: "_W0QQ" is like "?"
 (question mark), "QQ" is like "&" (ampersand),
 and "Z" is like "=" (equals sign).<br>
 <br>
 <span class="tablenote"><b>Note:</b>
 For a link to all reviews for the product, remove the upvr parameter
 from this URL. See the eBay Features Guide for an example.
 </span>
 
 
 type : NSString, wrapper for primitive string
*/
@property (nonatomic, strong) NSString *url;

/**
 
 The title of the review.
 
 
 type : NSString, wrapper for primitive string
*/
@property (nonatomic, strong) NSString *title;

/**
 
 The eBay member's rating of the product.
 
 
 type : NSNumber, wrapper for primitive int
*/
@property (nonatomic, strong) NSNumber *rating;

/**
 
 The text of the review. If the review is longer than
 2000 characters, the text is cut off and it ends with "...".
 See Review.URL for a link to the full text of the review.
 
 
 type : NSString, wrapper for primitive string
*/
@property (nonatomic, strong) NSString *text;

/**
 
 The reviewer's eBay user ID.
 
 
 type : NSString, wrapper for primitive string
*/
@property (nonatomic, strong) NSString *userID;

/**
 
 The time and date when the reviewer posted the review.
 
 
 type : NSDate, wrapper for primitive date
*/
@property (nonatomic, strong) NSDate *creationTime;

/**
 (public property)
 
 entry type : PicoAnyElement, wrapper for primitive anyelement
*/

@property (nonatomic, strong) NSMutableArray *any;


@end