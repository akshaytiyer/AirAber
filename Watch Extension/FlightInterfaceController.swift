//
//  FlightInterfaceController.swift
//  AirAber
//
//  Created by Akshay Iyer on 3/26/17.
//  Copyright © 2017 Mic Pringle. All rights reserved.
//

import WatchKit
import Foundation


class FlightInterfaceController: WKInterfaceController {
    
    @IBOutlet var flightLabel: WKInterfaceLabel!
    @IBOutlet var routeLabel: WKInterfaceLabel!
    @IBOutlet var boardingLabel: WKInterfaceLabel!
    @IBOutlet var boardTimeLabel: WKInterfaceLabel!
    @IBOutlet var statusLabel: WKInterfaceLabel!
    @IBOutlet var gateLabel: WKInterfaceLabel!
    @IBOutlet var seatLabel: WKInterfaceLabel!
    
    override func awake(withContext context: Any?) {
         super.awake(withContext: context)
        if let flight = context as? Flight { self.flight = flight }
    }
    
    // 1    
    var flight: Flight? {
        // 2
        didSet {
            // 3
            if let flight = flight {
                // 4
                flightLabel.setText("Flight \(flight.shortNumber)")
                routeLabel.setText(flight.route)
                boardingLabel.setText("\(flight.number) Boards")
                boardTimeLabel.setText(flight.boardsAt)
                // 5
                if flight.onSchedule {
                    statusLabel.setText("On Time")
                } else {
                    statusLabel.setText("Delayed")
                    statusLabel.setTextColor(UIColor.red)
                }
                gateLabel.setText("Gate \(flight.gate)")
                seatLabel.setText("Seat \(flight.seat)")
            }
        }
    }
        
}
