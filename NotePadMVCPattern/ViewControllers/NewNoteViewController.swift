//
//  ViewController.swift
//  NotePadMVCPattern
//
//  Created by Masaie on 21/7/22.
//

import UIKit

class NewNoteViewController: UIViewController {

    
    @IBOutlet var noteTitle: UINavigationItem!
    @IBOutlet var body: UITextView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    
//    @IBAction func unwindSegue(segue: )
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let mainTVC = segue.destination as? NotesListTableViewController else { return }
        mainTVC.notesList.append(Note(title: "New Note", body: body.text))
    }


    

}

