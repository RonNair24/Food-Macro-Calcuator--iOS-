//
//  ViewController.swift
//  Macro Calculator
//
//  Created by Ron Nair on 29/05/17.
//  Copyright © 2017 Ron Nair. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UIPickerViewDataSource, UIPickerViewDelegate {
    @IBOutlet weak var totalCaloriesLabel: UILabel!
    

//************** Declaring Variables start
    
    @IBOutlet weak var totalCarbsLabel: UILabel!
    //label for totalCarbs
    
    @IBOutlet weak var totalFatsLabel: UILabel!
    //label for totalFats
    
    @IBOutlet weak var totalProteinLabel: UILabel!
    //label for totalProtein
    
    @IBOutlet weak var weight: UITextField!
    //text field for weight
    
    @IBOutlet weak var carbsPickerView: UIPickerView!
    //pickerView for Carbs
    
    
    @IBOutlet weak var proteinPickerView: UIPickerView!
    //pickerView for Protein
    
    
    @IBOutlet weak var fatsPickerView: UIPickerView!
    //pickerView for Fats
    
    
    var carbsVal = 0.0
    var proteinVal = 1.50
    var fatsVal = 0.50
    //variables for carbs, fats, protein that are assigned from picker value row
    
    var carbsRow = 0
    var proteinRow = 0
    var fatsRow = 0
    //variables to assign picker value row
    
    
//************** Declaring Variables end
    
    
    
//************** Declaring Arrays start
    
    var carbs = ["0", "0.25", "0.50", "0.75", "1.0", "1.25", "1.50", "1.75", "2.0", "2.5", "3.0"]
    //array for values in carbsPickerView
    
    
    var protein = ["1.5","2.0"]
    //array for values in proteinPickerView
    
    var fats = ["0.5", "0.4"]
    //array for values in fatsPickerView
    
    
//************** Declaring Arrays end
    
  
    
//pickerView functions start
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
        //how many components in our picker view, only 1.
    }
 

 
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        //function for number of rows in component for pickerView
        
        if pickerView == carbsPickerView {
            
            return carbs.count
        }
        
        else if pickerView == proteinPickerView {
            
            return protein.count
        }
        
        else {
            return fats.count
        }
        
    }
    
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
      //function to populate pickerView with data from array
        
        if pickerView == carbsPickerView {
            
            return carbs[row]
        }
            
        else if pickerView == proteinPickerView {
            
            return protein[row]
        }
            
        else {
            return fats[row]
        }
        
        
    }
    
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        //function to check what row is selected
        
        if pickerView == carbsPickerView {
            //if statement to check carbsPickerView row and assign value to carbsVal
            
            carbsRow = row
            
            
            if carbsRow == 0 {
                carbsVal = 0.0
            }
            else if carbsRow == 1 {
                carbsVal = 0.25
            }
            else if carbsRow == 2 {
                carbsVal = 0.50
            }
            else if carbsRow == 3 {
                carbsVal = 0.75
            }
            else if carbsRow == 4 {
                carbsVal = 1.0
            }
            else if carbsRow == 5 {
                carbsVal = 1.25
            }
            else if carbsRow == 6 {
                carbsVal = 1.50
            }
            else if carbsRow == 7 {
                carbsVal = 1.75
            }
            else if carbsRow == 8 {
                carbsVal = 2.0
            }
            else if carbsRow == 9 {
                carbsVal = 2.5
            }
            else if carbsRow == 10 {
                carbsVal = 3.0
            }



            
        }
        
        if pickerView == proteinPickerView {
            //if statement to check proteinPickerView row and assign value to proteinVal
            
            proteinRow = row
            
            if proteinRow == 0 {
                proteinVal = 1.50
            }
            else if proteinRow == 1 {
                proteinVal = 2.0
            }
            
        }
        
        if pickerView == fatsPickerView {
            //if statement to check fatsPickerView row and assign value to fatsVal
            
            fatsRow = row
            
            if fatsRow == 0 {
                fatsVal = 0.50
            }
            else if fatsRow == 1 {
                fatsVal = 0.40
            }
        }
        
    }
    
//pickerView functions ends
    

//Calculate button starts
    
    @IBAction func calculatePress(_ sender: Any) {
        
        
        self.view.endEditing(true)
        //hides keyboard onces button is pressed
        
        
        if (weight.text?.isEmpty)! {
            return
        }
        //if statement that tests for null entry
        
        
        let weightInput = Double(weight.text!)! * 2.20
        //convert weight input UITextField from String to Double
        //Also converts from Kgs to Pounds, note: 1 kg = 2.20 lbs

        
        totalCarbsLabel.text = "Total Carbs: \(Double(weightInput * carbsVal)) g"
        totalProteinLabel.text = "Total Protein: \(Double(weightInput * proteinVal)) g"
        totalFatsLabel.text = "Total Fats: \(Double(weightInput * fatsVal)) g"
        totalCaloriesLabel.text  = "Total Calories: \(Double(weightInput * carbsVal) * 4 + Double(weightInput * proteinVal) * 4 + Double(weightInput * fatsVal) * 9) cals"
        //calculates macros based on weight and assigns to their respected labels
        
        
            //*** Uncomment if you need to test raw values of pickerViews
        
//        totalCarbsLabel.text = "Total Carbs: \(carbsVal) and testing weight \(weightInput) "
//        totalProteinLabel.text = "Total Protein: \(proteinVal)"
//        totalFatsLabel.text = "Total Fats: \(fatsVal)"
        
        
    }
    
//Calculate button ends
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib. 
        
        self.weight.delegate = self
        //delegate for textfield weight
     
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //Hide keyboard when user touches outside keyboard
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    //Hide keyboard when user touches return key
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return(true)
        
    }


}

