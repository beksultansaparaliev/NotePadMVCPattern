//
//  NoteDetailsViewController.swift
//  NotePadMVCPattern
//
//  Created by Masaie on 21/7/22.
//

import UIKit

class NoteDetailsViewController: UIViewController {

    
    @IBOutlet var notesNavigationItem: UINavigationItem!
    @IBOutlet var notesTextView: UITextView!
    
    var note: Note!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        notesTextView.text = note.body
        notesNavigationItem.title = note.title
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func doneButtonTapped(_ sender: UIBarButtonItem) {
        
    }
    
}
