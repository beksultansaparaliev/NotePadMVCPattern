//
//  NotesListTableViewController.swift
//  NotePadMVCPattern
//
//  Created by Masaie on 21/7/22.
//

import UIKit

class NotesListTableViewController: UITableViewController {
    
    var numberOfUserCreatedNotes = [Note]()
//    var numberOfUserCreatedNotes = 2

    private var notesList = Note.getNotes()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.leftBarButtonItem = editButtonItem
        tableView.rowHeight = 45
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            
            return notesList.count
        } else {
            return numberOfUserCreatedNotes.count
        }
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "note", for: indexPath)
        
        
        var content = cell.defaultContentConfiguration()
        content.text = notesList[indexPath.row].title
        content.secondaryText = notesList[indexPath.row].description
        
        
        cell.contentConfiguration = content
        
        
                
//        if indexPath.row == 0 {
//            cell.textLabel?.text = "Это шаблон первой заметки"
//        } else if indexPath.row == 1 {
//            cell.textLabel?.text = "Это шаблон второй заметки"
//        } else {
//            cell.textLabel?.text = "Это шаблон третьей заметки"
//        }

        return cell
    }
    
    @IBAction func unwindSegue(segue: UIStoryboardSegue) {
//        guard let newNotesVC = segue.source as? NewNoteViewController else { return }
//        let newNote = Note(title: newNotesVC.noteTitle.title ?? "Title", body: newNotesVC.body.text, description: newNotesVC.body.text)
//        notesList.append(newNote)
//        print(notesList.last?.body)
//        // ТУТ НАДО АПДЕЙТ СДЕЛАТЬ! Тейбл вью.
        
        
        
        
        guard let detailVC = segue.source as? NoteDetailsViewController else { return }
        
        guard let indexPath = tableView.indexPath else { return }
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        notesList[indexPath.row].body = detailVC.notesTextView.text
        
       
        

        let currentNote = Note(title: newNotesVC.noteTitle.title ?? "Title", body: newNotesVC.body.text, description: newNotesVC.body.text)
        notesList.append(newNote)
        print(notesList.last?.body)


    }
    

    
}

extension NotesListTableViewController {
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Pinned"
        } else {
            return "Notes"
        }
    }
    
    override func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        if section == 0 {
            return ""
        } else {
            return "footer"
        }
    }
    
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        <#code#>
//    }

    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        .none
    }
    
    override func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
        false
    }
    
    
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let track = notesList.remove(at: sourceIndexPath.row)
        notesList.insert(track, at: destinationIndexPath.row)
    }

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let noteDetailsVC = segue.destination as? NoteDetailsViewController else { return }
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        
        noteDetailsVC.note = notesList[indexPath.row]
        
        
        
        

    }
    
    
    

}
