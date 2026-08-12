# RMS_FORECASTING_PLANNING - System Options & Implementation Configurations

This reference documents the system options, parameter configuration flags, operational rules, and setup parameters for `rms_forecasting_planning`.

---

## 1. System Options & Parameters (`SYSTEM_OPTIONS`)

| Parameter Name | Default / Values | Config Level | Detailed Business & Functional Impact |
| :--- | :--- | :--- | :--- |
| `SYSTEM_IND` | `Y` / `N` | System | Enables module operational features within the enterprise merchandising suite. |
| `AUDIT_TRAIL_IND` | `Y` / `N` | System | Controls historical audit log tracking for master record updates. |
| `RETAIN_DAYS` | `90` Days | System | Number of days transaction records are retained before automated system purge. |

---

## 2. Operational Rules & Validation Constraints

1. **Data Integrity Guarantee**: All master entities must satisfy primary key and foreign key constraint validations before persistence.
2. **System Parameter Flags**: Module operational modes are controlled via global settings in `SYSTEM_OPTIONS`.
