//
//  SideMenuViewController.swift
//  RandomNumberGenerate
//
//  Created by Neel  on 02/02/24.
//

import UIKit

class SideMenuViewController: UIViewController {
    var Names = ["ABOUT THE APP","UNLOCK All FEATURES","TELL FRIENDS","CONTACT US","STAY TUNED","PRIVACY POLICY"]
    var textfeildText = ""
    @IBOutlet weak var sideMenuCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func closeButtonAction(_ sender: Any) {
        storyboard?.instantiateViewController(identifier: "SideMenuViewController")
        as! SideMenuViewController
        navigationController?.popViewController(animated: false)
    }
    @IBAction func settingbuttonaction(_ sender: Any) {
        let alert = UIAlertController(title: "Setting", message: "", preferredStyle: UIAlertController.Style.alert)
        
        alert.addAction(UIAlertAction(title: "Default Min : 0 ", style: .default,handler: { (_) in
            self.showAlert()
        }
                                     )
        )
        alert.addAction(UIAlertAction(title: "Default Max : 10", style: .default, handler: { (_) in
            self.showAlert2()
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .destructive, handler: nil))
        self.present(alert, animated: true)
    }
}
extension SideMenuViewController : UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Names.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = sideMenuCollectionView.dequeueReusableCell(withReuseIdentifier: "cell", for:
                                                                indexPath) as! SideMenuCollectionViewCell
        if (indexPath.row == 0){
            cell.backgroundColor = UIColor(red: 37/255, green: 69/255, blue: 98/255, alpha: 1)
        } else if (indexPath.row == 1)
        {
            cell.backgroundColor = UIColor(red: 51/255, green: 84/255, blue: 113/255, alpha: 1)
        }
        else if (indexPath.row == 2)
        {
            cell.backgroundColor = UIColor(red: 37/255, green: 69/255, blue: 98/255, alpha: 1)
        }
        else if (indexPath.row == 3)
        {
            cell.backgroundColor = UIColor(red: 51/255, green: 84/255, blue: 113/255, alpha: 1)
        }else if (indexPath.row == 4)
        {
            cell.backgroundColor = UIColor(red: 37/255, green: 69/255, blue: 98/255, alpha: 1)
        }else if (indexPath.row == 5)
        {
            cell.backgroundColor = UIColor(red: 51/255, green: 84/255, blue: 113/255, alpha: 1)
        }
        cell.detailsLabel.text = Names[indexPath.row]
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width, height: 120)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if (indexPath.row == 0)
        {
            let alert = UIAlertController(title: "ABOUT THE APP", message: "Welcome to the Random Number Generator. This App is Created To Help You in Generating Random Numbers. \n \n Thanks For Using Our App", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        if (indexPath.row == 4)
        {
            let alert = UIAlertController(title: "Stay Tuned", message: "", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Instagram", style: UIAlertAction.Style.default, handler: nil))
            alert.addAction(UIAlertAction(title: "TikTok", style: UIAlertAction.Style.default, handler: nil))
            alert.addAction(UIAlertAction(title: "Enjoy Useful Apps", style: UIAlertAction.Style.default, handler: nil))
            alert.addAction(UIAlertAction(title: "Close", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        if (indexPath.row == 5)
        {
            let alert = UIAlertController(title: "PRIVACY POLICY", message: "Last Modified: Apr 14 2021 \n \n This Privacy Policy has been compiled to better serve those who are concerned with how their Information, data and content is being used inside our Random Number Generator iOS app(The App, App). Please read our Privacy Policy carefully to get a clear understanding of how we collect, use, protect or otherwise handle your Information in accordance with our app. This Privacy Policy does not apply to the third-party online/mobile store from which you install the Application or make payments, which may also collect and use data about you. We are not responsible for any of the data collected by any such third party. \n \n Information Gathering and Usage \n \n We may collect your email address ONLY if you opt-in to our mailing list or write an email to us. The app can collect aggregated, anonymous user data regarding app usage (also via third-party services). We may use information collected about you via the Application to: Compile anonymous statistical data and analysis for use internally or with third parties; Deliver targeted advertising, coupons, newsletters, and other information regarding promotions and the Application to you; Fulfil and manage purchases, orders, payments, and other transactions related to the Application, Increase the efficiency and operation of the Application; Monitor and analyse usage and trends to improve your experience with the Application, Notify you of updates to the Application; Offer new products, services, mobile application, and/or recommendations to you; Request feedback and contact you about your use of the Application; Resolve disputes and troubleshoot problems, Respond to product and customer service requests; Send you a newsletter. We can also collect data regarding App usage, like data about crashes, the number of users, popular sections, activities in the App, etc. This data is never personally identifiable. WE CAN NOT ACCESS OR COLLECT YOUR CONTENT. Unless you contact us for support or subscribe to our mailing list we don't know who you are. \n \n Third-Paty Links \n \n The app can contain third party links inside the app or ads. We, therefore, have no responsibility or liability for the content and activities of these linked resources. \n \n App Purchases \n \n The App can contain In-App Purchases and Subscriptions. \n \n Push Notifications \n \n We may request to send you push-notifications. If you wish to opt-out from receiving these types of communications, you may turn them off in your device settings. \n \n Use of App Analytics Services and third party Software \n \n Content Backups and Possible Content Loss cases \n \n There are no backups for your Content in our App. When you create your Content, it is created and stored on your device. The application is designed to minimise possible Content data loss, but we do not exclude that, when using the application, there can be cases of partial or complete Content data loss. \n \n Tracking and Advertising \n \n We may use third-party software to serve ads on the Application, implement email marketing campaigns, and manage other interactive marketing initiatives. This third-party software may use cookies or similar tracking technology to help manage and optimise your online experience with us. \n \n Recommendations and Disclaimer (Content) \n \n DEVELOPERS and APP CREATORS DO NOT RECOMMEND storing particularly valuable information or any other valuable information in the App, since this data (Content) cannot be recovered if it is lost. If you store valuable information, you store it at your own risk. Using our app YOU AGREE that developer and App creator IS NOT RESPONSIBLE for the loss of your Content. Developer and App creator is not legally responsible for the risks and any damages associated with the loss of your Content. \n \n Changes \n \n This Privacy Policy can be changed without prior written notice at any time. We will update the Last Modified date above. Please check Privacy Policy inside the Menu periodically to check changes.If there are any questions regarding this privacy policy, you may contact us at info@adelmaer.com ", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func showAlert() {
        let alertController = UIAlertController(title: "Min", message: "Enter The Minimum Value", preferredStyle: .alert)
        alertController.addTextField { (textField) in
            textField.placeholder = ""
            textField.keyboardType = .numberPad
        }
        let okAction = UIAlertAction(title: "OK", style: .default) { [weak self] (_) in
            if let textField = alertController.textFields?.first {
                print("Entered text: \(textField.text ?? "")")
                self?.textfeildText = textField.text ?? ""
            }
        }
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
    func showAlert2() {
        let alertController = UIAlertController(title: "Max", message: "Enter The Maximum Value", preferredStyle: .alert)
        alertController.addTextField { (textField) in
            textField.placeholder = ""
            textField.keyboardType = .numberPad
        }
        let okAction = UIAlertAction(title: "OK", style: .default) { [weak self] (_) in
            if let textField = alertController.textFields?.first {
                print("Entered text: \(textField.text ?? "")")
                self?.textfeildText = textField.text ?? ""
            }
        }
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
}



