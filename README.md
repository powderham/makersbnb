## Heartbreak BnB

<!-- <ul>
  <% @listings.each do |listing|%>
<div>
  <li>  <%=listing.name %> </li>
  <li> " <%=listing.description %> " </li>
  <li>  £<%=listing.price %> </li>
  <li> <%=listing.date %> </li>
  <form action="/bookings/new" method = "post" >
    <button type ="submit" name="listing_id" value ="<%=listing.id%>" > Request Booking </button>
  </form>
  <% end %>
</div>
</ul> -->

<!-- 
app/rb
    # @listings = Listing.all(:user_id.not => @user)
        # puts "#{@listings}STRING CHEESE" -->

#### Much like the Hotel California, you can checkout - but you can never leave.

![Master of the Whiteboard](image.jpg)

### User Stories

```As a host, so potential guests can see my property,
I need to list a property.```

```As a host, so I can make more money,
I want to list multiple properties.```

```As a host, so I can manage my listings,
I need to sign up for the website.```

```As a guest, so I can make a booking request,
I need to sign up for the website.```

```As a user, so I can manage my booking requests,
I want to sign in.```

```As a guest, so I can choose potential properties,
I would like to see a list of names and prices of properties.```

```As a host, so I can advertise my property,
I want to give it a name, description and price per night.```

```As a host, so I have guests stay when I want,
I need to offer available dates for the property.```

```As a guest, so I can make a booking for one night,
I need to make a booking request to the host.```

```As a host, so I can make a booking for one night,
I want to accept a booking request from the guest.```

```As a guest, so I don't waste my time,
I can't see properties that are not available for my dates.```

```As a host, so I have maximum occupancy,
I want to receive booking requests until I accept a booking.```

###### Nice to haves

```
