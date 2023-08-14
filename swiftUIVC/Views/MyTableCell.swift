//
//  myTableCell.swift
//  swiftUIVC
//
//  Created by Oleksandr Smakhtin on 13/08/2023.
//

import UIKit

class MyTableCell: UITableViewCell {

    static let indetefier = "MyTableCell"
    
    
    private let myLbl: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        lbl.text = "jhkgbdhkc"
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    
    
    private let myCustomView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.layer.borderWidth = 2
        view.layer.cornerRadius = 20
        view.layer.borderColor = UIColor.black.cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        // bg color
        backgroundColor = .clear
        addSubviews()
        applyConstraints()
    }
    
    
    private func addSubviews() {
        contentView.addSubview(myCustomView)
        myCustomView.addSubview(myLbl)
    }
    
    
    
    private func applyConstraints() {
        
        let customViewConstraints = [
            myCustomView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            myCustomView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            myCustomView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
            myCustomView.topAnchor.constraint(equalTo: contentView.topAnchor)
        ]
        
        let myLblConstraints = [
            myLbl.leadingAnchor.constraint(equalTo: myCustomView.leadingAnchor, constant: 20),
            myLbl.centerYAnchor.constraint(equalTo: myCustomView.centerYAnchor)
        ]
        
        NSLayoutConstraint.activate(customViewConstraints)
        NSLayoutConstraint.activate(myLblConstraints)
        
    }
    
    
    public func configure(with model: String) {
        myLbl.text = model
    }
    
    
    public func changeTitle() {
        myLbl.text = "X"
    }
    
    
    required init?(coder: NSCoder) {
        fatalError()
    }

}
