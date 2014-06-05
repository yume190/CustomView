// Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

var optionalString: String? = "Hello"
optionalString == nil

var optionalName: String? = nil//"John Appleseed"
var greeting = "Hello!"
if let name = optionalName {
    greeting = "Hello, \(name)"
}else{
    greeting = "Hello, \(optionalName)"
}

let vegetable = "red pepper"
switch vegetable {
case "celery":
    let vegetableComment = "Add some raisins and make ants on a log."
case "cucumber", "watercress":
    let vegetableComment = "That would make a good tea sandwich."
case let x where x.hasSuffix("pepper"):
    let vegetableComment = "Is it a spicy \(x)?"
default:
    let vegetableComment = "Everything tastes good in soup."
}

let interestingNumbers = [
    "Prime": [2, 3, 5, 7, 11, 13],
    "Fibonacci": [1, 1, 2, 3, 5, 8],
    "Square": [1, 4, 9, 16, 25],
]
var largest = 0
for (kind, numbers) in interestingNumbers {
    for number in numbers {
        if number > largest {
            largest = number
        }
    }
}
largest

var n = 2
while n < 100 {
    n = n * 2
}
n

var m = 2
do {
    m = m * 2
} while m < 100
m

var firstForLoop = 0
for i in 0..3 {
    firstForLoop += i
}
firstForLoop

var secondForLoop = 0
for var i = 0; i < 3; ++i {
    secondForLoop += 1
}
secondForLoop


func getGasPrices(a:Int=1,b:Int=2,c:Int=3,numbers:Int...) -> (Int,Int,Int,Int) {
    var n:Int? = 0
    for nn in numbers{
        n = n!+nn
    }
    return (a, b, c,n!)
}
getGasPrices()
getGasPrices(10)
getGasPrices(a: 10,b: 20)
getGasPrices(c:30,b:20,a:10,1,2,3,4,5)
