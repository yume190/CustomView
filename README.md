CustomView
==========

IOS Custom View with xib(IOS 7 &amp; 8) and Live Render (IOS 8)

 * [Custom View With xib (IOS 7 &amp; 8)](CustomView.md)
 * [Live Render (IOS 8)](LiveRender.md)
 * [Debug Selected Views](#debugSelectedViews)
 * [Debug View Hierarchy](#debugViewHierarchy)

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
