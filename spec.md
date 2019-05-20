# Specifications for the Sinatra Assessment

Specs:
- [x] Use Sinatra to build the app
-     I am using Sinatra to build my app
- [x] Use ActiveRecord for storing information in a database
-     Using ActiveRecord
- [x] Include more than one model class (e.g. User, Post, Category)
-     I have a user and outfit entry class
- [x] Include at least one has_many relationship on your User model (e.g. User has_many Posts)
-     user has_many outfit entries
- [x] Include at least one belongs_to relationship on another model (e.g. Post belongs_to User)
-     outfit entry belongs_to a user
- [x] Include user accounts with unique login attribute (username or email)
-     Login is set by email and password
- [x] Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying
-     User has all CRUD abilites on outfit entries
- [x] Ensure that users can't modify content created by other users
-     Don't show edit or delete links and use helper methods to authorize edits/deletes to only owners of entry
- [x] Include user input validations
-     Can't create an empty user or entry
- [x] BONUS - not required - Display validation failures to user with error message (example form URL e.g. /posts/new)
-     Added flash messages
- [x] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code
-     Readme includes all

Confirm
- [x] You have a large number of small Git commits
- [x] Your commit messages are meaningful
- [x] You made the changes in a commit that relate to the commit message
- [x] You don't include changes in a commit that aren't related to the commit message