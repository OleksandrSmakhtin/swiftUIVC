//
//  FirstVC.swift
//  swiftUIVC
//
//  Created by Oleksandr Smakhtin on 21/08/2023.
//

import UIKit

class FirstVC: UIViewController {

    var isLableHidden = false
    
    
    //MARK: - UI Objects
    private let myLbl: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        lbl.text = "This is my label"
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    private let mySecondLbl: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        lbl.text = "This is my Second view controller"
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    
    private let myBtn: UIButton = {
        let btn = UIButton(type: .system)
        btn.backgroundColor = .clear
        btn.setTitle("My button", for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        btn.layer.borderWidth = 3
        btn.tintColor = .black
        btn.layer.borderColor = UIColor.black.cgColor
        btn.layer.cornerRadius = 15
        
        btn.addTarget(self, action: #selector(didPressedMyBtn), for: .touchUpInside)
        
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    //MARK: - Actions
    @objc private func didPressedMyBtn() {
        let vc = SecondVC()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
        
    }
    
    
    //MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        // bg color
        view.backgroundColor = .white
        // add subviews
        addSubviews()
        // apply constraints
        applyConstraints()
    }
    
    
    //MARK: - Add subviews
    private func addSubviews() {
        view.addSubview(myLbl)
        view.addSubview(myBtn)
        view.addSubview(mySecondLbl)
    }
    
    //MARK: - Apply constraints
    private func applyConstraints() {
        
        let myLblConstraints = [
            myLbl.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            myLbl.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ]
        
        let myBtnConstraints = [
            myBtn.centerXAnchor.constraint(equalTo: myLbl.centerXAnchor),
            myBtn.topAnchor.constraint(equalTo: myLbl.bottomAnchor, constant: 30),
            myBtn.heightAnchor.constraint(equalToConstant: 50),
            myBtn.widthAnchor.constraint(equalToConstant: 200)
        ]
        
        let mySecondLblConstraints = [
            mySecondLbl.topAnchor.constraint(equalTo: myBtn.bottomAnchor, constant: 40),
            mySecondLbl.centerXAnchor.constraint(equalTo: myBtn.centerXAnchor)
        ]
        
        NSLayoutConstraint.activate(myLblConstraints)
        NSLayoutConstraint.activate(myBtnConstraints)
        NSLayoutConstraint.activate(mySecondLblConstraints)
        
    }

}
