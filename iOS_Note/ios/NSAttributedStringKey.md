# NSAttributedStringKey

## 1. Keys provided by apple

```swift
UIKIT_EXTERN NSAttributedStringKey const NSFontAttributeName NS_AVAILABLE(10_0, 6_0);                // UIFont, default Helvetica(Neue) 12
UIKIT_EXTERN NSAttributedStringKey const NSParagraphStyleAttributeName NS_AVAILABLE(10_0, 6_0);      // NSParagraphStyle, default defaultParagraphStyle
UIKIT_EXTERN NSAttributedStringKey const NSForegroundColorAttributeName NS_AVAILABLE(10_0, 6_0);     // UIColor, default blackColor
UIKIT_EXTERN NSAttributedStringKey const NSBackgroundColorAttributeName NS_AVAILABLE(10_0, 6_0);     // UIColor, default nil: no background
UIKIT_EXTERN NSAttributedStringKey const NSLigatureAttributeName NS_AVAILABLE(10_0, 6_0);            // NSNumber containing integer, default 1: default ligatures, 0: no ligatures
UIKIT_EXTERN NSAttributedStringKey const NSKernAttributeName NS_AVAILABLE(10_0, 6_0);                // NSNumber containing floating point value, in points; amount to modify default kerning. 0 means kerning is disabled.
UIKIT_EXTERN NSAttributedStringKey const NSStrikethroughStyleAttributeName NS_AVAILABLE(10_0, 6_0);  // NSNumber containing integer, default 0: no strikethrough
UIKIT_EXTERN NSAttributedStringKey const NSUnderlineStyleAttributeName NS_AVAILABLE(10_0, 6_0);      // NSNumber containing integer, default 0: no underline
UIKIT_EXTERN NSAttributedStringKey const NSStrokeColorAttributeName NS_AVAILABLE(10_0, 6_0);         // UIColor, default nil: same as foreground color
UIKIT_EXTERN NSAttributedStringKey const NSStrokeWidthAttributeName NS_AVAILABLE(10_0, 6_0);         // NSNumber containing floating point value, in percent of font point size, default 0: no stroke; positive for stroke alone, negative for stroke and fill (a typical value for outlined text would be 3.0)
UIKIT_EXTERN NSAttributedStringKey const NSShadowAttributeName NS_AVAILABLE(10_0, 6_0);              // NSShadow, default nil: no shadow
UIKIT_EXTERN NSAttributedStringKey const NSTextEffectAttributeName NS_AVAILABLE(10_10, 7_0);          // NSString, default nil: no text effect

UIKIT_EXTERN NSAttributedStringKey const NSAttachmentAttributeName NS_AVAILABLE(10_0, 7_0);          // NSTextAttachment, default nil
UIKIT_EXTERN NSAttributedStringKey const NSLinkAttributeName NS_AVAILABLE(10_0, 7_0);                // NSURL (preferred) or NSString
UIKIT_EXTERN NSAttributedStringKey const NSBaselineOffsetAttributeName NS_AVAILABLE(10_0, 7_0);      // NSNumber containing floating point value, in points; offset from baseline, default 0
UIKIT_EXTERN NSAttributedStringKey const NSUnderlineColorAttributeName NS_AVAILABLE(10_0, 7_0);      // UIColor, default nil: same as foreground color
UIKIT_EXTERN NSAttributedStringKey const NSStrikethroughColorAttributeName NS_AVAILABLE(10_0, 7_0);  // UIColor, default nil: same as foreground color
UIKIT_EXTERN NSAttributedStringKey const NSObliquenessAttributeName NS_AVAILABLE(10_0, 7_0);         // NSNumber containing floating point value; skew to be applied to glyphs, default 0: no skew
UIKIT_EXTERN NSAttributedStringKey const NSExpansionAttributeName NS_AVAILABLE(10_0, 7_0);           // NSNumber containing floating point value; log of expansion factor to be applied to glyphs, default 0: no expansion

UIKIT_EXTERN NSAttributedStringKey const NSWritingDirectionAttributeName NS_AVAILABLE(10_6, 7_0);    // NSArray of NSNumbers representing the nested levels of writing direction overrides as defined by Unicode LRE, RLE, LRO, and RLO characters.  The control characters can be obtained by masking NSWritingDirection and NSWritingDirectionFormatType values.  LRE: NSWritingDirectionLeftToRight|NSWritingDirectionEmbedding, RLE: NSWritingDirectionRightToLeft|NSWritingDirectionEmbedding, LRO: NSWritingDirectionLeftToRight|NSWritingDirectionOverride, RLO: NSWritingDirectionRightToLeft|NSWritingDirectionOverride,

UIKIT_EXTERN NSAttributedStringKey const NSVerticalGlyphFormAttributeName NS_AVAILABLE(10_7, 6_0);   // An NSNumber containing an integer value.  0 means horizontal text.  1 indicates vertical text.  If not specified, it could follow higher-level vertical orientation settings.  Currently on iOS, it's always horizontal.  The behavior for any other value is undefined.
```