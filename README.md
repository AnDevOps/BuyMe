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

# Auctions (Manual) Details

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
  

# Auctions (Automatic) Details

# Browsing and Advanced Search Functionality Details

# Admin and customer rep functions Details

