//
//  ViewController.swift
//  BARQRCodeGenerator
//
//  Created by PASHA on 24/10/18.
//  Copyright © 2018 Pasha. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var codeSegment: UISegmentedControl!
  @IBOutlet weak var imageV: UIImageView!
  @IBOutlet weak var dataTF: UITextField!
  var filter :CIFilter!
  override func viewDidLoad() {
    super.viewDidLoad()
    codeSegment.selectedSegmentIndex = 0
    // Do any additional setup after loading the view, typically from a nib.
  }

  @IBAction func generateTap(_ sender: Any) {
    
    if let txt = dataTF.text {
      
      let data = txt.data(using: .ascii, allowLossyConversion: false)
      if codeSegment.selectedSegmentIndex == 0 {
        
        filter = CIFilter(name: "CIQRCodeGenerator")
      }
      else
      {
        filter = CIFilter(name: "CICode128BarcodeGenerator")

      }
      filter.setValue(data, forKey: "inputMessage")
      let transform = CGAffineTransform(scaleX: 10, y: 10)
      imageV.image = UIImage(ciImage: filter.outputImage!.transformed(by: transform))
      
    }
  }
  
}

