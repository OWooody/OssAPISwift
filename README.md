# OssAPP
```Connect your app with your api in 10 minutes only!``` 

OssAPI is a Swift API template that makes dealing with objects and api calls super easy!



## **Introduction**
### Features:
  - Create objects
  - Drag and drop files into Dillinger
  - Export documents as Markdown, HTML and PDF

### Requirements:
In order to use the template, you need to have the following libraries in your project:
- [Alamofire](https://github.com/Alamofire/Alamofire)
- [ObjectMapper](https://github.com/Hearst-DD/ObjectMapper)

### Structure
![OssAPI Template Structure](http://i.imgur.com/en7vBSV.png)

The template is structured in a way to make it simple to use.
When your first open the template you will find 4 groups:
- **Common:** This group holds the app constants (e.g base api url, some keys, etc..).
- **ErrorHandling:** All the error handling logic and code is implemented here, you will find some prepared classes inside this group to help you better handle the app errors.
- ***Backend:*** This is the core of the template which handles all the api requests, this folder has 3 sub-groups:
    - **Objects:** In this group you will be creating your objects (models), see the **Usage** section below to know how to create your objects.
    - **API:** [DON'T PLAY WITH THIS CLASS PLEASE, UNLESS YOU WANT TO :p), this class has the core logic of the template and its made in a modular and generic way that makes this template live!
    - **Services:** In this group you will be creating a service for each object class, this service tells the api what calls will be made when you want to create, get, update, or delete an object through an api request.



## **Usage**
### Create your Objects
1. First thing start by creating the raw objects (models) in seperate classes.
![Object Example](http://i.imgur.com/GkFt4SP.png)
The ```override func mapping(map: Map)``` is inheretid from the ```Mappable``` interface which comes with the ```ObjectMapper``` library.
2. Make your class extend the ```Object``` class.
3. Map each instance variable in the object class with its corresponding object that is returned from the api.
**NOTE:** The name inside the square brackets should be similar to the name of the json result returned from  the api.

### 


## **How it works**


This text you see here is *actually* written in Markdown! To get a feel for Markdown's syntax, type some text into the left window and watch the results in the right.

### Version
1.0.0

### Installation
