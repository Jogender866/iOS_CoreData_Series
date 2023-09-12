//
//  FormVC.swift
//  SingleValueStore_CoreData_iOS_UIKit
//
//  Created by Jogender Singh on 12/09/23.
//

import UIKit
import CoreData

class FormVC: UIViewController {
    
    // MARK: - IBOUTLETS
    @IBOutlet weak var nameTextField: UITextField!
    
    // MARK: - PROPERTIES
    // MARK: - VIEW LIFE CYCLE METHODS
    // TODO: VIEW DID LOAD
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // TODO: DEINIT
    deinit {
        print("ViewController DEINIT...!")
    }
    
    // MARK: - ACTIONS
    // TODO: SAVE BUTTON TAPPED
    @IBAction func SaveButton_Tapped(_ sender: UIButton) {
        guard let studentName = nameTextField.text, !studentName.isEmpty else {
            // Handle empty text field
            return
        }
        saveData(studentName: studentName)
        // Clear the text field after saving
        nameTextField.text = ""
    }
    
    
    
    // TODO: DISPLAY BUTTON TAPPED
    @IBAction func DisplayButton_Tapped(_ sender: UIButton) {
        if let DisplayVC = storyboard?.instantiateViewController(identifier: "DisplayVC") as? DisplayVC {
            navigationController?.pushViewController(DisplayVC, animated: true)
        }
    }
    
}



extension FormVC {
    // MARK: - CORE DATA METHODS
    // TODO: SAVE DATA
    func saveData(studentName: String) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let student = Student(context: context)
        student.name = studentName
        
        do {
            try context.save()
            print("Student data saved successfully.")
        } catch {
            print("Error saving student data: \(error)")
        }
    }
}
