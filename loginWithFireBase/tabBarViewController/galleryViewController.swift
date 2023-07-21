//
//  lastViewController.swift
//  loginWithFireBase
//
//  Created by Rajeev on 21/04/23.
//

import UIKit
import Firebase
import SwiftyJSON
import Kingfisher

class galleryViewController: UIViewController {
    
    
    var abc = [ToDo]()
    @IBOutlet  var tableView: UITableView!
    var data = [ToDo]()
    
     override func viewDidLoad()
    {
        super.viewDidLoad()
    
        if  UserDefaults.standard.data(forKey: "name") != nil{
            let jsonDecode = JSONDecoder()
            if let localData = UserDefaults.standard.object(forKey: "name") as? Data{
                do{
                    let localData = try? jsonDecode.decode([ToDo].self, from: localData)
                    abc = localData!
                    reloadTable()
                }catch{
                    print(error)
                }
                
            }
            
            print("count \(data.count)")
            
        }else{
            
            // Do any additional setup after loading the view.
            fetchingApiData(URL: "https://api.opendota.com/api/heroStats") { [self]
                result in self.abc = result
               reloadTable()
            }
        }
    }
    private func reloadTable(){
        DispatchQueue.main.async {
         
            self.tableView.reloadData()
        }
    }
    func fetchingApiData(URL url:String,completion: @escaping([ToDo]) -> Void)
    {
        DispatchQueue.global(qos: .background).async
        {
            let url = URL(string: url)
            let session = URLSession.shared
            let dataTask = session.dataTask(with: url!)
            {
                data,response,error in
                if data != nil && error == nil{
                    do{
                        let parsingData = try JSONDecoder().decode([ToDo].self, from: data!)
                        let encoder = JSONEncoder()
                        if let encodedData = try? encoder.encode(parsingData){
                            UserDefaults.standard.set(encodedData, forKey: "name")
                        }
                        
                        print("hiiii   \(parsingData)")
                        completion(parsingData)
                    }
                    catch
                    {
                        print("Parsing error")
                    }
                }
            }
            dataTask.resume()
        }
    }

}
extension UIImageView
{
    func downloaded(from url: URL,contentMode mode: ContentMode = .scaleToFill)
    {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data,response,error in guard
            let httpURLResponse = response as? HTTPURLResponse,httpURLResponse.statusCode == 200,
            let mimeType = response?.mimeType,mimeType.hasPrefix("image"),
            let data = data,error == nil,
            let image = UIImage(data: data)
            else
            {
                return
            }
            DispatchQueue.main.async(){ [weak self] in
                self?.image = image
            }
        }.resume()
    }
    func downloaded(from link: String,contentMode mode: ContentMode = .scaleAspectFit)
    {
        guard let url = URL(string: link) else {return }
        downloaded(from: url,contentMode: mode)
    }
}

extension galleryViewController:UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "galleryCell",for: indexPath) as! galleryimagetTableBarApiCell
        let apiData:ToDo
        apiData = abc[indexPath.row]
        let string = "https://api.opendota.com"+(apiData.img)
        let url = URL(string: string)
        cell.artworkUrl100.downloaded(from: url!,contentMode: .scaleToFill)
        cell.layer.cornerRadius = 20
       // cell.apiLabel.text = apiData.img

        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return abc.count
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let bca = abc[indexPath.row].img
       // let hj = bca.img
        gallerySecondViewController.j = bca as? UIImage
//UIImage(named: bca)
       
        
        performSegue(withIdentifier:"se", sender: bca)
        
    }
    
}

