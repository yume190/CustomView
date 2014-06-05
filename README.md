CustomView
==========

IOS Custom View with xib(IOS 7 &amp; 8) and Live Render (IOS 8)

# Custom View With xib (IOS 7 &amp; 8)

Related Documents
 * [CustomView.h](CustomViewTest/TemplateView1.h)
 * [CustomView.m](CustomViewTest/TemplateView1.m)
 * [CustomView.xib](CustomViewTest/TemplateView1.xib)

## Step 1
 * Create a CustomView class inherit from UIView.(ex:CustomView.h & CustomView.m)
 * then Create xib file with same name.(ex:CustomView.xib)

## Step 2
 * click the xib file
 * find the File's Owner and click it
 * command + option + 3
 * input your Custom Class name.(ex:Custom)

## Step 3
 * implement initWithCoder method

<pre><code>
    - (void) setup{
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

## Step 4 (Optional)
 * If you want to input your parameter at storyboard.
 * Drag a UIView to your storyboard.
 * Click it -> command + option + 3 -> input your Custom Class name
 * find the "User denfined Runtime Attributes"

| Key Path     | Type         | Value  |
| :------------ |:--------------|:-------|
|vTitle|String|the title|
 * Create a property in CustomView.h


    @property (assign) NSString* vTitle;
 * Implement awakeFromNib in Custom.m


    - (void)awakeFromNib {
        labelTitle.text = vTitle;
    }


# Live render (IOS 8 )
