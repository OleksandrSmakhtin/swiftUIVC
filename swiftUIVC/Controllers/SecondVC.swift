//
//  SecondVC.swift
//  swiftUIVC
//
//  Created by Oleksandr Smakhtin on 21/08/2023.
//

import UIKit

class SecondVC: UIViewController {

    //MARK: - Data
    private var myData: [String] = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "0"]
         
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


//MARK: - UITableViewDelegate & DataSource
extension SecondVC: UITableViewDelegate, UITableViewDataSource {
    // delegates
    private func applyTableDelegates() {
        myTable.delegate = self
        myTable.dataSource = self
    }
        
    // numbers of rows
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myData.count
    }
    
    // height for row
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    // cell for row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MyTableCell.indetefier) as? MyTableCell else { return UITableViewCell() }
        
        cell.configure(with: myData[indexPath.row])
        return cell
    }
    
    // did select row
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        guard let cell = tableView.cellForRow(at: indexPath) as? MyTableCell else { return }
        
        NotificationManager.shared.didPressCell(with: myData[indexPath.row])
        
        cell.changeTitle()
    }
    
    // commit
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            NotificationManager.shared.didDeleteCell(with: myData[indexPath.row])
            myData.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else {
            
        }
    }
    
}
