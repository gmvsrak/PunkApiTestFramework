#Punk API Test Framework

###Install

`Install Ruby 2.3.0`

Run 

    `gem install bundler`

###Pre-Requisite
You need to clone the repository from git hub

    git clone URL
    
Navigate to the framework location and run below command in terminal.Below command will help you to install dependencies

    
    bundle install
    
###Running Tests

Run Regression tests by below command

    rake regression
    
Run Smoke test by below command

    rake smoke
    
Run Single test by below command

    bundle exec cucumber -t @test -f html -o test_report.html -f pretty
    
To increase parallel thread count edit line 14 or 29 in Rakefile, current thread count is 4
    
###Reports

Reports can be found in below location

    results/punk_api_regression_report.html
    
    results/punk_api_smoke_report.html

