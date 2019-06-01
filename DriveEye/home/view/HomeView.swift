
import UIKit
import CoreLocation


class HomeView: UIViewController,CLLocationManagerDelegate  , HomeViewProtocol {
   
    @IBOutlet weak var btnStartTrip: UIButton!
    
    var trip : Trip!
    var presenter : HomePresenter! = nil
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter =  HomePresenter(model: HomeModelIMP())
        trip = Trip()
        presenter.attachView(view: self)
    }

    @IBAction func startTribAction(_ sender: UIButton) {
        switch btnStartTrip.currentTitle! {
        case "start trip":
            btnStartTrip.setTitle("end trip", for: .normal)
            presenter.getStartLoation()
            
        case "end trip":
            btnStartTrip.setTitle("start trip", for: .normal)
            presenter.getEndLoation()
            trip.description="description"
            trip.duration=15.45
            trip.startPoint="ismailia"
            trip.endPoint="ziftr"
            presenter.addTrip(trip:trip)
        default:
            break
        }
    }
   
    
    
    func setStartPoint(_ startpoint: String) {
        trip.startPoint=startpoint
    }
    
    func setEndPoint(_ endpoint: String) {
        trip.endPoint=endpoint
    }
}
