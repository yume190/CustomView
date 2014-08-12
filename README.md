CustomView
==========

IOS Custom View with xib(IOS 7 &amp; 8) and Live Render (IOS 8)

## Combine custom view with xib, live render(IOS8) and KVC

### custom view with xib + live render

You must learn `custom view with xib` and `live render` first

then, add some code in your CustomView.m

we have some change at `setup` method

<pre><code>- (void) setup{
    NSString *nibName = NSStringFromClass([self class]);
    
    //Bundle Identifier can be find at Target -> Your Framework -> Bundle Identifier
    NSBundle *frameworkBundle = [NSBundle bundleWithIdentifier:@"com.yume190.CustomViewObjc"];
    
    UINib *nib = [UINib nibWithNibName:nibName bundle:frameworkBundle];
    
    [nib instantiateWithOwner:self options:nil];
    //Add the view loaded from the nib into self.
    [self addSubview:self.view];
}
</code></pre>

### custom view + KVC

Related Documents

 * [ViewSource.m](CustomViewObjc/ViewSource.m)
 * [CustomWithXibLiveRenderKVC.h](CustomViewObjc/CustomWithXibLiveRenderKVC.h)
 * [CustomWithXibLiveRenderKVC.m](CustomViewObjc/CustomWithXibLiveRenderKVC.m)
 * and storyboard

### Quick Link

 * [Custom View With xib (IOS 7 &amp; 8)](#xib)
 * [Live Render Ver.Objetive-c (IOS 8)](#liveRenderObjc)
 * [Live Render Ver.Swift (IOS 8)](#liveRenderSwift)
 * [Debug Selected Views](#debugSelectedViews)
 * [Debug View Hierarchy](#debugViewHierarchy)
 * Swift live render(use didset)[How to make awesome UI components in iOS 8 using Swift and XCode 6](http://www.weheartswift.com/make-awesome-ui-components-ios-8-using-swift-xcode-6/)


  

# <a name="xib"></a>Custom View With xib (IOS 7 &amp; 8)

Related Documents

 * [CustomView.h](CustomViewTest/TemplateView1.h)
 * [CustomView.m](CustomViewTest/TemplateView1.m)
 * [CustomView.xib](CustomViewTest/TemplateView1.xib)

### Step 1
 * Create a CustomView class inherit from UIView.(ex:CustomView.h & CustomView.m)
 * Then create xib file with same name.(ex:CustomView.xib)

### Step 2
 * Click the xib file
 * Find the File's Owner and click it
 * command + option + 3
 * Input your Custom Class name.(ex:Custom)

### Step 3
 * Implement `initWithCoder` method 

<pre><code>- (void) setup{
    NSString *nibName = NSStringFromClass([self class]);
    UINib *nib = [UINib nibWithNibName:nibName bundle:nil];
    [nib instantiateWithOwner:self options:nil];
    //Add the view loaded from the nib into self.
    [self addSubview:self.view];
}

- (id)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];

    if (self) {
        [self setup];
    }
    return self;
}
</code></pre>

### Step 4 (Optional)
 * If you want to input your parameter at storyboard.
 * Drag a UIView to your storyboard.
 * Click it -> command + option + 3 -> input your Custom Class name
 * Find the "User denfined Runtime Attributes"

| Key Path      | Type          | Value   |
| :------------ |:--------------|:--------|
|vTitle         |String         |the title|

 * Create a property in CustomView.h

<pre><code>@property (assign) NSString* vTitle;</code></pre>

 * Implement `awakeFromNib` in CustomView.m

<pre><code>- (void)awakeFromNib {
    labelTitle.text = vTitle;
}</code></pre>



# <a name="debugSelectedViews"></a>Debug Selected Views

 * You must click target view and you can find this future below

![Imgae 1](images/i1.png)

|               | APP running          | Diff| `Debug Selected Views`<br />(`Live Rendering`)  |Function|
| :------------ |:--------------------:|:---:|:-----------------------------------------------:|:------:|
|path           |`initWithCoder:`<br />┋<br />┋<br />┋<br />┋<br />⬇︎<br />`drawRect:`|≠<br /><br /><br /><<br /><br /><br />=|`initWithFrame:`<br />┋<br />⬇︎<br />`prepareForInterfaceBuilder`<br />┋<br />⬇︎<br />`drawRect:`|init method<br /><br /><br />Live Render 1<br /><br /><br />Live Render 2|

# <a name="debugViewHierarchy"></a>Debug View Hierarchy

 * This future must running your APP, and you can find it at below.

![Imgae 2](images/i2.png)

or

![Imgae 3](images/i3.png)
