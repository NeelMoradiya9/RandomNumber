//
//  ViewController.swift
//  RandomNumberGenerate
//
//  Created by Neel  on 02/02/24.
//

import UIKit

class MainPageViewController: UIViewController {
     
     //MARK: - Variables
     var isActive = false
     var isActive2 = false
     let db = DBHelper()
     var arrRandomNumber : [Int] = []
     var sequenceArray : [Int] = []
     var sequence = 0
     var generatedSequence = ""
     var minValue = 1
     var maxValue = 20
     var name1 = ""
     var nameSequence = String()
     var updatedMinvalue = Int()
     var defaultMinValue = 0
     var defaultMaxValue = 20
     var defaultname = "Sequence : 1"
     var valueArr = [User]()
     var item = [User2]()
     var isList = true
     var cellSize: CGSize = CGSize(width: UIScreen.main.bounds.width, height: 100)
     var arr2 = [""]
     //MARK: - IBOutlets
     @IBOutlet weak var unlockAllBtn: UIButton!
     @IBOutlet weak var newSequence: UILabel!
     @IBOutlet weak var homePageCollectionView: UICollectionView!
     @IBOutlet weak var changeButtonIcon: UIButton!
     @IBOutlet weak var settingBtnIcon: UIButton!
     @IBOutlet weak var generateAllBtn: UIButton!
     override func viewDidLoad() {
          super.viewDidLoad()
          let value2 = db.read()
          
          let arr = stringToArr(str: value2[0].sequence)
          
          let value = db.read2()
          for i in value {
               arrRandomNumber.append(i.randomNumber)
               sequenceArray.append(i.number)
               self.sequence += 1
          }
          homePageCollectionView.reloadData()
          homePageCollectionView.isHidden = true
          newSequence.isHidden = false
          generateAllBtn.isHidden = true
          unlockAllBtn.layer.cornerRadius = 10
          generateAllBtn.layer.cornerRadius = 10
          let longPress = UILongPressGestureRecognizer(
               target: self,
               action: #selector(handleLongGesture)
          )
          homePageCollectionView.addGestureRecognizer(longPress )
     }
     func stringToArr(str: String) -> [String] {
          var arr = [String]()
          let values = str.components(separatedBy: " ")
          arr.append(contentsOf: values)
          return arr
     }
     //MARK: - IBActions
     @objc func handleLongGesture(gesture: UILongPressGestureRecognizer) {
          switch(gesture.state) {
               
          case .began:
               guard let selectedIndexPath = homePageCollectionView.indexPathForItem(at: gesture.location(in: homePageCollectionView)) else {
                    break
               }
               homePageCollectionView.beginInteractiveMovementForItem(at: selectedIndexPath)
          case .changed:
               homePageCollectionView.updateInteractiveMovementTargetPosition(gesture.location(in: gesture.view!))
          case .ended:
               homePageCollectionView.endInteractiveMovement()
          default:
               homePageCollectionView.cancelInteractiveMovement()
          }
     }
     @IBAction func generateAllBtnAct(_ sender: Any) {
          self.sequence = 0
          arrRandomNumber.removeAll()
          for number in minValue...maxValue {
               arrRandomNumber.append(number)
               arrRandomNumber.shuffle()
               sequenceArray.append(number)
               self.sequence += 1
          }
          self.insertValues()
          homePageCollectionView.isHidden = false
          newSequence.isHidden = true
          unlockAllBtn.isHidden = true
     }
     
