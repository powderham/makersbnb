## Heartbreak BnB

<div class="col-lg-4">
  <h2> Requests for your homes: </h2>
    <% @homes.each do |home|%>
    <% booked_home = home.booking %>
      <% booked_home.each do |booked|%>
      <% if booked.confirmed == false %>
          <% hotel = Listing.get(booked.listing_id) %>
          <% guest = User.get(booked.user_id) %>
    <li>  <%=hotel.name %> </li>
        <%hotel.days.each do |day|%>
    <li><%=day.date.strftime('%d %b %Y')%></li>
    <li> Booked by: <%= guest.first_name%> <%= guest.last_name%> </li>
    <% end  %>

    <form action="/bookings/confirm" method = "post" >
      <button type ="submit" name="confirm_booking" value="<%=booked.id%>" > Confirm Booking </button>
    </form>
    <% end %>
  <% end %>
<% end %>


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
