//
//  DisplayVC.swift
//  SingleValueStore_CoreData_iOS_UIKit
//
//  Created by Jogender Singh on 12/09/23.
//

import UIKit
import CoreData

class DisplayVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    // MARK: - IBOUTLETS
    @IBOutlet weak var myTableView: UITableView!
    
    // MARK: - PROPERTIES
    var students: [Student] = []
    
    // MARK: - VIEW LIFE CYCLE METHODS
    // TODO: VIEW DID LOAD
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
        myTableView.delegate = self
        myTableView.dataSource = self
    }
    
}



extension DisplayVC{
    
    // TODO: FETCH DATA
    func fetchData() {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let fetchRequest: NSFetchRequest<Student> = Student.fetchRequest()
        
        do {
            students = try context.fetch(fetchRequest)
            myTableView.reloadData()
        } catch {
            print("Error fetching student data: \(error)")
        }
    }
    
    // MARK: - TABLE VIEW METHODS
    // TODO: numberOfRowsInSection
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return students.count
    }
    
    // TODO: cellForRowAt
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myTableView.dequeueReusableCell(withIdentifier: "cell1", for: indexPath)
        
        let student = students[indexPath.row]
        cell.textLabel?.text = student.name
        
        return cell
    }
}
