import UIKit

class FollowerListViewController: UIViewController {
    
    var username: String!
    
    override func viewDidLoad() {
            super.viewDidLoad()
            view.backgroundColor = .systemBackground
            navigationController?.navigationBar.prefersLargeTitles = true
            
            // Fetch followers
            NetworkManager.shared.getFollowers(for: username, page: 1) { result in
                switch result {
                case .success(let followers):
                    print(followers?.count)
                    // Process followers (e.g., update UI)
                case .failure(let error):
                    self.presentAlertOnMainThread(title: "Bad stuff happened", message: error.rawValue, buttonTitle: "OK")
                }
            }
        }
        
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
}
