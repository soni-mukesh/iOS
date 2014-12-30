
#import "UILabel+Formatted.h"

@implementation UILabel (Formatted)

-(void) setUnderlineText:(NSString*) text{
    NSMutableAttributedString *attributeString = [[NSMutableAttributedString alloc] initWithString:text];
    [attributeString addAttribute:NSUnderlineStyleAttributeName
                            value:[NSNumber numberWithInt:1]
                            range:(NSRange){0,[attributeString length]}];
    [self setAttributedText:attributeString];
}

@end

