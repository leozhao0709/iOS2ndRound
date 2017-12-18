//: Playground - noun: a place where people can play

import UIKit

var a = 20
var b = 30

func swap(a: inout Int, b: inout Int) {
    let m = a
    a = b
    b = m
}

swap(a: &a, b: &b)

print(a)
print(b)
