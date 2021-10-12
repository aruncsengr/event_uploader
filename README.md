# Event Uploader

An online portal to upload events for users and keep track of it via full calendar view.

### Mission 1 - script to upload data in respective tables
- Design required database tables, their columns and associations (the application must have users and events tables. Any additional tables can be added).
- Find out patterns from the csv to seed the data in the database for users and events.
- An event should be marked completed if the end date is before current datetime.
- End datetime should be ignored if event is an all day event.
- Each user’s RSVP is marked in the events csv file, the rsvp should be marked by default the same, but a user having multiple events at the same time can not have rsvp as `yes` for more than one overlapping event. In such case consider the rsvp of last overlapping event to be `yes`

### Mission 2 - script to upload data in respective tables
- Add a simple UI which shows events for a given date range.
- Add a simple UI which shows availability of a particular user for a given date range.

### Assumptions
- No double booking (i.e, considering user's timeslot as busy only if the RSVP is 'yes')

> Note: To achieve optimization, I've used postgresql COPY command and bulk_insert approach to upload data from CSV files. So, I've taken care of validations as DB constraints and custom validations in importers (PORO) itself.


## Installation

Install the dependencies and devDependencies and start the server.

```sh
cd event_uploader
bundle install
rails db:migrate
rails s
```
## To import data from csv files

```sh
rails import:all
```

## To clean all imported data

```sh
rails db:reset
```

## Output

### Event calendar view:

![event_calendar](https://github.com/aruncsengr/event_uploader/blob/main/app/assets/images/events_calendar.png)

### User calendar view:

![user_calendar](https://github.com/aruncsengr/event_uploader/blob/main/app/assets/images/user_calendar.png)
