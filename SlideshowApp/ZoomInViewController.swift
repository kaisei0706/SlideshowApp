//
//  ZoomInViewController.swift
//  SlideshowApp
//
//  Created by 岩田海靖 on 2020/07/17.
//  Copyright © 2020 kaisei.iwata. All rights reserved.
//

import UIKit

class ZoomInViewController: UIViewController {
    

    @IBOutlet weak var imageView: UIImageView!
    var selectedImg: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        imageView.image = selectedImg
    }
    @IBAction func backbtn(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
