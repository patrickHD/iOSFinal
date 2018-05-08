//
//  NotesViewController.swift
//  NoteManager
//
//  Created by Pat on 4/26/18. I can only assume this works since my 2012 mbp is refusing to render tables in the simulator
//  Copyright © 2018 Mizzou. All rights reserved.
//

import UIKit

class NotesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var notesTableView: UITableView!
    let notes = NoteJSONLoader.load(fileName: "field_observations")
    let dateFormatter = DateFormatter()
    override func viewDidLoad() {
        super.viewDidLoad()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .medium
        self.title = "Notes"
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "noteCell", for: indexPath)
        
        if let cell = cell as? NotesTableViewCell {
            let note = notes[indexPath.row]
            cell.previewLabel.text = note.content
            cell.titleLabel.text = note.title
            cell.dateLabel.text = dateFormatter.string(from: note.date)
        }
        return cell
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? NotesItemViewController,
            let row = notesTableView.indexPathForSelectedRow?.row{
            destination.note = notes[row]
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
