
## Setup

1. `rake db:create db:migrate db:seed`
2. To run in development: run `rails s` and navigate to `localhost:3000`
3. To run the tests: `rspec`

## Technologies Used
* Rails 5.0.0 
* MySQL
* Bootstrap
* RSpec

## Application Design
### Schema:
This application has only one model, `Reading`, with a `glucose_reading` attribute. Glucose Reading must be a number, 
and that number must be an integer. Though reports, days, and months are other entities displayed to the user, 
they are not themselves models. Information relating to days and months is generated by finding readings associated 
with certain `created_at`

### Routing:
This application uses minimal resourceful routing, as there is only one model. 
There are two routes related to reports, one for viewing and submitting the form, 
and another for viewing the results. 
As reports creating a `ReadingsController`. 
This controller has two actions, `#new` for viewing the form, and `#results` 

for taking in the params of the form and displaying the correct data.

To application roots to the `new_reading_path`, in which users can enter up to 4 readings per day.

### Submitting a Report Request Form:
The form for submitting reports takes the user through a number of steps. Once completed, the next step is shown via jQuery filtering. This filtering mandates that the user complete each step before moving on to the next, ensuring that the form is only submitted with complete data.

* **Step 1:** The user selects what type of report they would like to view via a radio button. Their options are daily, month-to-date, or monthly.

* **Step 2:** Once the user has made their report type selection, they see a drop down of date choices. For daily and month-to-date reports, dates are shown as MM-DD-YYYY options. Only dates that have readings associated with them are displayed in the drop down. If the user selects a monthly report type, they see a drop down of months and years. Only months that have readings associated with them are shown. The logic for finding dates and months associated with readings is handled in the `Reading` model.

* **Step 3:** The user submits the report by clicking the "View Report" button, which appears after they have selected a date or month.

### Reports:
Once the user submits their selections, they view their report. Reports show maximum, minimum, and average blood glucose levels for the selected timeframe.

The `Reading` model contains all the logic for determining report data. For each type, a similar pattern is followed:
1. Via ActiveRecord, find all readings associated with the given date or range as sent in the params.
2. Find blood glucose levels associated with the readings via ActiveRecord, and then use Ruby methods to find the max, min, and average. This data is stored in a hash to be easily accessed in the view.
