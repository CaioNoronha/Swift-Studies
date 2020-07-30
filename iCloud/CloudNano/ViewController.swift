//
//  ViewController.swift
//  CloudNano
//
//  Created by Caio Carvalho de Noronha on 28/10/19.
//  Copyright © 2019 caivis. All rights reserved.
//

import UIKit
import CloudKit

class ViewController: UIViewController {
    
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    let container  =  CKContainer(identifier: "iCloud.Caio-Nano")
    var titles = [String]()
    var recordIDs = [CKRecord.ID]()
    
    @IBAction func saveButton(_ sender: Any) {
        let privateDatabase = container.publicCloudDatabase
        
        let title = textField.text!
        
        let record = CKRecord(recordType: "Note")
        
        record.setValue(title, forKey: "name")
        
        privateDatabase.save(record) { (savedRecord, error) in
            
            if error == nil {
                
                print("Record Saved")
                
            } else {
                print(error)
                print("Record Not Saved")
                
            }
            
        }
    }
    
    @IBAction func retrieveButton(_ sender: Any) {
        let privateDatabase = container.publicCloudDatabase
        
        let predicate = NSPredicate(value: true)
        
        let query = CKQuery(recordType: "Note", predicate: predicate)
        query.sortDescriptors = [NSSortDescriptor(key: "modificationDate", ascending: false)]
        
        let operation = CKQueryOperation(query: query)
        
        titles.removeAll()
        recordIDs.removeAll()
        
        operation.recordFetchedBlock = { record in
            
            self.titles.append(record["name"]!)
            self.recordIDs.append(record.recordID)
            
        }
        
        operation.queryCompletionBlock = { cursor, error in
            
            DispatchQueue.main.async {
                
                print("Titles: \(self.titles)")
                print("RecordIDs: \(self.recordIDs)")
                
            }
            
        }
        
        privateDatabase.add(operation)
    }
    
    @IBAction func updateButton(_ sender: Any) {
        let privateDatabase = container.publicCloudDatabase
        
        let newTitle = "Anything But The Old Title"
        
        let recordID = recordIDs.first!
        
        privateDatabase.fetch(withRecordID: recordID) { (record, error) in
            
            if error == nil {
                
                record?.setValue(newTitle, forKey: "name")
                
                privateDatabase.save(record!, completionHandler: { (newRecord, error) in
                    
                    if error == nil {
                        
                        print("Record Saved")
                        
                    } else {
                        
                        print("Record Not Saved")
                        
                    }
                    
                })
                
            } else {
                
                print("Could not fetch record")
                
            }
            
        }
    }
    @IBAction func deleteButton(_ sender: Any) {
        
        let privateDatabase = container.publicCloudDatabase
        
        let recordID = recordIDs.first!
        
        privateDatabase.delete(withRecordID: recordID) { (deletedRecordID, error) in
            
            if error == nil {
                
                print("Record Deleted")
                
            } else {
                
                print("Record Not Deleted")
                
            }
            
        }
        
    }
}



