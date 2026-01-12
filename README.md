## Build tools & versions used

### Build Tools:
Regular XCode Build tools (Simulator or iPhone).

In this specific project I used iPhone 17 as the default device.

### Versions:
- XCode 26.2
- Swift 6.2.3
- iOS Target: 26.2

### Frameworks:
- SwiftUI
- Combine
- Foundation
- CoreLocation
- MapKit
- XCTest for tests

## Steps to run the app

Clone the project

```bash
  git clone https://link-to-project
```

Open project in XCode

Select an iOS Simulator or iPhone (using iOS 26+)

Run the project


## What areas of the app did you focus on?
                
I have focused on mainly on:
                
- Fetching data from Mempool.space API
- UI state management (loading, error, success)
- Creating a good-looking detailed view for the node items
- Creating tests, ensuring that the app is running well
- Enabling visualization of the map by fetching geodata for node channels

## What was the reason for your focus? What problems were you trying to solve?

My main goal was to build an app that fetches data realiably from the mempool space API, being responsive and displaying a map of the nodes locations.
                
While I was working on this project, I learned that there's no "specific" location for a node in the lightning network. You actually have the location for the channels that compose that specific node. At first, this was a problem because I wanted the app to have a navigation/tab bar, and I had to remove it because it felt better in the overall UX to view the channel's markers from the detail view.
                
I also wanted to bring more stuff than what was required in the Challenge, showcasing my experience with Swift.
                    

## How long did you spend on this project?
                
Around 1 day for creating the low fidelity prototypes and thinking about the overall structure, and 3 days for coding the project.

## Did you make any trade-offs for this project? What would you have done differently with more time?
                
I'm not sure if I did any trade-off because I achieved (almost) everything I wanted. Here's what I would have done if I had more time:
                    
- A picker that automatically sorts the list
- A better UI, using Bipa's gradient colors
- Improve the app by adding a NavigationLink to each marker, leading to a "Channel Detailed View"

## What do you think is the weakest part of your project?
                
In my perspective, the weakest part of my project is the Map "scalability", because it renders all the markers at the same time, and causes the device to "lag" a little bit.
                

## Is there any other information you’d like us to know?
                
This project was amazing! Thank you guys for elaborating such a fun challenge. I have learned a lot while working in this project, specially due to the no-AI requirement.

Before creating the app, I have created a low fidelity prototype, which can be viewed on Figma: https://www.figma.com/design/RL4ruATrC1tygiaOpmwuG8/Bipa-Challenge?node-id=0-1&t=NeA0ljlIWOEuYOG7-1

I have also listed some references I have used on this project in the "Referências (Código)", it's worth checking it out!

Feel free to reach me out if you guys have any questions!
                
Thank you!
