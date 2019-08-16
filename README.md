## RDExtensionsSwift
[![Version](https://img.shields.io/cocoapods/v/RDExtensionsSwift.svg?style=flat)](http://cocoapods.org/pods/RDExtensionsSwift)
[![License](https://img.shields.io/cocoapods/l/RDExtensionsSwift.svg?style=flat)](https://github.com/Rendel27/RDExtensionsSwift/blob/master/LICENSE)
[![Platform](https://img.shields.io/cocoapods/p/RDExtensionsSwift.svg?style=flat)](http://cocoapods.org/pods/RDExtensionsSwift)
[![Language](https://img.shields.io/badge/swift-2.2-orange.svg)](http://swift.org)
[![Language](https://img.shields.io/badge/swift-2.3-orange.svg)](http://swift.org)
[![Language](https://img.shields.io/badge/swift-3-orange.svg)](http://swift.org)
[![Language](https://img.shields.io/badge/swift-4-orange.svg)](http://swift.org)
[![Language](https://img.shields.io/badge/swift-4.2-orange.svg)](http://swift.org)
[![Language](https://img.shields.io/badge/swift-5.0-orange.svg)](http://swift.org)



RDExtensionsSwift is a collection of useful extensions for Swift.  
It makes your iOS app development much easier and lets you to write simplier and cleaner code.



## Content
- [Operator Overloads](#operator-overloads)
- [Int and Int64 Extensions](#int-and-int64-extensions)
- [Double Float and CGFloat Extensions](#double-float-and-cgfloat-extensions)
- [Bool Extensions](#bool-extensions)
- [Character Extensions](#character-extensions)
- [String Extensions](#string-extensions)
- [CGRect Extensions](#cgrect-extensions)
- [CMTime Extensions](#cmtime-extensions)
- [AVPlayerItem Extensions](#avplayeritem-extensions)
- [Array and Collection Extensions](#array-and-collection-extensions)
- [NSObject Extensions](#nsobject-extensions)
- [NSData Extensions](#nsdata-extensions)
- [NSDate Extensions](#nsdate-extensions)
- [NSDictionary Extensions](#nsdictionary-extensions)
- [NSURL Extensions](#nsurl-extensions)
- [PHAsset Extensions](#phasset-extensions)
- [UIColor Extensions](#uicolor-extensions)
- [UIImage Extensions](#uiimage-extensions)
- [UINib Extensions](#uinib-extensions)
- [UIView Extensions](#uiview-extensions)
- [UIScrollView Extensions](#uiscrollview-extensions)
- [UIAlertView Extensions](#uialertview-extensions)
- [UIAlertController Extensions](#uialertcontroller-extensions)
- [UIImageView Extensions](#uiimageview-extensions)
- [UILabel Extensions](#uilabel-extensions)
- [UITextField Extensions](#uitextfield-extensions)
- [UITextView Extensions](#uitextview-extensions)
- [UIViewController Extensions](#uiviewcontroller-extensions)
- [MPMoviePlayerController Extensions](#mpmovieplayercontroller-extensions)



### Operator Overloads
You can add, substract, multiply, divide other type variables without casting them:
```swift
let intNumber : Int = 10
let doubleNumber : Double = 5.5
let sum = intNumber + doubleNumber // sum value will be 15.5 Double
```

You are able to concatenate two array into first:
```swift
var array1 = [1, 2, 3]
let array2 = [4, 5, 6]
array1 += array2 // array1 value will be [1, 2, 3, 4, 5, 6]
```

### Int and Int64 Extensions
Convert int to ascii character:
```swift
97.toCharacter // value will be Character("A")
```

Convert int to String:
```swift
123.toString // value will be String("123")
```

### Double Float and CGFloat Extensions
Convert Double to String:
```swift
let d = 123.456789
d.toString = "123.456789"
d.toString() = "123.45"
d.toString(4) = "123.4567" // where 4 is the number of characters after point
```

### Bool Extensions
Convert bool to String and Int
```swift
true.toString = "true"
false.toString = "false"
true.toInt = 1
false.toInt = 0
```

### Character Extensions
Convert Character to Int (by ascii table):
```swift
Character("A").toInt = 97
```

### String Extensions
Convert String to bool, Int, Double, CGFloat, HTTP URL, File Path etc...
```swift
("TRUE" | "True" | "true" | "YES" | "Yes" | "yes" | "1").toBool = true
("FALSE" | "False" | "false" | "NO" | "No" | "no" | "0").toBool = false
"123".toInt = 123
"123".toDouble = Double(123)
"123".toCGFloat = CGFloat(123)
"http://example.com/".toHttpURL = NSURL(sting: "http://example.com/")
"/path/to/file".toFileURL = NSURL(fileURLWithPath: "/path/to/file")
```

Get the length of the String:
```swift
"123456789".length = 9
```

Trim whitespace characters from String:
```swift
"   1 2 3 4   ".condenseWhiteSpace() = "1 2 3 4"
```

Substring To, From, From to To, Range:
```swift
"0123456789".substringTo(5) = "01234"
"0123456789".substringFrom(5) = "56789"
"0123456789".substring(4, to: 7) = "456"
```

Get the range of substring:
```swift
"0123456789".range("456") = NSRange(4, 3)
```

Append path component:
```swift
"/folder/subfolder".stringByAppendingPathComponent("subfolder2/file") = "/folder/subfolder/subfolder2/file"
```

Replace Characters with NSRange and return Value:
```swift
"0123456789".stringByReplacingCharactersInRange(NSMakeRange(4, 3), withString: "000") = "0123000789"
```

Replace Characters with NSRange:
```swift
var string = "0123456789"
string.replaceCharactersInRange(NSMakeRange(4, 3), withString: "000") // string value will be "0123000789"
```

Validate with regex:
```swift
"#hashtag".validate("#.*") = true
"#hashtag".validate("#.*")
```

Find regex matches:
```swift
do
{
let array = try "name1 name2 name3".matches("[a-zA-Z]{4}[0-9]{1}") // array value will be ["name1", "name2", "name3"]
}
catch
{
// handle an error here
}
```

Find ranges for values:
```swift
do
{
let array = try "name1 name2 name3".ranges("name") // array value will be [NSMakeRange(0, 4), NSMakeRange(6, 4), NSMakeRange(12, 4)]
}
catch
{
// handle an error here
}
```

Get Characters and substrings via subscripts:
```swift
"123"[1] = Character("2") // Character value
"123"[1] = "2" // String value
"123"[NSMakeRange(1, 1)] = "2"
"123"[NSMakeRange(1, 1).toRange()!] = "2"
```

Get visible string for rect:
```swift
let string = "string value here ..."
string.visibleStringInRect(CGRectValue, font: UIFontValue)
```

Generate UUID:
```swift
String.UUID = "503bc59e-83f9-11e6-ae22-56b6b6499611" // value will be unique string
```

Get width for height and height for width:
```swift
"string value here".widthForHeight(50, font: UIFont())
"string value here".heightForWidth(50, font: UIFont())
```

### CGRect Extensions
Get and Set values for x, y, centerX, centerY, lastX, lastY, center, middle points from CGRect:
```swift
let frame = CGRectMake(10, 20, 50, 100)
frame.x = 10
frame.y = 20
frame.centerX = 30
frame.centerY = 60
frame.lastX = 60
frame.lastY = 120
frame.center = CGPointMake(30, 60)
frame.middle = CGPointMake(25, 50)
```

### CMTime Extensions
Convert CMTime to NSTimeInterval in seconds:
```swift
CMTimeMake(100, timescale: timescaleValue).toSeconds = 100
```

### AVPlayerItem Extensions
Get current playback time from AVPlayerItem:
```swift
let item = AVPlayerItem() // initialization here
item.currentPlaybackTime // value will be current playback time in seconds
```

### Array and Collection Extensions
Remove specific object from array:
```swift
var array = [1, 2, 3, 4, 5]
let removedObject = array.remove(2)
removedObject = 2
array = [1, 3, 4, 5]
```

Insert contents of array at index:
```swift
var array1 = [1, 2, 3]
var array2 = [4, 5, 6]
let array3 = array1.insertContentsOf(array2, atIndex: 1)
array3 = [1, 4, 5, 6, 2, 3]
```

Subscript two dimensional array with NSIndexPath:
```swift
let dataSource = [[1, 2], [3]]
dataSource[NSIndexPath(forRow: 0, inSection: 1)] = 3
```

Remove object from two dimensional array with NSIndexPath:
```swift
let dataSource = [[1, 2], [3]]
let removedObject = dataSource.removeAtIndexPath(NSIndexPath(forRow: 0, inSection: 1))
removedObject = 3
```

Convert String array to Int array:
```swift
let stringArray = ["1", "2", "3"]
stringArray.toInt = [1, 2, 3]
```

### NSObject Extensions
Get class full name as string:
```swift
UIViewController.stringFromClass = "ProjectTargetName.UIViewController"
UIViewController().stringFromClass = "ProjectTargetName.UIViewController"
```

Get class name as string:
```swift
UIViewController.className = "UIViewController"
UIViewController().className = "UIViewController"
```

Get Object from Nib:
```swift
NSObject.objectFromNib("NibName")
NSObject.objectFromNib("NibName", boundle: boundle, owner: owner, options: options)
```

### NSData Extensions
Download data from internet:
```swift
let url = NSURL(string: "https://avatars3.githubusercontent.com/u/5988751?v=3&s=466")!
let uuid = NSData.download(url, completeInMainThread: true, completion: { (data, id) in
id == uuid
data == downloaded data from url
})
```

### NSDate Extensions
Get local Date:
```swift
NSDate.localDate = current date by device timezone
```

Create Date from day, month and year:
```swift
NSDate.dateWithDay(29, month: 7, year: 1992) = 29/07/1992
```

Convert Date to String:
```swift
date.toString("dd-MM-YY") = "29-07-92"
date.toString("ss-mm-HH") = "27-35-11"
```

Date properties:
```swift
let date = NSDate(timeIntervalSince1970: 1474647378)
let second = 18
let minute = 16
let hour = 18
let day = 23
let weekDay = 6
let weekdayOrdinal = 4
let month = 9
let year = 2016
let era = 1

self.date.second = second
self.date.minute = minute
self.date.hour = hour
self.date.day = day
self.date.weekDay = weekDay
self.date.weekdayOrdinal = weekdayOrdinal
self.date.month = month
self.date.year = year
self.date.era = era
```

### NSDictionary Extensions
Get value for caseinsensitive key:
```swift
let dict = ["kEy" : "value"]
dict.valueForLowercaseKey("key") = "value"
dict.valueForLowercaseKey("KEY") = "value"
```

### NSURL Extensions
Exclude URL from icloud backup:
```swift
let url = NSURL(fileURLWithPath: "/path/to/file")
url.excludeFromBackup(true) // exclude
url.excludeFromBackup(false) // include
```

Check if url is excluded from backup:
```swift
let url = NSURL(fileURLWithPath: "/path/to/file")
url.excludedFromBackup = true // excluded
url.excludedFromBackup = false // included
```

### PHAsset Extensions
Check if PHAsset is already fetched from server:
```swift
let asset = PHAsset() // init here
asset.downloaded = true // fetched
asset.downloaded = false // not fetched
```

### UIColor Extensions
Create UIColor with RGB integer and hex values:
```swift
UIColor(255, green: 0, blue: 0) // Red color
UIColor(hexValue: 0xff0000) // Red color
UIColor(hexString: "#ff0000") // Red color
```

Get color components:
```swift
let color = UIColor(1, green: 0.5, blue: 0)
color.red = 1
color.green = 0.5
color.blue = 0
```

Get random color
```swift
UIColor.randomColor
```

### UIImage Extensions
Create image with color:
```swift
UIImage(color: UIColor.redColor(), size: CGSizeMake(100, 100))
```

Download image from url:
```swift
let url = NSURL(string: "https://avatars3.githubusercontent.com/u/5988751?v=3&s=466")!
let uuid = UIImage.download(url, completion: { (image, id) in
id == uuid
image == downloaded image from url
})
```

Animated image from GIF file:
```swift
UIImage.gif("file.gif") // gif with name
UIImage.gif(NSURL()) // gif with url
UIImage.gif(NSData()) // gif with data
UIImage.gif(CGImageSourceRef()) // gif with source
```

Invert Transparancy:
```swift
let image = UIImage(named: "") // Init here
image.invertTransparancy()
```

Get color with pixel:
```swift
let image = UIImage(named: "") // Init here
image.color(CGPointMake(20, 40))
```

Resize Image:
```swift
let image = UIImage(named: "") // Init here
image.rescale(0.5) // image will be resized by 1/2
image.resize(CGSizeMake(10, 20)) // image will be resized on (10, 20) size
image.cutCircle(10) // image will cut circle with 10 radius
```

Rotate Image:
```swift
let image = UIImage(named: "") // Init here
image.imageByRotation(90) // image will be rotated by 90 degrees
```

Change orientation:
```swift
let image = UIImage(named: "") // Init here
image.changeOrientation(UIImageOrientation.Down) // image will have Down orientation
```

### UINib Extensions
Initialize nib:
```swift
UINib.instantiateType(type, nibName: name, bundle: boundle, owner: owner, options: options)
```

### UIView Extensions
Load view from nib:
```swift
UIView.loadNibNamed(nibName: String, nibClass: AnyClass)
```

Get subviews by tag recursively:
```swift
self.view.subviews(27, recursively: true)
```

Remove all subviews:
```swift
self.view.removeAllSubviews()
```

Get screenshot from view:
```swift
self.view.screenshot() // returns UIImage
self.view.screenshot(CGRectMake(0, 0, 100, 100)) // returns UIImage from 0, 0, 100, 100 frame
```

Covert View to Image:
```swift
self.view.toImage
```

Stretch view layout:
```swift
let view = UIView() // Init here
view.stretchLayout() // view will have the same frame as its superview
view.stretchLayout(UIView()) // view will have the same frame as another view
view.stretchLayout(UIView(), edgeInsets: UIEdgeInsetsMake()) // view will have the frame with insets to another view
```

Get constraints by identifier:
```swift
let view = UIView() // Init here
view.constraints("identifier") // returns array of NSLayoutConstraint
```

Mask view outside and inside of frame:
```swift
let view = UIView() // Init here
view.outterMask(CGRectMake(10, 10, 80, 80, cornerRadius: 10)) // cornerRadius is optional
view.innerMask(CGRectMake(10, 10, 80, 80, cornerRadius: 10)) // cornerRadius is optional
```

Remove mask from view:
```swift
view.removeMask()
```

Check if view is masked:
```swift
view.masked = true // masked
view.masked = false // not masked
```

### UIScrollView Extensions
Get and Set content width and height of scroll view:
```swift
scrollview.contentWidth = 100
scrollview.contentHeight = 100
```

Check if scroll view is scroll top or bottom:
```swift
scrollview.scrolledTop = true // scrolled to top
scrollview.scrolledBottom = true // scrolled to bottom
```

Scroll scroll view to Top and Bottom:
```swift
scrollview.scrollToTop(true) // scroll to top with animation
scrollview.scrollToTop(false) // scroll to top without animation
scrollview.scrollToBottom(true) // scroll to top with animation
scrollview.scrollToBottom(false) // scroll to top without animation
```

### UIAlertView Extensions
Create simple alert view:
```swift
UIAlertView(title: String?, message: String, delegate: AnyObject?, tag: Int, style: UIAlertViewStyle, keyboardType: UIKeyboardType, cancelButtonTitle: String?, otherButtonTitles: String, String...)
```

### UIAlertController Extensions
Create simple alert controller:
```swift
UIAlertController(title: String?, message: String, style: UIAlertControllerStyle, inputFieldPlaceholders: [String], actionTitles: [String], actionBlocks: { (action) in
}, completion: {
})
```

### UIImageView Extensions
Create UIImageView with mask:
```swift
UIImageView.imageView(UIImage(), mask: UIImage())
```

### UILabel Extensions
Get width and height for label text by height, width and font:
```swift
label.widthForText
label.heightForText
```

Truncate label tail:
```swift
label.truncateTail(10, attributed: false) // truncate after 10 characters non attributed label
label.tailTruncated // check if label tail is truncated 
```

Get visible text rect:
```swift
label.textRect // return CGRect
```

Get character index by point:
```swift
label.characterIndex(CGPointMake(10, 10)) // returns Int
```

### UITextField Extensions
Get width and height for text field text by height, width and font:
```swift
textField.widthForText
textField.heightForText
```

### UITextView Extensions
Get width and height for text view text by height, width and font:
```swift
textView.widthForText
textView.heightForText
```

### UIViewController Extensions
Load view controllers:
```swift
UIViewController.loadWithId("identifier", storyboard: "name") // storyboard name is optional. If it is not presented view controller will be loaded from Main storyboard
MyViewController.loadFromStoryboard("storyboardName") // storyboard name is optional. If it is not presented view controller will be loaded from Main storyboard
MyViewController.loadAsRootViewControllerFromStoryboard("storyboardName") // initializes viewcontroller and loads it as root. Storyboard name is optional. If it is not presented view controller will be loaded from Main storyboard
MyViewController().loadAsRootViewController() // loads view controller as root.
```

### MPMoviePlayerController Extensions
Get thumbnail from moview player:
```swift
player.thumbnail(CMTime) // returns UIImage. Time is optional. If it is not presented thumbnail will be loaded from the first frame
```



## Installation

- **Manually**  
- ***As Open Source:***
1. Download RDExtensionsSwift project  
2. Drag n drop the Source folder into your project (Make sure that you tick on Copy if needed checkbox)  
- ***As Embedded Framework:***
1. Download RDExtensionsSwift project  
2. Build it for desired target  
3. Copy it into your project directory  
4. In Xcode navigator select project >> General >> Embedded Binaries: click + button and select RDExtensionsSwift framework.


- **[CocoaPods](https://cocoapods.org)**  

```ruby
source 'https://github.com/CocoaPods/Specs.git'
use_frameworks!
target 'ProjectName' do
# For latest version:
    pod 'RDExtensionsSwift'
    
# For earlier verions:
    pod 'RDExtensionsSwift', '~> 5.0.1' # for Swift 5.0
    pod 'RDExtensionsSwift', '~> 4.2.3' # for Swift 4.2
    pod 'RDExtensionsSwift', '~> 4.0.1' # for Swift 4
    pod 'RDExtensionsSwift', '~> 3.1.1' # for Swift 3.2
    pod 'RDExtensionsSwift', '~> 2.1.0' # for Swift 3.0
    pod 'RDExtensionsSwift', '~> 1.0.7' # for Swift 2
end
```
Run `pod install`, and you should now have the latest RDExtensionsSwift release.



## Usage
All you need to do is to import the library and start coding:
```ruby
import RDExtensionsSwift
```



## Requirements
- Swift 2.2 or later



## Author
Giorgi Iashvili, me@rendel.ge



## License
RDExtensionsSwift is available under the MIT license. See the LICENSE file for more info.
