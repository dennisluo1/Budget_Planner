# Budget_Planner

![](./wireframes/)
[View web app on Heroku here]()

## What is Budget Planner?

Budget Planner is an web application that allows users to record their daily expenses. The idea behind this concept is that if users have to record their expenses, they will become more aware of their spending habits. Budger Planner also provides resources and insights into millennial investing. 


## Inspiration Behind Budget Planner 

I attended a business high school that taught classes relating to accounting, investing, financial markets, and personal finance. After finishing high school, I went on to pursue my bachelors in business. While a student at Skidmore College, I realized that many of my peers had never taken a course relating to personal finance and did not consider themselves financially saavy. With this app, I wanted to be able to help millennials keep track of their expenses and provide an insight tool into how much they should be saving, investing, and spending a month. In addition Budget Planner will also provide useful information and resources on personal finance for millennials. 

For Budget Planner, I decided to focus on React and Rails to build this platform. Originally, I wanted to build my entire platform using Ruby on Rails but React is a much quicker JS library for the front-end. On the back-end, I decided to use Rails. In addition I decided to use CoffeeScript in order to display code that would be simpler to understand. In addition I wanted to experiment with coffee files while I wrote React code. 

## Technical Discussion

* React: Used for interactive front-end
* Ruby on Rails: Used for back-end to expose some API endpoints with JSON output
* CoffeeScript: JS syntax used to display code that is easier to understand 
* Bootstrap: Used to add beautiful styling to design of app

### Sample Code
Here is a simple Javascript function to calculate certain expenses, savings and investment:

```
function calcIncome() {
    var income = document.getElementById('annual-income').value;
    
    var rentNum = Math.floor((income * .30)/12);
    rent.innerText = rentNum;

    var transportNum = Math.floor((income * .05)/12);
    transportation.innerText = transportNum;

    var utilitiesNum = Math.floor((income * .05)/12);
    utilities.innerText = utilitiesNum;

    var foodNum = Math.floor((income * .20)/12);
    food.innerText = foodNum;

    var laundryNum = Math.floor((income * .008)/12);
    laundry.innerText = laundryNum;

    var medicalNum = Math.floor((income * .05)/12);
    medical.innerText = medicalNum;

    var personalNum = Math.floor((income * .05)/12);
    personal.innerText = personalNum;

    var savingNum = Math.floor((income * .10)/12);
    saving.innerText = savingNum;

    var investmentNum = Math.floor((income * .20)/12);
    investment.innerText = investmentNum;
}
```
Special thanks to [Hao Sun](https://github.com/gumosun) for assisting in developing this expense calculation!

## Proposal - User Story/Wireframes

[Proposal](https://github.com/dennisluo1/Budget_Planner/blob/master/proposal.md)

## Challenges

Some of my biggest challenges encountered along the way using CoffeeScript. CoffeeScript is very precise when it comes to syntax and a slight space can affect the overall functionality of the code. In addition another roadblock was perfecting the set up of the CRUD system. In particular the edit/update functionality took quite some time to fix as there were several bugs and other setbacks along the way. In addition, one of the fun challenges was coming up with basic math to calculate expenses, savings, and investment and converting it to code. 

## Opportunities for Future Growth
 
The next step of this app would be to incorporate a login functionality that will allow users to sign up for an account in order to save their expenses to their account. In addition I want to set up an API that will link users bank accounts to Budget Planner. With this API, it will allow users to sync their expenses from their accounts to Budget Planner.

In addition I definitely want to use another styling framework in order to fix up the visual appearance of the webpage. 

## Credits: 

* [Inspiration for App](https://www.mint.com/)
* [3 ways to use React with Ruby on Rails 5](https://learnetto.com/blog/3-ways-to-use-react-with-ruby-on-rails-5)
* [Building a CRUD interface with React and Ruby on Rails](https://www.pluralsight.com/guides/ruby-ruby-on-rails/building-a-crud-interface-with-react-and-ruby-on-rails)
* [How to Add React to a Ruby on Rails Application](https://www.youtube.com/watch?v=pVHEPf7S88I)
* [Beginner Rails 5 With ReactJS Tutorial](https://www.youtube.com/watch?v=PIel9V6JImc&t=8s)
* [Investopedia: Investing 101](http://www.investopedia.com/university/beginner/)