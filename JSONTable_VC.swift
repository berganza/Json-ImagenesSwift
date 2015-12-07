//
//  JSONTable_VC.swift
//  EjemploJSON
//
//  Created by Berganza on 1/11/15.
//  Copyright © 2015 Berganza. All rights reserved.
//

import UIKit

class JSONTable_VC: UITableViewController {
    
    var cursosllberganza = [NSDictionary]()

    override func viewDidLoad() {
        super.viewDidLoad()
        let direccion = "http://llberganza.com/Ejercicios/JSON&IMAGENES/ejemplo.json"               // Servidor
        //let direccion = "https://dl.dropboxusercontent.com/u/26059707/EJEMPLO_JSON/ejemplo.json"  // Dropbox
        let urlSession = NSURLSession.sharedSession()
        let url: NSURL = NSURL(string: direccion)!
        
        let task = urlSession.dataTaskWithURL(url) {
            (data, response, error) -> Void in
            do {
                let jsonData = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers)
                //let listadoCursos = jsonData
                self.cursosllberganza = (jsonData as? [NSDictionary])!
            } catch _ {
                // Error
            }
            self.tableView.reloadData()
        }
        task.resume()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.cursosllberganza.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Celda", forIndexPath: indexPath) as! disenoCelda
        
        cell.tituloCelda.text = self.cursosllberganza[indexPath.row]["curso"] as? String
        cell.subtituloCelda.text = self.cursosllberganza[indexPath.row]["profesor"] as? String
        
        // Tratar fotos
        cell.imagenCelda.image = UIImage(named: "nophoto");
        
        // Trabajar con hilos
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), {
            let imageData = NSData(contentsOfURL: NSURL(string: self.cursosllberganza[indexPath.row]["imagen"] as! String)!)
            dispatch_async(dispatch_get_main_queue(), {
                if(imageData != nil){
                    cell.imagenCelda.image = UIImage(data: imageData!)
                }
            })
        })
        
        cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator

        return cell
    }
}
    


