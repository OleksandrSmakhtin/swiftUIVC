//
//  ContentView.swift
//  swiftUIVC
//
//  Created by Oleksandr Smakhtin on 13/08/2023.
//

import SwiftUI
import UIKit

struct ContentView: View {
    var body: some View {
        MyViewControllerWrapper()
            .edgesIgnoringSafeArea(.all) // cover the entire screen
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}






class MyVC: UIViewController {
    
    
    
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
        
//        if isLableHidden {
//            UIView.animate(withDuration: 1) {
//                self.mySecondLbl.layer.opacity = 1
//                self.isLableHidden.toggle()
//            }
//        } else {
//            UIView.animate(withDuration: 1) {
//                self.mySecondLbl.layer.opacity = 0
//                self.isLableHidden.toggle()
//            }
//        }
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



class SecondVC: UIViewController {
    
    
    
    lazy var newFrame = ""
    
    
    
    
    //MARK: - UI Objects
    private let myLbl: UILabel = {
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
        btn.setTitle("Back", for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        btn.layer.borderWidth = 3
        btn.tintColor = .black
        btn.layer.borderColor = UIColor.black.cgColor
        btn.layer.cornerRadius = 15
        
        btn.addTarget(self, action: #selector(didPressedMyBtn), for: .touchUpInside)
        
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    
    
    private let myTable: UITableView = {
        let tableView = UITableView()
        //tableView.backgroundColor = .clear
        tableView.register(MyTableCell.self, forCellReuseIdentifier: MyTableCell.indetefier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    
    
    
    //MARK: - Actions
    @objc private func didPressedMyBtn() {
        dismiss(animated: true)
        
    }
    
    
    var myData: [String] = []
    
    
    //MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        // bg color
        view.backgroundColor = .white
        // add subviews
        addSubviews()
        // apply constraints
        applyConstraints()
        // apply delegate
        applyTableDelegates()
        
        
        myData = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "0"]
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }

    //MARK: - Add subviews
    private func addSubviews() {
        view.addSubview(myLbl)
        view.addSubview(myBtn)
        view.addSubview(myTable)
    }
    
    //MARK: - Apply constraints
    private func applyConstraints() {
        
        let myLblConstraints = [
            myLbl.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            myLbl.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ]
        
        
        let myBtnConstraints = [
            myBtn.centerXAnchor.constraint(equalTo: myLbl.centerXAnchor),
            myBtn.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30),
            myBtn.heightAnchor.constraint(equalToConstant: 50),
            myBtn.widthAnchor.constraint(equalToConstant: 200)
        ]
        
        let myTableConstraints = [
            myTable.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            myTable.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            myTable.bottomAnchor.constraint(equalTo: myBtn.topAnchor, constant: -10),
            myTable.topAnchor.constraint(equalTo: myLbl.bottomAnchor, constant: 20)
        ]
        
        NSLayoutConstraint.activate(myLblConstraints)
        NSLayoutConstraint.activate(myBtnConstraints)
        NSLayoutConstraint.activate(myTableConstraints)
        
    }
    
    
}



extension SecondVC: UITableViewDelegate, UITableViewDataSource {
    
    private func applyTableDelegates() {
        myTable.delegate = self
        myTable.dataSource = self
    }
        
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myData.count
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MyTableCell.indetefier) as? MyTableCell else { return UITableViewCell() }
        
        
        
        cell.configure(with: myData[indexPath.row])
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        guard let cell = tableView.cellForRow(at: indexPath) as? MyTableCell else { return }
        
        cell.changeTitle()
    }
    
}






struct MyViewControllerWrapper: UIViewControllerRepresentable {
    typealias UIViewControllerType = MyVC // Replace with the actual UIViewController subclass you want to use

    func makeUIViewController(context: Context) -> MyVC {
        return MyVC() // Instantiate Controller here
    }

    func updateUIViewController(_ uiViewController: MyVC, context: Context) {
        //update your UIViewController if needed
    }
}
