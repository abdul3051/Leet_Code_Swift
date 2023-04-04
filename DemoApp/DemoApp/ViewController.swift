//
//  ViewController.swift
//  DemoApp
//
//  Created by Abdul Rahman Khan on 06/03/23.
//

import UIKit

class ViewController: UIViewController, CustomtableViewDataSource {
 
    var tableView: CustomtableView?
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView = CustomtableView(frame: self.view.bounds)
        self.view.addSubview(tableView!)
        tableView!.constraintToFit()
        tableView?.backgroundColor = .brown
        tableView!.datasource = self
    }

    func numberOfRows() -> Int? {
        return 10
    }
    
    func cellForRowAtIndex(_ index: Int) -> UIView? {
        let tableFrame = tableView?.frame ?? CGRect.zero
        let cell = UIView(frame: CGRect(x: 0, y: 0, width: tableFrame.size.height, height: 50))
        cell.heightAnchor.constraint(equalToConstant: 100).isActive = true
        if index % 2 == 0 {
            cell.backgroundColor = .red
        } else {
            cell.backgroundColor = .gray
        }
        return cell
    }

}


