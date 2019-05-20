# Count Page Views

## count 1 entry

* log enteries 

   |entry                       |
   |----------------------------|
   |/help_page/1 126.318.035.038|

* when counted by views
* should display views 

   |ordinal|output               |
   |-------|---------------------|
   |1      |/help_page/1 1 views|


## count multiple entries (same page)

* log enteries 

   |entry                       |
   |----------------------------|
   |/help_page/1 126.318.035.038|
   |/help_page/1 126.318.035.038|

* when counted by views
* should display views 

   |ordinal|output               |
   |-------|---------------------|
   |1      |/help_page/1 2 views|


## count multiple git add (different page)

* log enteries 

   |entry                       |
   |----------------------------|
   |/help_page/1 126.318.035.038|
   |/help_page/1 126.318.035.038|
   |/help_page/2 126.318.035.038|


* when counted by views
* should display views 

   |ordinal|output               |
   |-------|---------------------|
   |1      |/help_page/1 2 views|
   |2      |/help_page/2 1 views|


## count multiple sort alphabetical

* log enteries 

   |entry               |
   |--------------------|
   |/a 126.318.035.038  |
   |/b 1 126.318.035.038|
   |/c 2 126.318.035.038|


* when counted by views
* should display views 

   |ordinal|output     |
   |-------|-----------|
   |1      |/c 1 views|
   |2      |/b 1 views|
   |3      |/a 1 views|


## count multiple sort alphabetical using a number

* log enteries 

   |entry                         |
   |------------------------------|
   |/help_page/1 126.318.035.038  |
   |/help_page/2 1 126.318.035.038|
   |/help_page/3 2 126.318.035.038|


* when counted by views
* should display views 

   |ordinal|output               |
   |-------|---------------------|
   |1      |/help_page/3 1 views|
   |2      |/help_page/2 1 views|
   |3      |/help_page/1 1 views|



