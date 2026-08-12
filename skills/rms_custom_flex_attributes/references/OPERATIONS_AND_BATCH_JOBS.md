# Custom Flex Attributes (CFA) & Localization Engine Workflows

## 1. Core Business Concepts
1. **Custom Flex Attributes (CFA):** Provides extensible, user-defined attribute fields (`CFA_ATTRIB`) on core RMS entities (Items, Orders, Suppliers, Transfers, Locations) without requiring database schema DDL modifications.
2. **Localization (L10N):** Handles country-specific legal, fiscal, and regulatory data descriptors (`L10N_DOC`) required for international operations (e.g., Brazil NFE, India GST, Europe Intrastat).

## 2. Data Model Mapping
- `CFA_ATTRIB`: Attribute metadata, data type, validation rules, UI widget format.
- `CFA_CLASS`: Entity linking (Item CFA, PO CFA, Supplier CFA).
- `L10N_DOC`: Country localization document headers.
