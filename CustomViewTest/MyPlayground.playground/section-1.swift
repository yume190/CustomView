// Playground - noun: a place where people can play

import UIKit

//var str = "Hello, playground"
//
//var optionalString: String? = "Hello"
//optionalString == nil
//
//var optionalName: String? = nil//"John Appleseed"
//var greeting = "Hello!"
//if let name = optionalName {
//    greeting = "Hello, \(name)"
//}else{
//    greeting = "Hello, \(optionalName)"
//}
//
//let vegetable = "red pepper"
//switch vegetable {
//case "celery":
//    let vegetableComment = "Add some raisins and make ants on a log."
//case "cucumber", "watercress":
//    let vegetableComment = "That would make a good tea sandwich."
//case let x where x.hasSuffix("pepper"):
//    let vegetableComment = "Is it a spicy \(x)?"
//default:
//    let vegetableComment = "Everything tastes good in soup."
//}
//
//let interestingNumbers = [
//    "Prime": [2, 3, 5, 7, 11, 13],
//    "Fibonacci": [1, 1, 2, 3, 5, 8],
//    "Square": [1, 4, 9, 16, 25],
//]
//var largest = 0
//for (kind, numbers) in interestingNumbers {
//    for number in numbers {
//        if number > largest {
//            largest = number
//        }
//    }
//}
//largest
//
//var n = 2
//while n < 100 {
//    n = n * 2
//}
//n
//
//var m = 2
//do {
//    m = m * 2
//} while m < 100
//m
//
//var firstForLoop = 0
//for i in 0..3 {
//    firstForLoop += i
//}
//firstForLoop
//
//var secondForLoop = 0
//for var i = 0; i < 3; ++i {
//    secondForLoop += 1
//}
//secondForLoop
//
//
//func getGasPrices(a:Int=1,b:Int=2,c:Int=3,numbers:Int...) -> (Int,Int,Int,Int) {
//    var n:Int? = 0
//    for nn in numbers{
//        n = n!+nn
//    }
//    return (a, b, c,n!)
//}
//getGasPrices()
//getGasPrices(10)
//getGasPrices(a: 10,b: 20)
//getGasPrices(c:30,b:20,a:10,1,2,3,4,5)
//
//
//func returnFifteen() -> Int {
//    var y = 10
//    func add() {
//        y += 5
//    }
//    add()
//    return y
//}
//returnFifteen()
//
//func makeIncrementer() -> (Int -> Int) {
//    func addOne(number: Int) -> Int {
//        return 1 + number
//    }
//    return addOne
//}
//var increment = makeIncrementer()
//increment(7)
//
//
//var numbers = [20, 19, 7, 12]
//
//numbers.map({
//    (number: Int) -> Int in
//    let result = 3 * number
//    return result
//    })
//
//numbers.map({ number in 3 * number })
//numbers
//
//sort(numbers) { $0 > $1 }
//numbers
//
//class NamedShape {
//    var numberOfSides: Int = 0
//    var name: String
//    
//    init(name: String) {
//        self.name = name
//    }
//    
//    func simpleDescription() -> String {
//        return "A shape with \(numberOfSides) sides."
//    }
//}
//
//class EquilateralTriangle: NamedShape {
//    var sideLength: Double = 0.0
//    
//    init(sideLength: Double, name: String) {
//        self.sideLength = sideLength
//        super.init(name: name)
//        numberOfSides = 3
//    }
//    
//    var perimeter: Double {
//        get {
//            return 3.0 * sideLength
////            return self.perimeter
//        }
//        set {
//            sideLength = newValue / 0.5
////            self.perimeter = newValue / 0.5
//        }
//    }
//    
//    var perimeter2: Double {
//        get {
//            return 2.0 * sideLength
//        }
//        set (value){
//            sideLength = value / 1
//        }
//    }
//}
//
//var tt = EquilateralTriangle(sideLength: 1,name: "a")
//tt.perimeter = 10
//tt.perimeter
//
//tt.perimeter2 = 10
//tt.perimeter2
//
//class Square: NamedShape {
//    var sideLength: Double
//    
//    init(sideLength: Double, name: String) {
//        self.sideLength = sideLength
//        super.init(name: name)
//        numberOfSides = 4
//    }
//    
//    func area() ->  Double {
//        return sideLength * sideLength
//    }
//    
//    override func simpleDescription() -> String {
//        return "A square with sides of length \(sideLength)."
//    }
//}
//
//class TriangleAndSquare {
//    var triangle: EquilateralTriangle {
//        willSet {
//            square.sideLength = newValue.sideLength
//        }
//    }
//    
//    var square: Square {
//        willSet {
//            triangle.sideLength = newValue.sideLength
//        }
//    }
//    
//    init(size: Double, name: String) {
//        square = Square(sideLength: size, name: name)
//        triangle = EquilateralTriangle(sideLength: size, name: name)
//    }
//}
//var triangleAndSquare = TriangleAndSquare(size: 10, name: "another test shape")
//triangleAndSquare.square.sideLength
//triangleAndSquare.triangle.sideLength
//triangleAndSquare.square = Square(sideLength: 50, name: "larger square")
//triangleAndSquare.triangle.sideLength
//
//let optionalSquare: Square? = Square(sideLength: 2.5, name: "optional square")
//let sideLength = optionalSquare?.sideLength
//
//
//enum Rank: Int {
//    case Ace = 1
//    case Two, Three, Four, Five, Six, Seven, Eight, Nine, Ten
//    case Jack, Queen, King
//    func simpleDescription() -> String {
//        switch self {
//        case .Ace:
//            return "ace"
//        case .Jack:
//            return "jack"
//        case .Queen:
//            return "queen"
//        case .King:
//            return "king"
//        default:
//            return String(self.toRaw())
//        }
//    }
//}
//let ace = Rank.Ace
//ace.simpleDescription()
////let aceRawValue = ace.toRaw()
//
//#if os(iOS)
//    var image: UIImage?
//#elseif os(OSX)
//    var image: NSImage?
//#endif
//
////OS()：OSX, iOS
//
////arch()：x86_64, arm, arm64, i386
//
//let os = NSProcessInfo().operatingSystemVersion
//switch (os.majorVersion, os.minorVersion, os.patchVersion) {
//case (8, _, _):
//    println("iOS >= 8.0.0")
//case (7, 0, _):
//    println("iOS >= 7.0.0, = 7.1.0, < 8.0.0")
//default:
//    println("iOS = 8.0")
//}

