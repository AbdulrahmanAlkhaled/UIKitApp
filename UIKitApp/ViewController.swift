//
//  ViewController.swift
//  UIKitApp
//
//  Created by ABDULRAHMAN AL-KHALED on 13/12/2023.
//

// MARK: - Assignment
// build three views in uikit with data

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var todosList = ["Read books", "workout", "travel"]

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.dataSource = self
        tableView.delegate = self
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        todosList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "todosList", for: indexPath)
        cell.textLabel?.text = todosList[indexPath.row]
        return cell
    }
    
    func tableView( _ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            todosList.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}
