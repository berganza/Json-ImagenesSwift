//
//  Detalle_VC.swift
//  EjemploJSON
//
//  Created by Luis Berganza on 7/12/15.
//  Copyright © 2015 Berganza. All rights reserved.
//

import UIKit

class Detalle_VC: UIViewController {
    
    
    @IBOutlet weak var subtituloLB: UILabel!
    
    @IBOutlet weak var textoDetalleTV: UITextView!
    
    @IBOutlet weak var firma: UILabel!
    
    var textoCelda = ""
    var textTV = ""
    var firmaProfesor = ""
    
    
    override func viewWillAppear(animated: Bool) {
        subtituloLB.text = textoCelda
        textoDetalleTV.text = textTV
        firma.text = firmaProfesor
    }
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
