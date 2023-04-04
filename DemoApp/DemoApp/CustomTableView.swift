//
//  CustomTableView.swift
//  DemoApp
//
//  Created by Abdul Rahman Khan on 06/03/23.
//

import Foundation
import UIKit

protocol CustomtableViewDataSource: NSObject {
    func numberOfRows() -> Int?
    func cellForRowAtIndex(_ index: Int) -> UIView?
}

class CustomtableView: UIScrollView {
    private var numOfSection = 1
    private var numOfRowsInSec = 0
    private var stackView: UIStackView!
    private var container: UIView!
    
    weak var datasource: CustomtableViewDataSource? {
        didSet {
            guard let dataS = datasource else {return}
            numOfRowsInSec = dataS.numberOfRows() ?? 0
            reloadTableView()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.frame = frame
        self.alwaysBounceVertical = true
        self.isScrollEnabled = true
        setUp()
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func reloadTableView() {
        createCells()
    }
    
    private func createCells() {
        stackView.arrangedSubviews.forEach {$0.removeFromSuperview()}
        guard let dataS = datasource, let rows = dataS.numberOfRows(), rows > 0 else {return}
        for i in 0...rows {
            if let cell = dataS.cellForRowAtIndex(i) {
                stackView.addArrangedSubview(cell)
            }
        }
    }
    
    func setupStackView() {
        stackView = UIStackView(frame: frame)
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill
        container.addSubview(stackView)
        stackView.constraintToFit()
        stackView.heightAnchor.constraint(equalTo: self.heightAnchor).isActive = true
        stackView.widthAnchor.constraint(equalTo: self.heightAnchor).isActive = true
    }
        
    func setUp() {
        container = UIView(frame: .zero)
        container.backgroundColor = .gray
        self.addSubview(container)
        container.constraintToFit()
        setupStackView()
    }
}

extension UIView {
    
    func constraintToFit(_ leading: CGFloat = 0,_ traling: CGFloat = 0,_ top: CGFloat = 0,_ bottom: CGFloat = 0) {
        guard let superView = self.superview else {return}
        self.translatesAutoresizingMaskIntoConstraints = false
        self.leadingAnchor.constraint(equalTo: superView.leadingAnchor, constant: leading).isActive = true
        self.trailingAnchor.constraint(equalTo: superView.trailingAnchor, constant: traling).isActive = true
        self.topAnchor.constraint(equalTo: superView.topAnchor, constant: top).isActive = true
        self.bottomAnchor.constraint(equalTo: superView.bottomAnchor, constant: bottom).isActive = true
    }
}
