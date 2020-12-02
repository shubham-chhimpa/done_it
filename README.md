
# DoneIt 📝

[![GitHub license](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)
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

# lib Structure
    
    .
    ├── core                # For all common and core files.
    │   ├── error           # contains all Exceptions and Failures classes
    │   ├── presentation    # common presentation files
    |   │   └── blocs      # common blocs
    |   │   └── pages      # core pages
    |   │   └── widgets      # common widgets
    │   └── route      # Routes for navigation
    │   └── theme      # Theme data
    │   └── usecases      # common usecases
    |
    ├── feature              # all features           
        ├── feature1            # Feature 1 (for exp : Todo Feature)
            ├── data     # Data Files of Feature 1
            ├   └── datasources   # DataSources Abstract Files and Implementations   
            ├   └── models   # Models for data   
            ├   └── repositories   # Repositories Implementation Classes   
            └── domain   # Domain 
            ├   └── entities   # Entities For Feature 1   
            ├   └── usecases   # Usecases of Feature 1   
            ├   └── repositories   #   Repositories Abstract Classes
            ├── presentation    # Feature 1 presentation files
            │   └── blocs      # Feature 1 blocs
            │   └── pages      # Feature 1 pages
            │   └── widgets      # Feature 1 widgets 
   
   


## Architecture
This app uses [***Clean Architecture by Robert C Martin***]

## Contribute
If you want to contribute to this library, you're always welcome!
See [Contributing Guidelines](CONTRIBUTING.md). 

## Contact
If you need any help, you can connect with me.

Visit:- [shubham-chhimpa.github.io/](https://shubham-chhimpa.github.io/)

## License
```
MIT License

Copyright (c) 2020 Shubham Chhimpa

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```
