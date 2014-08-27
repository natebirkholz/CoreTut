//
//  TaskDetailViewController.swift
//  CoreTut
//
//  Created by Nathan Birkholz on 8/25/14.
//  Copyright (c) 2014 Nathan Birkholz. All rights reserved.
//

import UIKit
import CoreData

class TaskDetailViewController: UIViewController {
    
    let managedObjectContext = (UIApplication.sharedApplication().delegate as AppDelegate).managedObjectContext
    var task: Tasks? = nil
    
    @IBOutlet var txtDesc: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if task != nil {
            txtDesc.text = task?.desc
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    func createTask() {
        let entityDescription = NSEntityDescription.entityForName("Tasks", inManagedObjectContext: managedObjectContext)
        let task = Tasks(entity: entityDescription, insertIntoManagedObjectContext: managedObjectContext)
        task.desc = txtDesc.text
        
        managedObjectContext?.save(nil)
    }
    
    func editTask() {
        task?.desc = txtDesc.text
        managedObjectContext?.save(nil)
    }

    @IBAction func done(sender: AnyObject) {
        if task != nil {
            editTask()
            
        } else {
            createTask()
            
        }
        
        dismissViewController()
    }

    @IBAction func cancel(sender: AnyObject) {
        dismissViewController()
    }
    
    func dismissViewController() {
        navigationController.popViewControllerAnimated(true)
    }
    
    
    
    
}
