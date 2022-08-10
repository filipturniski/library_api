# Library api

## done features

-   Public catalog - no authentication
    *   book search by book name an author name with number of books and number of free books
    *   author search by book name an author name 
-   Library management system - authentication + check if user is admin
    * authors
        *   search by athors name
        *   insert new autor
        *   edit authors
        *   delete authors
	*   books
        *   search books by book name or author name
        *   inserting new book
        *   edit book
        *   delete book
    *users
        *   returning users that have maching first name, last name and userame
        *   inserting new users
        *   edit users
        *   delete users
	* book loans
	    *   list of all loans
	    *   inserting loans
	        *   checking whether there are free books
	        *   cheking if user have 3 or more aktive loans
	    *   edit loans
	    *   delete loans
-    Member dashboard - authentication
        *   check loan history by user
-   Test
    *   test author API-s
## TODO features
-   encrypt user passwords in database
-   addition documentation 
    *   update datamodel
-   test user API-s
-   test book API-s
-   test loans API-s

## Database Model