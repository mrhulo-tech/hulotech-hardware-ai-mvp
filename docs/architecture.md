# HuloTech Hardware AI Platform

## System Architecture

```mermaid
flowchart TB
  WebApp --> API
  API --> LLM
  API --> Database
  API --> InventoryService
  API --> VisionService
  API --> CartService
  API --> ProductSearch

  LLM --> Tools
  Tools --> ProductSearch
  Tools --> InventoryService
  Tools --> CartService

  Database[(PostgreSQL)]
  Vector[(Vector DB)]
  Storage[(Object Storage)]
