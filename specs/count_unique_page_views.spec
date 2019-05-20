# Count Unique Page Views

## singular

* log enteries 

   |entry                   |
   |------------------------|
   |/contact 184.123.665.067|
   |/contact 184.123.665.067|

* when counted by unique page views

* should display unique views 

   |ordinal|output                 |
   |-------|-----------------------|
   |1      |/contact 1 unique views|


## duplicates

* log enteries 

   |entry                   |
   |------------------------|
   |/contact 184.123.665.067|
   |/contact 184.123.665.067|

* when counted by unique page views

* should display unique views 

   |ordinal|output                 |
   |-------|-----------------------|
   |1      |/contact 1 unique views|

## uniq views

* log enteries 

   |entry                   |
   |------------------------|
   |/fusion 184.123.665.068 |
   |/contact 184.123.665.067|


* when counted by unique page views

* should display unique views 

   |ordinal|output                 |
   |-------|-----------------------|
   |1      |/contact 1 unique views|
   |2      |/fusion 1 unique views |

## top uniq views

* log enteries 

   |entry                   |
   |------------------------|
   |/fusion 184.123.665.068 |
   |/contact 184.123.665.067|
   |/contact 184.123.665.068|


* when counted by unique page views

* should display unique views 

   |ordinal|output                 |
   |-------|-----------------------|
   |1      |/contact 2 unique views|
   |2      |/fusion 1 unique views |