extension String {
    static func className(aClass: AnyClass) -> String {
        return NSStringFromClass(aClass).componentsSeparatedByString(".").last!
    }
}

println(String.className(NSNumber.classForCoder()))

//
//protocol Num {
//    typealias N
//    func zero() -> N
//    func succ(n: N) -> N
//    func add(x: N, y: N) -> N
//    func multiply(x: N, y: N) -> N
//}
////Next we can define an instance of this trait for every number type we want to implement this type class:
//
//class NInt8: Num {
//    typealias N = Int8
//    func zero() -> N { return 0 }
//    func succ(n: N) -> N { return n + 1 }
//    func add(x: N, y: N) -> N { return x + y }
//    func multiply(x: N, y: N) -> N { return x * y }
//}


var ccccc = UIView()
ccccc.clipsToBounds=true
//ccccc.layer.sha

struct Style {
    var borderColor:UIColor?
    var borderWidth:CGFloat?
    var cornerRadius:CGFloat?
    var shadowColor:UIColor?
    var shadowRadius:CGFloat?
    var shadowOpacity:Float?
    var shadowOffsetY:CGFloat?
    
    mutating func setBorderColor(color:UIColor) -> Style{
        borderColor = color
        return self
    }
    
    mutating func setBorderWidth(width:CGFloat) -> Style{
        borderWidth = width
        return self
    }
    
    mutating func setCornorRadius(radius:CGFloat) -> Style{
        cornerRadius = radius
        return self
    }
    
    mutating func setShadowColor(color:UIColor) -> Style{
        shadowColor = color
        return self
    }
    
    mutating func setShadowRadius(radius:CGFloat) -> Style{
        shadowRadius = radius
        return self
    }
    
    mutating func setShadowOpacity(opacity:Float) -> Style{
        shadowOpacity = opacity
        return self
    }
    
    mutating func setShadowOffsetY(offset:CGFloat) -> Style{
        shadowOffsetY = offset
        return self
    }
    
    init(){
    }
    
//    deinit{
//        borderColor = nil
//        borderWidth = nil
//        cornerRadius = nil
//        shadowColor = nil
//        shadowRadius = nil
//        shadowOpacity = nil
//        shadowOffsetY = nil
//    }
}


var cc = Style()

cc.borderColor = UIColor.blackColor()
cc.borderColor
cc.setBorderColor(UIColor.whiteColor())
cc.borderColor


var view = UIView(frame: CGRectMake(0, 0, 200, 200))
var backgroudRingLayer:CALayer?
if backgroudRingLayer == nil{
    backgroudRingLayer = CAShapeLayer()
    view.layer.addSublayer(backgroudRingLayer)
    
    var halfLineWidth = 200 / 2.0 as CGFloat
    let rect = CGRectInset(view.bounds, halfLineWidth, halfLineWidth)
    let path = UIBezierPath(ovalInRect: rect)
    
    
    let arccPath = UIBezierPath(arcCenter: CGPointMake(20, 20), radius: 50, startAngle: 180, endAngle: 270, clockwise: true)
    
//    backgroudRingLayer.path = path.CGPath
//    backgroudRingLayer.fillColor = nil
//    backgroudRingLayer.lineWidth = lineWidth
//    backgroudRingLayer.strokeColor = UIColor.yellowColor().CGColor
}
//backgroudRingLayer.frame = layer.bounds

var aaa=1
var bbb=2
var ccc=3
var abc = aaa++ * ++aaa
abc


//if let _borderWidth = borderWidth >= 0 ? borderWidth : vStyle.borderWidth {
//    layer.borderWidth = _borderWidth
//}

var zzz:Int = -1
var www:Int? = nil

if let zxcv = zzz >= 0 ? zzz : www{
    var yyy = zxcv
    yyy
}


