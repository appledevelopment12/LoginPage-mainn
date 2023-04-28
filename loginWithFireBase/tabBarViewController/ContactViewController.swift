//
//  ContactViewController.swift
//  loginWithFireBase
//
//  Created by Rajeev on 27/04/23.
//



import UIKit
import Contacts
import ContactsUI



struct contactNamee
{
    let name:String

    
}

class ContactViewController: UIViewController,CNContactPickerDelegate, UITableViewDelegate,UITableViewDataSource
{
    
    @IBOutlet weak var contactTable: UITableView!
    var models = [contactNamee]()
    let store = CNContactStore()
    
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        let authorize = CNContactStore.authorizationStatus(for: .contacts)
        if authorize == .notDetermined
        {
            store.requestAccess(for: .contacts) { chk, error in
                if error == nil
                {
                    self.getContactList()
                }
            }
        }else if authorize == .authorized{
            getContactList()
        }
    }
    
    func getContactList()
    {
        
        let  predicate = CNContact.predicateForContactsInContainer(withIdentifier: store.defaultContainerIdentifier())
        let contactt = try! store.unifiedContacts(matching: predicate, keysToFetch: [CNContactBirthdayKey as CNKeyDescriptor,CNContactFamilyNameKey as CNKeyDescriptor,CNContactGivenNameKey as CNKeyDescriptor,CNContactPhoneNumbersKey as CNKeyDescriptor,CNContactDatesKey as CNKeyDescriptor])
        let dat = DateFormatter()
        dat.dateFormat  = "MM/dd/yyyy"
        
        
        
        for con in contactt {
            
            //  let contactPersonName = "Full name : \(con.givenName) \(con.familyName)"
            
            
            let model = contactNamee(name: con.givenName)
            models.append(model)
            contactTable.reloadData()
            if(con.birthday != nil)
            {
                let dobDt = Calendar.current.date(from: con.birthday!)
                print("Dob : \(dat.string(from: dobDt!))")
                
                //                        phonemodels.append(phonemodel)
                //                    }
            }
        }
        
        
        
        
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell",for: indexPath) as! ContactTableViewCell
        cell.namelbl.text = models[indexPath.row].name
        return cell
    }
}
