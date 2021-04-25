# CS336---BuyMe-Project

# admin credentials
(username, password) = (admin, password)

# customer representative credentials
(rep_id, username, password, email) = (001, rep1, password, somebody@gmail.com)

# work division
I. creation of users, login, logout => Andy Lam

II. Auctions (Manual) => Andy Lam

III. Auctions (Automatic) => Skyler Chen

IV. Browsing and Advanced Search Functionality => Alva Bandy

V. Admin and customer rep functions => Aris Chung

# Auctions (Manual) 

-- On successful registration and login, the user will be redirected to the user auction page.

-- Users will have access to two different panels (Buyer, Seller) depending on the action that they wish to perform.

(Seller):

-- After pressing the 'Access Seller Page' button, the user will be shown some seller functions.
  
  -- They will be able to see all current active auctions created by themselves.
 
  -- They will be able to create an auction through the 'Create Auction' button.
  
    -- On the create auction page, they will be asked to set the characteristics of the item, the closing date and time, an optional reserve price and the type of item they are          selling.
      -- name (any combination of characters), initial amount (integer values), increment amount (integer values), size (any combination of characters), 
         gender (any combination of characters), color (any combination of characters), type (any combination of characters), minimum win/reserve (integer values),
         end-date (YYYY-MM-DD HH:MM:SS format and must be greater than current system time), clothing_type (shirts/shoes/hats option).
         
(Buyer):

  -- After pressing the 'Access Buyer Page' button, the user will be shown some buyer functions.
 
  -- (Watch Listed Items Button): this button accesses all the items that the user is interested in
  
  -- (Access Item Bids Button): this button accesses all the items the user has bidded on
  
  
  -- (Alert: Higher Bid Placed): this will allow the user to check if a higher bid was placed on an item that the user was previously bidded on.
  
  -- (Alert: Auctions Won): this will allow the user to check which auctions they have won.
  
  -- (Alert: Auction User Winning): this allows the user to check which items they are currently the highest bidder
 
 
  -- After utilizing the Auction House on successful login or utilizing the search engine, the user would be shown the item page of an existing auction.
  
  -- The first table of the item page shows the statistics of the item.
  
  -- The second table of the item page shows the descriptions of the item.
  
  -- The third section of the item page will vary depending on the situation the user is in.
    
    -- (no bids have been placed on the item): the third section will display a form in which offers the user the ability to place the initial bid.
    
    -- (there are bids placed on the item): the third section will display a form in which offers the user to place a bid and or a max bid.
    
    -- (if the auction is over):
      
      -- (if the user is the highest bidder): it will display that the user won.
      
      -- (if the user is not the highest bidder): it will display that the user did not get the item
      
      -- (if no-one bid on the auction): it will display that no-one bid on the auction.
      
      -- (if you are the seller): it will display that you sold the item.
 
 -- the fourth section of the page page will display the option to check the current status of the bid.
  
  (Auctions Manual):
  -- a user is able to set constant bids with a press of a button with an option to change the scale of the bid.
  -- a user is able to set a max (ceiling) bid.
  

# Auctions (Automatic) 
From the auction_home screen or any other page that allows users to access items,
Users can redirect to item pages, on these specific item pages… 

If the current user is allowed to bid on the current item (not seller of item, auction is ongoing) 
They will be allowed to place automatic max bids(secret upper limit) along with their normal bids
Should another user bid more than their bids, the auto bid mechanic will increment the current user’s bid to bid higher automatically
For alerts when someone outbids more than their upper limit, users have various ways to be alerted, including going to their buyer home page and looking there, or checking bid status on the item page directly

Of course, when an auction ends (closing time)whoever has the highest bid is eligible to be the winner, the site will check their bid against the sellers set reserve price to determine if they have won the item.

# Browsing and Advanced Search Functionality 
The auction_home page lists all existing auctions and the user can select an auction from this page by inputting the item_id into the input bar on the bottom. From this page you can press a button to go to the search page. 

On this page there are different queries that the user can decide to use. This includes, sorting method (alphabetical, ascending price, and descending price), clothing type, max price, gender, color and name. They can also search for users by username. There are two separate buttons for searching a user and searching an item. 

Once you have selected your queries you can press the search button and this will take you to a page that displays all items that match your queries in a table. If there are no matching results the table will be empty. Under the table is an input bar where the user can input the item_id of the item they wish to view. This will then take them to the individual items page. 

On this page there is various information on the item, some functionality that is explained in the auction section, and two buttons. One of these is the bid history button and the other is the similar item button. Each taking you to the corresponding page. 

The bid history page lists all bids made on the item in a table. If there are no bids then the table is empty. 

The similar item page lists all the items of the same type in a table. If there are no similar items then the table is empty. Under the table is a input bar that allows you to go to the page for an item of your choosing, using item_id. 

From the query page, searching a username will result in all users (including yourself) that either exactly match or begin with the user input. From this page you can input the full username into the input bar underneath the table of users. This will take you to the individual user page. 

The user page lists all bids that the user has made in one table and all sales they have made in the other. 

Back on the query page there is also a button to check the alerts that the user has made. This will take you to a page that lists items that match the alerts that the user has made. This is empty if there are no matches or if no alerts have been made yet. Under the table is a search bar to select the item_id from the table and go to the item's page. The other is to remove an alert by inputting its exact name. There is also a button to create alerts. 

This will take you to another page where you can input the name of the item you want to be alerted for if an auction is made. This requires an exact match on the name. 

# Admin and customer rep functions 

