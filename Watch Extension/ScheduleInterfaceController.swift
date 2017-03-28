//
//  ScheduleInterfaceController.swift
//  AirAber
//
//  Created by Akshay Iyer on 3/26/17.
//  Copyright © 2017 Mic Pringle. All rights reserved.
//

import WatchKit
import Foundation


class ScheduleInterfaceController: WKInterfaceController {

    @IBOutlet var flightTable: WKInterfaceTable!
    var flights = Flight.allFlights()
    var selectedIndex = 0
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        flightTable.setNumberOfRows(flights.count, withRowType: "FlightRow")
        
        for index in 0..<flightTable.numberOfRows {
            if let controller = flightTable.rowController(at: index) as? FlightRowController {
                controller.flight = flights[index]
            }
        }
    
    }
    
    override func didAppear() {
        super.didAppear()
        // 1
        if flights[selectedIndex].checkedIn, let controller = flightTable.rowController(at: selectedIndex) as? FlightRowController {
            // 2
            animate(withDuration: 0.35, animations:{ () -> Void in
                // 3
                controller.updateForCheckIn()
            })
        }
    }
    
    override func table(_ table: WKInterfaceTable, didSelectRowAt rowIndex: Int) {
        selectedIndex = rowIndex
        let flight = flights[rowIndex]
        let controllers = flight.checkedIn ? ["Flight", "BoardingPass"] : ["Flight", "CheckIn"]
        presentController(withNames: controllers, contexts: [flight, flight])
    }
    
}
