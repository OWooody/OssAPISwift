# OssAPI

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
The template is structured in a way to make it simple to use, 


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