     private func insertValues(){
          for (i, v) in arrRandomNumber.enumerated() {
               self.db.insert2(key: UUID().uuidString, randomNumber: "\(self.arrRandomNumber[i])", number: "\(sequence)")
               self.homePageCollectionView.reloadData()
          }
     }
     @IBAction func settingBtn(_ sender: UIButton) {
          action()
          func action(){
               if isActive2 {
                    isActive2 = false
                    settingBtnIcon.setImage(UIImage(systemName: "gear"), for: .normal)
                    generateAllBtn.isHidden = true
               } else {
                    isActive2 = true
                    settingBtnIcon.setImage(UIImage(systemName: "gearshape.2"), for: .normal)
                    generateAllBtn.isHidden = false
               }
          }
          
     }
     @IBAction func buttonTapped(_ sender: Any) {
          UIView.transition(with: changeButtonIcon, duration: 0.2, options: .transitionCrossDissolve, animations: {
               action()
          }, completion: nil)
          
          func action(){
               if isActive {
                    isActive = false
                    changeButtonIcon.setImage(UIImage(systemName: "square.stack"), for: .normal)
                    UIView.transition(with: homePageCollectionView, duration: 0.2, options: .transitionCrossDissolve, animations:  {
                         self.homePageCollectionView.isHidden = false
                    }, completion: nil)
                    UIView.transition(with: homePageCollectionView, duration: 0.2, options: .transitionCrossDissolve, animations: {
                         self.newSequence.isHidden = true
                    }, completion: nil)
                    UIView.transition(with: homePageCollectionView, duration: 0.5, options: .transitionCrossDissolve, animations: {
                         self.cellSize = CGSize(width: UIScreen.main.bounds.width, height: 120)
                         self.homePageCollectionView.reloadData()
                    }, completion: nil)
                    isList = true
               } else {
                    isActive = true
                    changeButtonIcon.setImage(UIImage(systemName: "square.stack.3d.up"), for: .normal)
                    UIView.transition(with: homePageCollectionView, duration: 0.2, options: .transitionCrossDissolve, animations: {
                    }, completion: nil)
                    UIView.transition(with: homePageCollectionView, duration: 0.2, options: .transitionCrossDissolve, animations: {
                         self.newSequence.isHidden = true
                    }, completion: nil)
                    UIView.transition(with: homePageCollectionView, duration: 0.5, options: .transitionCrossDissolve, animations: {
                         self.cellSize = CGSize(width: 120, height: 120)
                         self.homePageCollectionView.reloadData()
                    }, completion: nil)
                    self.isList = false
               }
          }
     }
     @IBAction func addSequenceButton(_ sender: Any) {
          isActive = false
          UIView.transition(with: homePageCollectionView, duration: 0.5, options: .transitionCrossDissolve, animations: {
               self.homePageCollectionView.isHidden = false
               self.newSequence.isHidden = true
               self.unlockAllBtn.isHidden = true
          }, completion: nil)
          valueArr = db.read()
          if valueArr.count == 0 {
               db.insert(minimum: "0", maximum: "20", sequence: generatedSequence)
               print("Default data added")
          } else {
               for i in valueArr {
                    print("value \(i.Maximum)")
               }
          }
          alert()
     }
     @IBAction func sideMenuAction(_ sender: Any) {
          let a = storyboard?.instantiateViewController(identifier: "SideMenuViewController")
          as! SideMenuViewController
          navigationController?.pushViewController(a, animated: false)
     }
     //MARK: - Alerts
     
     func alert(){
          let alert = UIAlertController(title: "New Sequence Of Numbers", message: "", preferredStyle: UIAlertController.Style.alert)
          
          alert.addAction(UIAlertAction(title: "Default Min : \(minValue)", style: .default,handler: { [self] (_) in
               self.showAlert()
          }
                                       )
          )
          alert.addAction(UIAlertAction(title: "Default Max :  \(maxValue)", style: .default, handler: { (_) in
               self.showAlert2()
          }
                                       )
          )
          
          alert.addAction(UIAlertAction(title: "Create", style: .default, handler: { [self] (_) in
               let AddedItem = Int.random(in: (Int(minValue))...(Int(maxValue)))
               self.arrRandomNumber.append(AddedItem)
               self.sequence += 1
               self.sequenceArray.append(self.sequence)
               db.insert2(key: UUID().uuidString, randomNumber: "\(AddedItem)", number: "\(sequence)")
               self.homePageCollectionView.reloadData()
          }))
          self.present(alert, animated: true)
     }
     func showAlert() {
          let alertController = UIAlertController(title: "Min", message: "Enter The Minimum Value", preferredStyle: .alert)
          showAlertForValue(placeholder: "Enter Minimum Value") { value in
               self.minValue = value
          }
     }
     func showAlertForValue(placeholder: String, completion: @escaping (Int) -> Void) {
          let alertController = UIAlertController(title: placeholder, message: nil, preferredStyle: .alert)
          alertController.addTextField { (textField) in
               textField.placeholder = placeholder
               textField.keyboardType = .numberPad
          }
          let okAction = UIAlertAction(title: "OK", style: .default) { [self] (_) in
               if let textField = alertController.textFields?.first {
                    print("Entered text: \(textField.text ?? "")")
                    let value = self.db.read()
                    print(value)
                    if let textField = textField.text {
                         minValue = Int(textField) ?? 1
                         if minValue == 1 {
                              db.insert(minimum: "\(minValue)", maximum: "\(maxValue)", sequence: generatedSequence)
                         } else {
                              db.updateValue(Minimum: "\(minValue)", Maximum: "\(maxValue)", sequence: generatedSequence)
                              print("123")
                         }
                         for i in textField{
                              alert()
                         }
                    }
               }
          }
          alertController.addAction(okAction)
          present(alertController, animated: true, completion: nil)
     }
     
