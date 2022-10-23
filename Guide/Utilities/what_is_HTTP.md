# What is HTTP

Hypertext Transfer Protocol; which is a set of rules the server uses to transfer docs back and forth; its plain language and human readable; it is stateless meaning each request is unique, it has no memory of previous requests, ensuring no user gets stuck in a sequence.

What is PHP - scripting language used for web designs

What is a server - just a function! Servers return responses based on client requests; they are computers on the internet running data storage and sharing applications, ex a web server app

What is a client -- a user or user agent -- an app acting on behalf of a user, ex a browser.

Storing in memory vs on a disk

  - the pros and cons: space vs permanence

Request /Response method = verb (GET, PUT, POST, DELETE etc)

What are headers? metadata, useful for debugging :) 

```

    HttpRequest.META (or call HttpRequest.headers): A dictionary containing all available HTTP headers. Available headers depend on the client and server -- some examples:

    CONTENT_LENGTH – The length of the request body (as a string).

    CONTENT_TYPE – The MIME type of the request body.

    HTTP_ACCEPT – Acceptable content types for the response.

    HTTP_ACCEPT_ENCODING – Acceptable encodings for the response.

    HTTP_ACCEPT_LANGUAGE – Acceptable languages for the response.

    HTTP_HOST – The HTTP Host header sent by the client.

    HTTP_REFERER – The referring page, if any.

    HTTP_USER_AGENT – The client’s user-agent string.

    QUERY_STRING – The query string, as a single (unparsed) string.

    REMOTE_ADDR – The IP address of the client.

    REMOTE_HOST – The hostname of the client.

    REMOTE_USER – The user authenticated by the Web server, if any.

    REQUEST_METHOD – A string such as "GET" or "POST".

    SERVER_NAME – The hostname of the server.

    SERVER_PORT – The port of the server (as a string).

```

What is http body? the content/resource that is being sent

Status Codes: 1XX - informational; 2XX - successful; 3XX - redirect; 4XX - client error; 5XX - server error

Absolute vs Relative path - absolute means the full path; relative is the path from the cwd

What are sessions - stored states shared between the browser and the server that 'keep place' of where the user is in a sequence, by storing cookie data

Cookies tell the server who you are, if you've visited before, where you have been. strings of data passed between server and client to create a stateful session

What is a proxy? hardware or software service acting as a middle man between client and server. Used when server IP has been hidden or a client sits behind a firewall

Cache - a method for storing data on the client or server to improve performance. Cache headers will give instructions about when to store, clear, update cache.

Controller = views = method

Django forms.Forms vs forms.ModelForms -- form.Forms do not interact with the database, can be manually configured. An example would be a contact form on a website. form.ModelForms are based on a model, and automatically use the fields from the model. These should be used when form submissions are going to be used to directly add or edit a Django model, which will help avoid duplicating the model.

HTML - base.html template carries across other .html templates in a project, and getting  a better sense of how html is laid out (what elements go where, what they do)

IP - the protocol used to transfer data between computers over a networks. All devices connected to a network have an IP address. 

TCP Transmission Control Protocol - a main internet protocol used by www, email, ftp...

DNS - Domain Name Server - catalogs domain name URLs and points them to the IP address of the server. 
