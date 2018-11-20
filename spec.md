Specifications for the Sinatra Assessment
Specs:

X Use Sinatra to build the app
  I included sinatra and activerecord gems in my gemfile to begin my application.

X Use ActiveRecord for storing information in a database
  I used migration files to set up tables for the models column names in my application.

X Include more than one model class (e.g. User, Post, Category)
  I created a Dentist model, Assistant model, and Patient model

X Include at least one has_many relationship on your User model (e.g. User has_many Posts)
  My Dentist has_many Patients and Assistants.  

X Include at least one belongs_to relationship on another model (e.g. Post belongs_to User)
  Assistants belong to a Dentist.  Also, Patients belong to a Dentist.

X Include user accounts with unique login attribute (username or email)
  A dentist must have a unique email.  A helper method #login searches for a dentist on the basis of an email.  Password digest allows a check for an authenticated password in the login helper method. The dentist's email must be equal to the session email to be considered logged in.

X Ensure that the belongs_to resource has routes for Creating, Reading, Updating and  Destroying
  Dentists are able to login and logout.  If they are logged in, a dentist has access to CRUD actions for both patients and assistants.

X Ensure that users can't modify content created by other users
  Dentists are associated with patients after new patients are created and then checked for assocations when editing or deleting.  The following code is used to accomplish these checks.
  @patient.dentist = Dentist.find_or_create_by(params[:dentist])
  @patient = current_dentist.patients.find_by_id(params[:id])

X Include user input validations
  'validate presence of' is added to Assistant and Patient models for validation

 BONUS - not required - Display validation failures to user with error message (example form URL e.g. /posts/new)

X Your README.md includes a short description, install instructions, a contributors guide    and a link to the license for your code
X Confirm

 X You have a large number of small Git commits
 X Your commit messages are meaningful
 X You made the changes in a commit that relate to the commit message
 X You don't include changes in a commit that aren't related to the commit message
