# ReSA System Setup - Product Architecture (ReSA OG Ch 2, 3, 4)

This reference documents the **Oracle Retail Sales Audit (ReSA)** ADF technical architecture, security role hierarchy, taskflow navigation, and MDS customization framework.

---

## 1. ADF Technical Architecture Layers

```mermaid
graph TD
    subgraph ADF User Interface Layer
        UI[ReSA ADF Taskflows & View Objects]
        MDS[Oracle Metadata Services - MDS Customization]
    end

    subgraph Security Layer
        OPSS[Oracle Platform Security Services - OPSS]
        RoleHierarchy[Sales Auditor / Supervisor / Admin Roles]
    end

    subgraph Business Logic & Persistence Layer
        AM[Application Module - ReSA AM]
        VO[View Objects / Entity Objects]
        DB[Oracle Database Schema]
    end

    UI --> MDS
    UI --> OPSS
    OPSS --> RoleHierarchy
    UI --> AM
    AM --> VO
    VO --> DB
```

---

## 2. Default Security Role Hierarchy

| Job Role | Duty Role | Granted Access & Privileges |
| :--- | :--- | :--- |
| **Sales Auditor** | `Sales Auditor Duty` | Transaction audit workspace, error resolution, cashier balancing. |
| **Audit Supervisor** | `Audit Supervisor Duty` | Error overrides, store day status modifications, rule definitions. |
| **Sales Audit Admin** | `Sales Audit Admin Duty` | System options, error codes setup, parameter definitions, GL mapping. |
