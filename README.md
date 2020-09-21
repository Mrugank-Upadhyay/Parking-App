# parking_app

Progress: Ongoing...

Design Prototype: https://www.figma.com/file/xY7FjADgVxDYZe1lbwYahi/Material-Parking-App-UI-Prototype?node-id=24506%3A29379


This app is a software implementation of my final project solution in my Entrepreneurship course in regards to the issue of unused / lack of parking in dense urban cities.
The purpose of the software component (this app) of my solution is to deliver exact listings of vacant parking locations near the 
user's destination given certain parameters. For initial testing purposes and as an Minimum Viable Product, the parameter will, for now,
be walk time from the parking lot to the final destination.

As this was meant to be a solution from which a potential startup can be created, there are certain features that were planned in the final project
which are not implemented. For example, the incentiviation of selecting longer walking times in exchange for price discounts. Additionally, as 
the primary method of data collection was from the use of sensors to find vacant parking, and this is not being implemented, mock data will be used
for this prototype. 

The Following is, or will be used for this app:

- Provider State Management
- Google Maps Platform
    - Google Maps API
        - Dynamic Maps
    - Google Routes API
        - Directions
        - Directions Matrix
        - Roads - Roads Travelled
    - Google Places API
        - Geocoding
        - Place Details
- Firebase
    - Cloud Firestore
    - Authentication
    - Cloud Functions
- Object Oriented Approach
