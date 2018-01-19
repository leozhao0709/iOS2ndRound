//
//  ViewController.swift
//  GCD
//
//  Created by Lei Zhao on 1/18/18.
//  Copyright © 2018 Lei Zhao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.dispatchGroup()
    }
    
    private func asyncConcurrent() {
        print("start---")
        DispatchQueue.global().async {
            print("Download1.....\(Thread.current)")
        }
        DispatchQueue.global().async {
            print("Download2.....\(Thread.current)")
        }
        DispatchQueue.global().async {
            print("Download3.....\(Thread.current)")
        }
        print("end---")
    }
    
    private func asyncSearial() {
        print("start-------")
        DispatchQueue.main.async {
            print("Download1.....\(Thread.current)")
        }
        DispatchQueue.main.async {
            print("Download2.....\(Thread.current)")
        }
        DispatchQueue.main.async {
            print("Download3.....\(Thread.current)")
        }
        print("end-----")
    }
    
    private func syncConcurrent() {
        print("start---")
        DispatchQueue.global().sync {
            print("Download1.....\(Thread.current)")
        }
        DispatchQueue.global().sync {
            print("Download2.....\(Thread.current)")
        }
        DispatchQueue.global().sync {
            print("Download3.....\(Thread.current)")
        }
        print("end-----")
    }
    
    private func syncSearial() {
        print("start")
        print(Thread.current)
        let searialQueue = DispatchQueue(label: "queuename")
        searialQueue.sync {
            print("Download1.....\(Thread.current)")
        }
        searialQueue.sync {
            print("Download2.....\(Thread.current)")
        }
        searialQueue.sync {
            print("Download3.....\(Thread.current)")
        }
        print("end-----")
        
        DispatchQueue.main.asyncAfter(deadline: .now()+1) {
            print("1s late.......\(Thread.current)")
        }
    }
    
    private func barrier() {
        print("start-------")
        let queue = DispatchQueue(label: "concurrentQ", attributes: .concurrent)
        queue.async {
            for i in 0..<100 {
                print("\(i)-------\(Thread.current)")
            }
        }
        queue.async {
            for i in 0..<100 {
                print("\(i)-------\(Thread.current)")
            }
        }
        queue.async(flags: .barrier) {
            print("+++++++++++++++++++++")
        }
        queue.async {
            for i in 0..<100 {
                print("\(i)-------\(Thread.current)")
            }
        }
        queue.async {
            for i in 0..<100 {
                print("\(i)-------\(Thread.current)")
            }
        }
        print("end--------")
    }
    
    private func concurrentPerform() {
        DispatchQueue.concurrentPerform(iterations: 10) { (i) in
            print("\(i)-----\(Thread.current)")
        }
    }
    
    private func dispatchGroup() {
        print("------start")
        let group = DispatchGroup()
        DispatchQueue.global().async(group: group) {
            print("1-------\(Thread.current)")
        }
        DispatchQueue.global().async(group: group) {
            print("2-------\(Thread.current)")
        }
        DispatchQueue.global().async(group: group) {
            print("3-------\(Thread.current)")
        }
        group.notify(queue: DispatchQueue.global()) {
            print("-----group notify----")
        }
        group.wait()
        print("-------end")
    }
}

