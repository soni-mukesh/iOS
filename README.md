IAMHere iOS app is compatible with iPhone iOS 8.1 devices and will run only in Portrait mode.
This app is free and just for demo purpose. Anybody can download or make modification. Its FREE.

Compilation Instructions:
================================================================================

Clone the Project from

    https://github.com/soni-mukesh/iOS.git

Open the 'IAmHere.xcodeproj' file in Xcode 6.0 or newer

Build Requirements:

iOS 8.1 SDK or later

Runtime Requirements:

iOS 8.1 or later

Add proper Apple app signing certificates / provisioning and run the application on your development devices.

Implementation:
================================================================================

The design of IAmHere iOS app is based on following design pattern...

1. MVC
2. Protocol and Category
3. Delegation and Notification
4. Singleton

and following facility classes which helps to achieve application goal.

1. LocationManager: This class is responsible for receiving updated current location and send thru notification to all the observer controllers class.

2. BaseOperation: this class is derived from MKNetworkOperation and has 2 basic methods.
  a) initOperationForUrl : to initialize the network operation.
  b) processOperationOnCompletion: process the operation

3. SubmitLocationOperation : It is an operation which submit the current location to server with the help of base class BaseOperation.

4. Data : This is a singleton class to keep all your data and common functions that operates data. 

5. Utility: This is a facility class which is having only class methods which takes data as input, manipulate them and return the formated value.

Application Version
================================================================================

Version 1.0
- First version.



