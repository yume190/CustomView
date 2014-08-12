Live Render(IOS Dev Library)
==========

 * [Creating a Custom View that Renders in Interface Builder](https://developer.apple.com/library/prerelease/ios/recipes/xcode_help-IB_objects_media/CreatingaLiveViewofaCustomObject.html#//apple_ref/doc/uid/TP40014224-CH41-SW1)
  * By using the IBInspectable attribute to declare variables as inspectable properties, you allow Interface Builder to quickly rerender your custom view as you change the values of these properties in the Attributes inspector. You can attach the IBInspectable attribute to any property in a class declaration, class extension, or category for any type that’s supported by Interface Builder’s defined runtime attributes: __boolean, integer or floating point number, string, localized string, rectangle, point, size, color, range, and nil__.
  * If you need to create code for a custom view that runs only in Interface Builder, call that code from the method prepareForInterfaceBuilder. For example, while designing an app that uses the iPhone camera, you might want to draw an image that represents what the camera might capture. Although its compiled for runtime, code called from `prepareForInterfaceBuilder` never gets called except by Interface Builder at design time.
  * You can use the preprocessor macro `TARGET_INTERFACE_BUILDER` to specify code for inclusion with or exclusion from your custom view class.

### Quick Link

 * [Live Render Ver.Objetive-c (IOS 8)](#liveRenderObjc)
 * [Live Render Ver.Swift (IOS 8)](#liveRenderSwift)
 * Swift live render(use didset)[How to make awesome UI components in iOS 8 using Swift and XCode 6](http://www.weheartswift.com/make-awesome-ui-components-ios-8-using-swift-xcode-6/)
 
--

# <a name="liveRenderObjc"></a>Live Render Ver.Objetive-c (IOS 8)

Related Documents

 * [CustomView.h](CustomViewObjc/CustomViewObjetiveC.h)
 * [CustomView.m](CustomViewObjc/CustomViewObjetiveC.m)

### Step 1 <font color="red">__Very Important__</font>
 * Create a framework.
 * File -> New -> Target...
 * IOS -> Framework & Library -> Cocoa Touch Framework

### Step 2
 * Create a CustomView class inherit from UIView

### Step 3
 * Add <font color="red">`IB_DESIGNABLE`</font> to your class

<pre><code>#import &lt;UIKit/UIKit.h&gt;
IB_DESIGNABLE
@interface YourCustomVIew : UIView
@end
</code></pre>

### Step 4
 * Add some property with __`IBInspectable`__

<pre><code>#import &lt;UIKit/UIKit.h&gt;
IB_DESIGNABLE
@interface YourCustomVIew : UIView
@property (nonatomic) IBInspectable NSInteger lineWidth;
@property (nonatomic) IBInspectable UIColor *fillColor;
@property (nonatomic) IBInspectable UIColor *labelColor;
@property (nonatomic) IBInspectable NSString *labelText;
@property (nonatomic) IBInspectable CGRect labelRect;
@end
</code></pre>

### Step 5 (Branch 1)
 * Implement `drawRect` method

<pre><code>- (void)drawRect:(CGRect)rect
{
    UILabel *l =[[UILabel alloc] initWithFrame:_labelRect];
    l.text = _labelText;
    l.textColor = _labelColor;
    [self addSubview:l];

    // Drawing code
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGRect    myFrame = self.bounds;

    // Set the line width to 10 and inset the rectangle by
    // 5 pixels on all sides to compensate for the wider line.
    CGContextSetLineWidth(context, _lineWidth);
    CGRectInset(myFrame, 5, 5);

    [_fillColor set];
    UIRectFrame(myFrame);
}
</code></pre>

### Step 5 (Branch 2)

 * Implement `initWithCoder` method &amp; `initWithFrame` method

<pre><code>@interface CustomViewObjetiveC(){
    dispatch_once_t onceTokenViewLiveRendering;
}
@property (nonatomic,strong) UILabel *label;
@end

@implementation CustomViewObjetiveC

- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    
    if (self) {
        [self setup];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    
    if (self) {
        [self setup];
    }
    return self;
}

-(void)setup{
    _label = [UILabel new];
    [self addSubview:_label];
    self.backgroundColor = [UIColor whiteColor];
}
@end
</code></pre>

### Step 6 (Branch 2)

 * implement live render methods(`prepareForInterfaceBuilder` &amp; `drawRect`)

PS : some strange with live render methods.(I will explain at [Live Render Flow](#liveRenderFlow))

<pre><code>-(void)prepareForInterfaceBuilder{
    [self viewLiveRendering];
}

- (void)drawRect:(CGRect)rect{ 
#ifndef TARGET_INTERFACE_BUILDER
    [self viewLiveRendering];
#endif
}

-(void)viewLiveRendering{
    dispatch_once(&onceTokenViewLiveRendering, ^{
        _label.frame = _labelRect;
        _label.text = _labelText;
        _label.textColor = _labelColor;
    });
}
</code></pre>

--

# <a name="liveRenderSwift"></a>Live Render Ver.Swift (IOS 8)

Related Documents

 * [CustomViewSwift.swift](CustomViewSwift/CustomViewWithSwift.swift)

### Step 1 <font color="red">__Very Important__</font>
 * Create a framework.
 * File -> New -> Target...
 * IOS -> Framework & Library -> Cocoa Touch Framework

### Step 2
 * Create a CustomView class inherit from UIView

### Step 3
 * Add <font color="red">`@IBDesignable`</font> to your class

<pre><code>import UIKit
@IBDesignable
class CustomViewWithSwift: UIView {
}
</code></pre>

### Step 4
 * Add instance variable and implement constructor. `init(coder : NSCoder)`

<pre><code>import UIKit
@IBDesignable
class CustomViewWithSwift: UIView {

    @IBInspectable var labelColor: UIColor
    @IBInspectable var labelText: NSString = ""
    @IBInspectable var labelRect: CGRect

    init(coder : NSCoder) {
        labelColor = UIColor.blackColor()
        //labelText = NSString()
        labelRect = CGRect(x:0.0,y: 0.0,width: 200.0,height: 40.0)

        super.init(coder:coder)
    }
}
</code></pre>

### Step 5
 * Override `drawRect` method

<pre><code>override func drawRect(rect: CGRect)
{
    var l:UILabel = UILabel()
    l.text = labelText
    l.frame = labelRect
    l.textColor = labelColor
    addSubview(l)
}
</code></pre>

# <a name="liveRenderFlow"></a> Live Render Flow

|               | APP running          | Diff| `Debug Selected Views`<br />(`Live Rendering`)  |Function|
| :------------ |:--------------------:|:---:|:-----------------------------------------------:|:------:|
|path           |`initWithCoder:`<br />┋<br />┋<br />┋<br />┋<br />⬇︎<br />`drawRect:`|≠<br /><br /><br /><<br /><br /><br />=|`initWithFrame:`<br />┋<br />⬇︎<br />`prepareForInterfaceBuilder`<br />┋<br />⬇︎<br />`drawRect:`|init method<br /><br /><br />Live Render 1<br /><br /><br />Live Render 2|
