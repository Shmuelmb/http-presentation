---
# You can also start simply with 'default'
theme: seriph
# random image from a curated Unsplash collection by Anthony
# like them? see https://unsplash.com/collections/94734566/slidev
background: https://cover.sli.dev
# some information about your slides (markdown enabled)
title: HTTP PROTOCOL

# apply unocss classes to the current slide
class: text-center
# https://sli.dev/features/drawing
drawings:
  persist: false
# slide transition: https://sli.dev/guide/animations.html#slide-transitions
transition: slide-left
# enable MDC Syntax: https://sli.dev/features/mdc
mdc: true
# take snapshot for each slide in the overview
overviewSnapshots: true
---

# HTTP PROTOCOL

WHAT IS HTTP PROTOCOL AND HOW IT WORKS?

<div class="pt-12">
  <span @click="$slidev.nav.next" class="px-2 py-1 rounded cursor-pointer" hover="bg-white bg-opacity-10">
    Press Space for next page <carbon:arrow-right class="inline"/>
  </span>
</div>

<!--
The last comment block of each slide will be treated as slide notes. It will be visible and editable in Presenter Mode along with the slide. [Read more in the docs](https://sli.dev/guide/syntax.html#notes)
-->

---

# What is HTTP Protocol?

**Definition**

<v-clicks  every="1">

HTTP (HyperText Transfer Protocol) is the foundation of data communication on the web.
It is a protocol that allows web clients (e.g., browsers) and servers to communicate by exchanging requests and responses.

**_Stateless_**: Each request from the client is independent; the server does not retain any state information between requests.

**OK, but how does it work?**
<br/>
User enters a web address (http://example.com) in their browser.
<br/>
Browser (client) sends an HTTP request to the server hosting example.com.
<br/>
Server responds with an HTTP response containing the requested page or resource.
</v-clicks>

<!--
You can have `style` tag in markdown to override the style for the current page.
Learn more: https://sli.dev/features/slide-scope-style
-->

<style>
h1 {
  background-color: #2B90B6;
  background-image: linear-gradient(45deg, #4EC5D4 10%, #146b8c 20%);
  background-size: 100%;
  -webkit-background-clip: text;
  -moz-background-clip: text;
  -webkit-text-fill-color: transparent;
  -moz-text-fill-color: transparent;
}
</style>

<!--
Here is another comment.
-->

---
layout: image

# the image source

image: images/osi.png
backgroundSize: contain

---

---

# URL

**Definition**

The URL (Uniform Resource Locator) is a string that specifies the location of a resource on the web.
<br/>
It serves as the address used to access resources on the internet, such as web pages, images, and other files.

<v-clicks>

**Structure**
<br/>
https://www.ynet.co.il:443/news/article/yokra14145847?page=1
<br/>

**Lets break it down:**
<br/>

protocol://subdomain.host:port/path?query

- Protocol: Defines how to access the resource (e.g., http, https)
- Hostname: The domain name or IP address of the server hosting the resource (e.g., example.com)
- Path: The path to the resource (e.g., /path/to/resource)
- Port (optional): The port number (More info in the next slide)
- Query parameters (optional): Additional information passed to the server.
- Subdomain (optional): Additional levels of subdomains (e.g., ```weglot.com``` and ```dashboard.weglot.com```)

</v-clicks>
<!--
You can have `style` tag in markdown to override the style for the current page.
Learn more: https://sli.dev/features/slide-scope-style
-->

<style>
h1 {
  background-color: #2B90B6;
  background-image: linear-gradient(45deg, #4EC5D4 10%, #146b8c 20%);
  background-size: 100%;
  -webkit-background-clip: text;
  -moz-background-clip: text;
  -webkit-text-fill-color: transparent;
  -moz-text-fill-color: transparent;
}
</style>

---

# HTTP & Ports

<br/>
 A port is a virtual software-based point where network connections start and end. All network-connected computers expose a number of ports to enable them to receive traffic. Each port is associated with a specific process or service, and different protocols use different ports
<br/>
HTTP uses different ports for different services. <br/>Here are some of the most common ports:

- 80: HTTP
- 443: HTTPS
- 8080: HTTP Proxy
- And more...

HTTP can work on any port, but it is recommended to use well-known ports like 80 for HTTP and 443 for HTTPS.

---

# URL

**Examples**

- http://example.com - Default port
- https://example.com - https protocol
- http://example.com/path/to/resource - With path
- http://example.com:8080 - With port
- http://example.com?param1=value1&param2=value2 - With query parameters
- http://app.example.com - With subdomains

---

# Request and Response data flow

**Definition**

HTTP communication follows a request-response model, where a client (e.g., web browser) makes a request to the server, and the server processes it and sends back a response.
<br/>

**Request Flow**

- Client sends an HTTP request to the server.
- Server processes the request and generates a response.

**Response Flow**

- Server sends an HTTP response to the client.
- Client processes the response and displays the content to the user.

---

**Request Structure**

- URL: Identifies the resource being requested.
- Method: Specifies the action to be performed (e.g., GET, POST, PUT).
- Headers: Additional information (e.g., User-Agent, Accept).
- Body: Data sent with the request (only for certain methods like POST or PUT).

**Request Methods**

- GET: Retrieves data from a specified resource, in this method we don't send any data to the server.
- POST: Submits data to a server for processing. (Non-idempotent method )
- PUT: Replaces a resource on the server. (Idempotent method)
- DELETE: Removes a resource from the server. (Idempotent method)

---

**Request Example**
<v-clicks>
To get all users, we send a GET request to the server.

```http
GET https://jsonplaceholder.typicode.com/users

```

Let's say we want to create a new user in our system.
To do that we send a POST request to the server.

```http
POST https://jsonplaceholder.typicode.com/users
```

```json
{
  "id": 1,
  "name": "John Doe",
  "age": 30,
  "email": "TmKJ9@example.com"
}
```
</v-clicks>
---


<v-clicks>
To do update the name of the user, we send a PUT request to the server.

```http
PUT https://jsonplaceholder.typicode.com/users/1
```

```json
{
  "name": "Shmuel Cohen"
}
```

To delete the user, we send a DELETE request to the server.

```http
DELETE https://jsonplaceholder.typicode.com/users/1
```
</v-clicks>

---

**Response Structure**

<v-clicks>
After the client makes a request, the server responds with a message.
<br/>The response includes a status code, headers, and optionally, a body containing data. <br/>The type of response varies based on the request type and server processing.

The response structure is as follows:

```http
HTTP/1.1 200 OK
Content-Type: text/html
Content-Length: 123

...(optional body)
```

**Status Codes**

- Informational responses (100 – 199), such as 100 Continue
- Successful responses (200 – 299), such as 200 OK
- Redirection messages (300 – 399), such as 301 Moved Permanently
- Client error responses (400 – 499), such as 400 Bad Request
- Server error responses (500 – 599), such as 500 Internal Server Error

</v-clicks>

--- 

**Response Example**

To get all users from the server, we send a GET request to the server.

```http
GET https://jsonplaceholder.typicode.com/users

```

```http
HTTP/1.1 200 OK
Content-Type: json
Content-Length: 123

[
  {
  "id": 1,
  "name": "John Doe",
  "age": 30,
  "email": "TmKJ9@example.com"
  },
  ...
]
```

---


But if we try to GET something that doesn't exist, we get the following response.

```http
GET https://jsonplaceholder.typicode.com/users/1234

```

```http
HTTP/1.1 404 Not Found
Content-Type: json
Content-Length: 123

{
  "error": "User not found"
}
```

---

# HTTPS

**Definition**

**What is HTTPS?**
<br/>
HTTPS stands for HyperText Transfer Protocol Secure. is an encrypted version of HTTP. It uses a secure protocol to encrypt the data being transmitted.
<br/>
It provides additional security features, such as authentication, encryption, and data integrity.
<br/>
Today all the web traffic is encrypted using HTTPS.

**_How does HTTPS work?_**

- Hello Messages: The client and server introduce themselves and agree on how to communicate securely.
- Server Sends Certificate: The server proves its identity with a certificate (SSL/TLS).
- Client Checks Certificate: The client makes sure the certificate is valid and trusted.
- Secure Key Exchange: The client and server create a shared secret key.
- Secure Communication: All messages are encrypted using the shared key.

For example in this site http://httpforever.com/ there is no encryption and the browser will display us that the page is not secure.
