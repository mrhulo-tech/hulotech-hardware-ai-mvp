# HuloTech Hardware AI Platform

## API Specification (MVP)

Base URL

/api/v1

---

# Chat Assistant

POST /chat

Request

{
 "session_id": "uuid",
 "message": "I want to build a 12x12 deck"
}

Response

{
 "assistant_message": "Here is the list of materials for your project",
 "project_id": "uuid"
}

---

# Project Builder

POST /projects

Request

{
 "session_id": "uuid",
 "prompt": "Build a 12x12 deck"
}

Response

{
 "project_id": "uuid",
 "status": "created"
}

---

GET /projects/{project_id}

Response

{
 "project_id": "uuid",
 "title": "12x12 Deck",
 "items": [
   {
     "sku": "SKU123",
     "name": "Pressure Treated Board",
     "quantity": 24
   }
 ]
}

---

# Product Search

GET /products/search?q=deck+screws

Response

[
 {
   "sku": "SKU124",
   "name": "Deck Screws",
   "price": 9.99
 }
]

---

# Inventory Check

POST /inventory/check

Request

{
 "postal_code": "H2X1Y4",
 "items": [
   {"sku": "SKU123", "quantity": 24}
 ]
}

Response

{
 "stores": [
   {
     "name": "Store A",
     "distance_km": 3,
     "available": true
   }
 ]
}

---

# Vision Part Identification

POST /vision/scan

Upload image

Response

{
 "scan_id": "uuid",
 "candidates": [
   {
     "name": "Hex Bolt M8",
     "confidence": 0.74
   }
 ]
}

---

# Cart

POST /cart/create

Request

{
 "session_id": "uuid"
}

Response

{
 "cart_id": "uuid"
}

---

POST /cart/add

Request

{
 "cart_id": "uuid",
 "sku": "SKU123",
 "quantity": 24
}

Response

{
 "status": "added"
}
