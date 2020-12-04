
<div style="text-align: center">
    <table>
        <tr>
            <td style="text-align: center">
                <img src="/project/images/HomePage.png" width="200"/>
            </td>
            <td style="text-align: center">
                <img src="/project/images/AddTodoPage.png" width="200"/>
            </td>
            <td style="text-align: center">
                <img src="/project/images/ViewTodoPage.png" width="200"/>
            </td>
            <td style="text-align: center">
                <img src="/project/images/SettingPage.png" width="200"/>
            </td>
        </tr>
        <tr>
             <td style="text-align: center">
                 <img src="/project/images/HomePage (Dark Mode).png" width="200"/>
             </td>
             <td style="text-align: center">
                 <img src="/project/images/AddTodoPage(Dark Mode).png" width="200"/>
             </td>
             <td style="text-align: center">
                 <img src="/project/images/ViewTodoPage(Dark Mode).png" width="200"/>
             </td>
             <td style="text-align: center">
                 <img src="/project/images/SettingPage (Dark Mode).png" width="200"/>
             </td>
        </tr>  
    </table>
</div>


# DoneIt 📝

![CI](https://github.com/shubham-chhimpa/done_it/workflows/CI/badge.svg)

[![GitHub license](https://img.shields.io/badge/License-MIT-blue.svg)](/https://github.com/shubham-chhimpa/done_it/LICENSE.md)
![Github Followers](https://img.shields.io/github/followers/shubham-chhimpa?label=Follow&style=social)
![GitHub stars](https://img.shields.io/github/stars/shubham-chhimpa/done_it?style=social)
![GitHub forks](https://img.shields.io/github/forks/shubham-chhimpa/done_it?style=social)
![GitHub watchers](https://img.shields.io/github/watchers/shubham-chhimpa/done_it?style=social)
![Twitter Follow](https://img.shields.io/twitter/follow/shubham_chhimpa?label=Follow&style=social)

**DoneIt** is a sample note app 📝 Flutter application 📱 built to demonstrate use of *Clean Architecture* tools. Dedicated to all Flutter Developers with ❤️. 


## About
It simply loads **Notes** data from in memory database. Notes will be always loaded from in memor database. 
- This makes it offline capable 😃. 
- Clean and Simple Material UI.
- It supports dark theme too 🌗.

## Directory Structure
    
    .
    ├── core                       # For all common and core files.
    │   ├── error                  # contains all Exceptions and Failures classes
    │   ├── presentation           # common presentation files
    |   │   └── blocs              # common blocs
    |   │   └── pages              # core pages
    |   │   └── widgets            # common widgets
    │   └── route                  # Routes for navigation
    │   └── theme                  # Theme data
    │   └── usecases               # common usecases
    |
    ├── feature                    # all features           
        ├── feature1               # Feature 1 (for exp : Todo Feature)
            ├── data               # Data Files of Feature 1
            ├   └── datasources    # DataSources Abstract Files and Implementations   
            ├   └── models         # Models for data   
            ├   └── repositories   # Repositories Implementation Classes   
            └── domain             # Domain 
            ├   └── entities       # Entities For Feature 1   
            ├   └── usecases       # Usecases of Feature 1   
            ├   └── repositories   #   Repositories Abstract Classes
            ├── presentation       # Feature 1 presentation files
            │   └── blocs          # Feature 1 blocs
            │   └── pages          # Feature 1 pages
            │   └── widgets        # Feature 1 widgets 
   
   


## Architecture
This app uses [***Clean Architecture by Robert C Martin***]

<img src="https://github.com/ResoCoder/flutter-tdd-clean-architecture-course/blob/master/architecture-proposal.png" style="display: block; margin-left: auto; margin-right: auto; width: 75%;"/>


Image Source : [ResoCoder](https://resocoder.com)

## Contribute
If you want to contribute to this library, you're always welcome!
See [Contributing Guidelines](CONTRIBUTING.md). 

## Branches
    .
    ├── master                       # Contains the latest release
           ├── dev                   # Contains the latest development
                ├── feature1         # feature 1 created from dev
                ├── feature2         # feature 2 created from dev
                ├── feature3         # feature 3 created from dev
                ├── bugFix1          # bugfix 1 created from dev
                ├── bugFix2          # bugfix 1 created from dev
                ├── docChange1       # docChange 1 created from dev
                ├── docChange1       # docChange 2 created from dev
            
Note  : Create pull request for feature,bugfix,docChange to only dev branch.

## Contact
If you need any help, you can connect with me.

Visit:- [shubham-chhimpa.github.io/](https://shubham-chhimpa.github.io/)

