//
//  TaskViewController.swift
//  Tasks
//
//  Created by Jasmine Tan on 7/23/18.
//  Copyright © 2018 Jasmine Tan. All rights reserved.
//

import UIKit
import CoreData

class TaskViewController: UITableViewController {
    let dateFormatter = DateFormatter()
    var tasks = [Tasks]()
    
    @IBOutlet var taskTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    override func viewWillAppear(_ animated: Bool) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else{
            return
        }
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest: NSFetchRequest<Tasks> = Tasks.fetchRequest()
        do{
            tasks = try managedContext.fetch(fetchRequest)
            taskTableView.reloadData()
        } catch{
            print("Fetch could not be performed")
        }
    }

    @IBAction func addNewTask(_ sender: Any) {
        let alert = UIAlertController(title: "Task", message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        alert.addTextField(configurationHandler: { textField in
            textField.placeholder = "Enter Task Name"
        })
        alert.addTextField(configurationHandler: { textField in
            textField.placeholder = "Enter Description"
        })
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
            
            if let title = alert.textFields?.first?.text, let description = alert.textFields?.last?.text {
                if let newTask = Tasks(task: title, text: description){
                    do {
                        let managedContext = newTask.managedObjectContext
                        try managedContext?.save()
                        self.tasks.append(newTask)
                        self.tableView.reloadData()
                    } catch {
                        print("Error")
                        alert.dismiss(animated: true, completion: nil)
                    }
                    
                }
            }
        }))
        
        self.present(alert, animated: true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return tasks.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "taskCell", for: indexPath) as! TasksTableViewCell
        
        cell.titleLabel.text = tasks[indexPath.row].task
        cell.subtitleLabel.text = tasks[indexPath.row].text
        
        return cell
    }

    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {return}
        if editingStyle == .delete {
            let managedContext = appDelegate.persistentContainer.viewContext
            managedContext.delete(tasks[indexPath.row])
            do {
                try managedContext.save()
            } catch {
                print("Couldn't save it")
            }
            tasks.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
    }
    }

}
