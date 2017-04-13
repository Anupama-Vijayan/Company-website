# Company-website

1. Joined products table with users table (user_id is primary key in users table and user_id field is foreign key in projects table).  Also Left Joind categories table (cid is primary key in categories table and cid  field is foreign key in projects table) 

Did pagination - 2 rows in each page.

Also Added sort by drop down .
1.) Recent Projects
2.) Order By Category Name ASC
3.) Order By Username Asc
4.) Order By Project Title Asc
Default output is by Recent Projects 

Output is:    
Project Title  Username  CategoryName 

2. Did login form and create session for user table.
Username is from users table. Username should match with user entered login form_username take salt field value from username match row (row) Password should match from users table md5(md5(form_password).row_salt))


Ruby:
I have used mysql database and these are the steps for processing it:

1. do 
bundle install
2. to create the db and migrate the data do
rake db:create db:migrate
3. run rails server by 
rails s
4. sign up and create a username and password. This can be used to log in later.
