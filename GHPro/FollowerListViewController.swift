import UIKit

class FollowerListViewController: UIViewController {
    
    var username: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
        
        // Fetch followers
        NetworkManager.shared.getFollowers(for: username, page: 1) { [weak self] (followers, errorMessage) in
            guard let self = self else { return }
            
            if let errorMessage = errorMessage {
                self.presentAlertOnMainThread(title: "Something's wrong", message: errorMessage, buttonTitle: "OK")
                return
            }
            
            guard let followers = followers, !followers.isEmpty else {
                self.presentAlertOnMainThread(title: "None Found", message: "No followers were found for \(username ?? "")", buttonTitle: "OK")
                return
            }
            
            // Process followers (e.g., update UI)
            print("This user has \(followers.count) follower\(followers.count > 1 ? "s" : "")")
            print(followers)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
}