     func showAlert2() {
          let alertController = UIAlertController(title: "Max", message: "Enter The Maximum Value", preferredStyle: .alert)
          showAlert(placeholder: "Enter Maximum Value") { value in
               self.maxValue = value
          }
     }
     func showAlert(placeholder: String, completion: @escaping (Int) -> Void) {
          let alertController1 = UIAlertController(title: placeholder, message: nil, preferredStyle: .alert)
          alertController1.addTextField { (textField1) in
               textField1.placeholder = placeholder
               textField1.keyboardType = .numberPad
          }
          let okAction = UIAlertAction(title: "OK", style: .default) {[self] (_) in
               if let textField1 = alertController1.textFields?.first {
                    print("Entered text: \(textField1.text ?? "")")
                    let value1 = self.db.read()
                    print(value1)
                    if let textField = textField1.text {
                         self.maxValue = Int(textField) ?? 20
                         if minValue == 20 {
                              db.insert(minimum: "\(minValue)", maximum: "\(maxValue)", sequence: generatedSequence)
                         } else {
                              db.updateValue(Minimum: "\(minValue)", Maximum: "\(maxValue)", sequence: generatedSequence)
                              print("321")
                         }
                         for i in textField{
                              self.alert()
                         }
                    }
               }
          }
          alertController1.addAction(okAction)
          present(alertController1, animated: true, completion: nil)
     }
}
//MARK: extension
extension MainPageViewController : UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout{
     
     func collectionView(_ collectionView: UICollectionView, canMoveItemAt indexPath: IndexPath) -> Bool {
          return true
     }
     func collectionView(_ collectionView: UICollectionView, moveItemAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath){
          let item = arrRandomNumber.remove(at: sourceIndexPath.item)
          arrRandomNumber.insert(item, at: destinationIndexPath.item)
//          db.updateValue2(randomNumber: arrRandomNumber)
//          homePageCollectionView.reloadData()
     }
     func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
          return arrRandomNumber.count
     }
     func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
          let cell = homePageCollectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! MainPageCollectionViewCell
          let randomNumber = arrRandomNumber.reversed()[indexPath.row]
          cell.generatedNumberLabelOutlet.text = "\(randomNumber)"
          cell.mysequenceLabelOutlet.text = "Sequence : \(sequenceArray.reversed()[indexPath.row])"
          print("Sequence : \(sequenceArray.reversed()[indexPath.row])")
          cell.sequencelabelOutlet.text = generatedSequence
          cell.boxSequencelabeloutlet2.text = "\(sequenceArray.reversed()[indexPath.row])"
          if isList == true {
               cell.mysequenceLabelOutlet.isHidden = false
               cell.boxSequencelabeloutlet2.isHidden = true
          } else {
               cell.mysequenceLabelOutlet.isHidden = true
               cell.boxSequencelabeloutlet2.isHidden = false
          }
          return cell
     }
     func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
          return cellSize
     }
     func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
           navigation(generatedNumbers: arrRandomNumber.reversed()[indexPath.row], sequencelabel: sequenceArray.reversed()[indexPath.row])
     }
     func navigation(generatedNumbers : Int , sequencelabel : Int){
          let a  = storyboard?.instantiateViewController(identifier: "GenerateSequenceViewController")as!
          GenerateSequenceViewController
          a.delegate = self
          a.numbers = generatedNumbers
          a.name = sequencelabel
          navigationController?.pushViewController(a, animated: true)
     }
}
extension MainPageViewController : DataPassing {
     func sequence(data: [Int]) {
          generatedSequence = ""
          arr2 = [""]
          for (index, value) in data.enumerated().reversed() {
               generatedSequence.append("\(data[index])")
               generatedSequence.append("   ")
               }
          self.homePageCollectionView.reloadData()
          let value2 = db.read()
          let arr = stringToArr(str: value2[0].sequence)
     }
}


