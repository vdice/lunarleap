# Working title: Lunarleap

##### _An app to track monthly goals and be inspired by those of others_

![Preview](/app/assets/images/preview.png?raw=true "Preview")

#### By **_Vaughn Dice_**

## Description

_**This app is live!** It has been deployed via Heroku and can be seen  [**here**](https://lunarleap.herokuapp.com)._

_Using this app, users can:_
* _Create user accounts,_
* _Add, view, modify and delete new monthly challenges_
* _Add and view updates to each monthly challenge_
* _View and follow other users' challenges_
* _Assign a category to a challenge_
* _Explore challenges by category_
* _...plus more to come!_

## Setup
* _Clone this repository_
* _Run the following commands: (can be copied into terminal)_

```
bundle         # installs necessary dependencies
postgres &     # starts up the postgres server in background
rake db:init  # runs rake db:drop, :create, :migrate, :seed and :test:prepare
rails s        # starts up the rails server
```

* _Then navigate to `localhost:3000`_

* _You can always run specs with: `rspec`_

## Technologies Used

_Ruby, rspec, Rails, Capybara, Postgres, Rake, Active Record, Devise, Carrierwave, AWS_

### Legal

Copyright (c) 2015 **_Vaughn Dice_**

This software is licensed under the MIT license.

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
