# Tariffs & Customs Duties (HTS) Functional Workflows & Operations

## 1. Core Business Concepts
International trade compliance requires assessing customs duties and tariffs based on the global Harmonized Tariff Schedule (HTS).

### Tariff Calculation Types:
1. **Ad Valorem Duty:** Percentage fee calculated against the commercial invoice value of imported items.
2. **Specific Duty:** Flat monetary fee assessed per unit, weight, or volume (e.g., $0.50 per kilogram).
3. **Compound Duty:** Combination of percentage (Ad Valorem) and flat unit fee (Specific Duty).
4. **Anti-Dumping Duties & Quotas:** Special regulatory assessments applied to specific origin countries.

## 2. Nightly Batch Architecture
- `htsupdate.pc`: Updates tariff percentage rates and HTS chapter classification rules.
- `htspurge.pc`: Purges expired tariff rate historical records.
