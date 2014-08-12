WWDC 2014 Session 401
========

 * [Debug Selected Views](#debugSelectedViews)
 * [Debug View Hierarchy](#debugViewHierarchy)

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
